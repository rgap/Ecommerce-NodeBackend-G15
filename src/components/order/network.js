import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Ensure the path is correct
import * as Controller from "./controller.js";

const orderRouter = Router();

////////// CRUD /////////////
orderRouter.route("/").get(verifyStaticToken, Controller.list);
orderRouter.route("/:userId").get(verifyStaticToken, Controller.getOrdersByUserId);
orderRouter.route("/:id").delete(verifyStaticToken, Controller.destroy);
orderRouter.route("/").post(verifyStaticToken, Controller.createOrder);

// Protecting routes for email notifications
// CORREOS
orderRouter.route("/send-order-email-to-user").post(verifyStaticToken, Controller.sendOrderEmailToUser);
orderRouter.route("/send-order-email-to-admin").post(verifyStaticToken, Controller.sendOrderEmailToAdmin);

// Protecting payment-related routes
// CREATE ORDER - MERCADOPAGO
orderRouter.route("/create-payment").post(verifyStaticToken, Controller.createPayment);
orderRouter.route("/create-mercadopago-order").post(verifyStaticToken, Controller.createMercadoPagoOrder);

export default orderRouter;
