import dotenv from "dotenv";
import mercadopago from "mercadopago"; // Import MercadoPago SDK
import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";
import { sendOrderConfirmationEmail, sendOrderNotificationToAdmin } from "../../services/emailService.js";

dotenv.config();

mercadopago.configurations.setAccessToken(process.env.MERCADO_PAGO_TOKEN);

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

// DELETE an order
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

// CREATE an order logic
export async function createOrderLogic(orderData) {
  try {
    const order = await prisma.order.create({
      data: {
        paymentDate: new Date(orderData.paymentDate),
        payerEmail: orderData.payerEmail,
        payerDocumentType: orderData.payerDocumentType,
        payerDocumentNumber: orderData.payerDocumentNumber,
        installments: orderData.installments,
        paymentMethodId: orderData.paymentMethodId,
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
          create: orderData.cart.map(item => ({
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

// CREATE an order
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

// CREATE MercadoPago payment logic
export async function createPaymentLogic(paymentData) {
  const paymentPayload = {
    transaction_amount: paymentData.transactionAmount,
    description: "Product payment",
    payment_method_id: paymentData.paymentMethodId,
    payer: { email: paymentData.payerEmail },
    installments: paymentData.installments,
    token: paymentData.token,
    issuer_id: paymentData.issuerId,
  };

  try {
    // console.log(paymentData);
    console.log("createPaymentLogic", paymentData.payerEmail, "About to create a payment...");
    const payment = await mercadopago.payment.create(paymentPayload);
    console.log("createPaymentLogic", paymentData.payerEmail, "Payment created");
    return payment.response;
  } catch (error) {
    throw new Error(`Failed to process payment with MercadoPago: ${error.message}`);
  }
}

// CREATE MercadoPago payment
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

export async function generateCardTokenLogic(cardData) {
  // console.log(cardData);
  try {
    // Create card token
    // This validates the card data and returns a token
    const responseCreateCardToken = await mercadopago.card_token.create({
      card_number: cardData.cardNumber,
      expiration_month: cardData.cardExpirationMonth,
      expiration_year: cardData.cardExpirationYear,
      security_code: cardData.securityCode,
      cardholder: {
        name: cardData.cardholderName,
        identification: {
          type: cardData.docType,
          number: cardData.docNumber,
        },
      },
    });

    const tokenData = responseCreateCardToken.response;
    const cardTokenResponse = {
      token: tokenData.id,
    };
    return cardTokenResponse;
  } catch (error) {
    throw new Error(`Error creating card token: ${error.message}`);
  }
}

// TODO: This one is actually never because of the bricks
export async function generateCardToken(req, res) {
  try {
    const tokenResponse = await generateCardTokenLogic(req.body);
    return responseSuccess({
      res,
      data: tokenResponse,
      status: 200,
    });
  } catch (error) {
    return responseError({
      res,
      data: error.message,
      status: 500,
    });
  }
}

// CREATE MercadoPago order
export async function createMercadoPagoOrder(req, res) {
  try {
    const order = await createOrderLogic(req.body);
    const paymentData = {
      transactionAmount: req.body.transactionAmount,
      description: "Product payment",
      paymentMethodId: req.body.paymentMethodId,
      payerEmail: req.body.payerEmail,
      installments: req.body.installments,
      token: req.body.token,
      issuerId: req.body.issuerId,
    };

    const mercadoPagoResponse = await createPaymentLogic(paymentData);

    const updatedOrder = await prisma.order.update({
      where: { id: order.id },
      data: { paymentId: mercadoPagoResponse.id },
    });

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

///////////////////////////// EMAIL ////////////////////////////

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
