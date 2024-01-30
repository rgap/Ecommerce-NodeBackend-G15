import axios from "axios";
import dotenv from "dotenv";
import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";
import {
  sendOrderConfirmationEmail,
  sendOrderNotificationToAdmin,
} from "../../services/emailService.js";
import { formatAmount } from "../../utils/utils.js";

dotenv.config();

///////////////////////////// CRUD ////////////////////////////

// GET ALL ORDERS
export async function list(req, res) {
  try {
    const orders = await prisma.order.findMany({
      include: {
        Item: true,
      },
    });
    return responseSuccess({ res, data: orders, status: 200 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// GET ORDERS BY USER
export async function getOrdersByUserId(req, res) {
  try {
    const userId = parseInt(req.params.userId);
    const orders = await prisma.order.findMany({
      where: {
        userId: userId,
      },
      // include: {
      //   Item: true, // Para incluir order items en la respuesta
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
    const orderId = parseInt(req.params.id);
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

// Function to handle the core logic of creating an order
export async function createOrderLogic(orderData) {
  try {
    const order = await prisma.order.create({
      data: {
        paymentDate: new Date(orderData.paymentDate),
        payerEmail: orderData.payerEmail,
        payerDocumentType: orderData.payerDocumentType,
        payerDocumentNumber: orderData.payerDocumentNumber,
        installments: orderData.installments,
        issuerId: orderData.issuerId,
        paymentMethodId: orderData.paymentMethodId,
        token: orderData.token,
        status: orderData.status,
        amount: orderData.transactionAmount,
        shippingMethod: orderData.shippingMethod,
        shippingName: orderData.billingName,
        shippingAddress: orderData.billingAddress,
        shippingCity: orderData.billingCity,
        shippingRegion: orderData.billingRegion,
        shippingPhoneNumber: orderData.billingPhoneNumber,
        billingName: orderData.billingName,
        billingAddress: orderData.billingAddress,
        billingCity: orderData.billingCity,
        billingRegion: orderData.billingRegion,
        billingPhoneNumber: orderData.billingPhoneNumber,
        userId: orderData.userId,
        Item: {
          create: orderData.cart.map((item) => ({
            productId: parseInt(item.id.split(".")[0]),
            title: item.title,
            color: item.color,
            imageUrl: item.url,
            quantity: item.quantity,
            price: parseFloat(item.price),
          })),
        },
      },
    });
    return order;
  } catch (error) {
    throw new Error(`Failed to create order in database: ${error.message}`);
  }
}

// Controller function to handle the HTTP request for creating an order
export async function createOrder(req, res) {
  try {
    const order = await createOrderLogic(req.body);
    return responseSuccess({
      res,
      data: order,
    });
  } catch (error) {
    return responseError({
      res,
      data: error.message,
      status: 500,
    });
  }
}

// Function to handle the core logic of creating a MercadoPago payment
export async function createPaymentLogic(paymentData) {
  const mercadoPagoData = {
    description: "Product payment",
    installments: paymentData.installments,
    issuer_id: paymentData.issuerId,
    payer: { email: paymentData.payerEmail },
    payment_method_id: paymentData.paymentMethodId,
    token: paymentData.token,
    transaction_amount: paymentData.transactionAmount,
  };

  try {
    const mercadoPagoResponse = await axios.post(
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
    return mercadoPagoResponse.data;
  } catch (error) {
    throw new Error(
      `Failed to process payment with MercadoPago: ${error.message}`
    );
  }
}

// Controller function to handle the HTTP request for MercadoPago payment
export async function createPayment(req, res) {
  try {
    const paymentResponse = await createPaymentLogic(req.body);
    return responseSuccess({
      res,
      data: paymentResponse,
    });
  } catch (error) {
    return responseError({
      res,
      data: error.message,
      status: 500,
    });
  }
}

///////////////////////////// MERCADOPAGO ////////////////////////////

// CREATE MERCADOPAGO ORDER
export async function createMercadoPagoOrder(req, res) {
  try {
    // Step 1: Create an order using the createOrderLogic function
    const order = await createOrderLogic(req.body);

    // Step 2: Prepare payment data for MercadoPago
    const paymentData = {
      // Extract or construct payment data from req.body or order
      installments: req.body.installments,
      issuerId: req.body.issuerId,
      payerEmail: req.body.payerEmail,
      paymentMethodId: req.body.paymentMethodId,
      token: req.body.token,
      transactionAmount: req.body.transactionAmount,
    };

    // Step 3: Create a MercadoPago payment using the createMercadoPagoPaymentLogic function
    const mercadoPagoResponse = await createPaymentLogic(paymentData);

    // Step 4: Update the order with payment information from MercadoPago
    const updatedOrder = await prisma.order.update({
      where: { id: order.id },
      data: { paymentId: mercadoPagoResponse.id },
    });

    // Step 5: Send a successful response with order and payment information
    return responseSuccess({
      res,
      data: { order: updatedOrder, payment: mercadoPagoResponse },
      status: 200,
    });
  } catch (error) {
    console.error("Error in createMercadoPagoOrder:", error);
    return responseError({
      res,
      data: error.message,
      status: 500,
    });
  }
}

///////////////////////////// CORREOS ////////////////////////////

export async function sendOrderEmailToUser(req, res) {
  try {
    const order = req.body;

    await sendOrderConfirmationEmail(order);

    return responseSuccess({
      res,
      data: "Order confirmation email successfully sent to the user.",
      status: 200,
    });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

export async function sendOrderEmailToAdmin(req, res) {
  try {
    const order = req.body;

    await sendOrderNotificationToAdmin(order);

    return responseSuccess({
      res,
      data: "Notification of new order sent to the administrator successfully.",
      status: 200,
    });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
