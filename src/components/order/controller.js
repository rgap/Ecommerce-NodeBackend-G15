import axios from "axios";
import dotenv from "dotenv";
import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";

dotenv.config(); // Cargar variables de entorno desde el archivo .env

///////////////////////////// CRUD ////////////////////////////

// Get all orders
export async function list(req, res) {
  try {
    const orders = await prisma.order.findMany();
    return responseSuccess({ res, data: orders, status: 200 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// Get orders by USER
export async function getOrdersByUserId(req, res) {
  try {
    const userId = parseInt(req.params.userId); // Assuming userId is passed as a URL parameter
    const orders = await prisma.order.findMany({
      where: {
        userId: userId,
      },
      // include: {
      //   OrderItem: true, // If you want to include order items in the response
      // },
    });

    if (orders.length === 0) {
      return responseError({
        res,
        data: "No orders found for this user.",
        status: 404,
      });
    }

    return responseSuccess({ res, data: orders, status: 200 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// Delete an order
export async function destroy(req, res) {
  try {
    const orderId = parseInt(req.params.id); // Assuming orderId is passed as a URL parameter
    await prisma.order.delete({
      where: {
        id: orderId,
      },
    });
    return responseSuccess({
      res,
      data: "Order deleted successfully.",
      status: 200,
    });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

///////////////////////////// MERCADOPAGO ////////////////////////////

// Create Order and process payment through MercadoPago
export async function createOrderMercadoPago(req, res) {
  const {
    paymentDate,
    payerEmail,
    payerDocumentType,
    payerDocumentNumber,
    installments,
    issuerId,
    paymentMethodId,
    token,
    status,
    transactionAmount,
    userId,
    cart,
  } = req.body;

  let order;

  // Try to create the order
  try {
    order = await prisma.order.create({
      data: {
        paymentDate: new Date(paymentDate),
        payerEmail,
        payerDocumentType,
        payerDocumentNumber,
        installments,
        issuerId,
        paymentMethodId,
        token,
        status,
        amount: parseFloat(transactionAmount),
        userId,
        OrderItem: {
          create: cart.map((item) => ({
            productId: parseInt(item.id.split(".")[0]),
            name: item.name,
            color: item.color,
            imageUrl: item.url,
            quantity: item.quantity,
            price: parseFloat(item.price),
          })),
        },
      },
    });
  } catch (error) {
    console.error("Error creating order in database:", error);
    return responseError({
      res,
      data: "Failed to create order in database.",
      status: 500,
    });
  }

  // Prepare data for MercadoPago API call
  const mercadoPagoData = {
    description: "Product purchase",
    installments,
    issuer_id: issuerId,
    payer: { email: payerEmail },
    payment_method_id: paymentMethodId,
    token,
    transaction_amount: parseFloat(transactionAmount),
    // Additional data can be added here as needed
  };

  // Try to make the API call to MercadoPago
  let mercadoPagoResponse;
  try {
    mercadoPagoResponse = await axios.post(
      "https://api.mercadopago.com/v1/payments",
      mercadoPagoData,
      {
        headers: {
          "X-Idempotency-Key": "0d5020ed-1af6-469c-ae06-c3bec19954bb",
          Authorization: `Bearer ${process.env.MERCADO_PAGO_TOKEN}`,
          "Content-Type": "application/json",
        },
      }
    );
  } catch (error) {
    console.error("Error calling MercadoPago API:", error);
    return responseError({
      res,
      data: "Failed to process payment with MercadoPago.",
      status: 500,
    });
  }

  // Update the order with the payment ID from MercadoPago
  const paymentId = mercadoPagoResponse.data.id;
  const updatedOrder = await prisma.order.update({
    where: { id: order.id },
    data: { paymentId },
  });

  // Try to update the order with the payment ID from MercadoPago
  try {
    const paymentId = mercadoPagoResponse.data.id;
    await prisma.order.update({
      where: { id: order.id },
      data: { paymentId },
    });
    return responseSuccess({
      res,
      data: { orderId: order.id },
      status: 200,
    });
  } catch (error) {
    console.error("Error updating order with payment ID:", error);
    return responseError({
      res,
      data: "Failed to update order with payment ID.",
      status: 500,
    });
  }
}
