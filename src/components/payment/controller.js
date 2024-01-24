import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";

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
    const existingUser = await prisma.user.findUnique({
      where: {
        id: req.body.userId,
      },
    });

    if (!existingUser) {
      return responseError({ res, data: "User not found" });
    }

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
