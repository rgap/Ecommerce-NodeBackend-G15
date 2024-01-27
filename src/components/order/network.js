import { Router } from "express";
import * as Controller from "./controller.js";

const orderRouter = Router();

////////// CRUD /////////////
orderRouter.route("/").get(Controller.list);
orderRouter.route("/:userId").get(Controller.getOrdersByUserId);
orderRouter.route("/:id").delete(Controller.destroy);
orderRouter
  .route("/send-order-email-to-user")
  .post(Controller.sendOrderEmailToUser);
orderRouter
  .route("/send-order-email-to-admin")
  .post(Controller.sendOrderEmailToAdmin);

// GENERATE Payment - Mercado Pago
orderRouter
  .route("/create-order-mercadopago")
  .post(Controller.createOrderMercadoPago);

export default orderRouter;
