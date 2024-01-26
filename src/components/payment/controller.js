import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";
// Axios es como Requires (Django)
import axios from "axios";
import dotenv from "dotenv";

dotenv.config(); // Cargar variables de entorno desde el archivo .env
const { MERCADO_PAGO_TOKEN } = process.env;

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

// Create Payment
export async function generatePayment(req, res) {
  try {
    console.log("lo que envia front", req.body);
    // Create a tabla Payment
    const payments = await prisma.payment.create({
      data: {
        paymentDate: req.body.payment_date,
        payerEmail: req.body.payer_email,
        payerDocumentType: req.body.payer_document_type,
        payerDocumentNumber: req.body.payer_document_number,
        installments: req.body.installments,
        issuerId: req.body.issuer_id,
        paymentMethodId: req.body.payment_method_id,
        token: req.body.token,
        status: req.body.status,
        amount: req.body.transaction_amount,
        userId: req.body.userId,
      },
    });

    if (!payments) {
      return responseError({ res, data: "Payment not created." });
    }

    // Datos para la solicitud a MercadoPago
    const data = {
      description: "Prima venta",
      installments: req.body.installments,
      issuer_id: req.body.issuer_id,
      payer: {
        email: req.body.payer_email,
      },
      payment_method_id: req.body.payment_method_id,
      token: req.body.token,
      transaction_amount: req.body.transaction_amount,
    };

    console.log("Entrando a mercado pago", data);

    // Realizar la solicitud a MercadoPago
    const mercadoPagoResponse = await axios.post(
      "https://api.mercadopago.com/v1/payments",
      data,
      {
        headers: {
          "X-Idempotency-Key": "0d5020ed-1af6-469c-ae06-c3bec19954bb",
          Authorization: MERCADO_PAGO_TOKEN,
          "Content-Type": "application/json",
        },
      }
    );
    console.log("Respuesta de MercadoPago:");
    console.log(mercadoPagoResponse.data);

    //Update a Payment by Token
    const idMercadoPago = mercadoPagoResponse.data.id;
    console.log("Mercado pago ID", idMercadoPago);
    try {
      const payments = await prisma.payment.updateMany({
        where: {
          token: req.body.token,
        },
        data: { paymentId: idMercadoPago },
      });
      if (!payments) {
        return responseError({ res, data: "Payment not found" });
      }
      return responseSuccess({ res, data: idMercadoPago });

    } catch (error) {
      return responseError({ res, data: error.message });
    }

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
