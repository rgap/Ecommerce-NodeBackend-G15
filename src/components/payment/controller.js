import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";
// Axios es como Requires (Django)
import axios from "axios";

// C R U D

// Get all payments
export async function list(req, res) {
  try {
    const payments = await prisma.payment.findMany();
    return responseSuccess({ res, data: payments, status: 203 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// Get Payments by USER
export async function getByUserId(req, res) {
  try {
    const payments = await prisma.payment.findMany({
      where: {
        userId: req.body.userId,
      },
    });

    if (!payments) {
      return responseError({ res, data: "Payment not found for this User." });
    }

    responseSuccess({ res, data: product });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// Update Payment Status
export async function updatePaymentStatus(req, res) {}

// Create Payment
export async function generatePayment(req, res) {
  try {
    // Datos para la solicitud a MercadoPago
    console.log("estoy aqui");

    console.log(req.body);

    const data = {
      description: "Primera venta",
      installments: req.body.installments,
      issuer_id: req.body.issuer_id,
      payer: {
        email: req.body.payer_email,
      },
      payment_method_id: req.body.payment_method_id,
      token: req.body.token,
      transaction_amount: req.body.transaction_amount,
    };

    console.log(data);

    // Realizar la solicitud a MercadoPago
    const mercadoPagoResponse = await axios.post(
      "https://api.mercadopago.com/v1/payments",
      data,
      {
        headers: {
          "X-Idempotency-Key": "0d5020ed-1af6-469c-ae06-c3bec19954bb",
          Authorization:
            "Bearer TEST-5534289180663903-012221-a6e61dd9750ba9f1f7ff4620ffad1046-1651048382",
          "Content-Type": "application/json",
        },
      }
    );

    console.log("Respuesta de MercadoPago:");
    console.log("-----------");
    console.log(mercadoPagoResponse.data);
    console.log("-----------");

    await prisma.payment.create({
      data: req.body,
    });

    return responseSuccess({ res, data: "Payment created", status: 201 });

  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// Delete Payment
export async function destroy(req, res) {
  try {
    await prisma.payment.deleteMany({
      where: {
        userId: req.body.userId,
      },
    });
    return responseSuccess({ res, data: "Payment deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
