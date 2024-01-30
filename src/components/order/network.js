import { Router } from "express";
import * as Controller from "./controller.js";

const orderRouter = Router();

////////// CRUD /////////////
orderRouter.route("/").get(Controller.list);
orderRouter.route("/:userId").get(Controller.getOrdersByUserId);
orderRouter.route("/:id").delete(Controller.destroy);
orderRouter.route("/").post(Controller.createOrder);

// CORREOS
orderRouter
  .route("/send-order-email-to-user")
  .post(Controller.sendOrderEmailToUser);
orderRouter
  .route("/send-order-email-to-admin")
  .post(Controller.sendOrderEmailToAdmin);

// CREATE ORDER - MERCADOPAGO
orderRouter.route("/create-payment").post(Controller.createPayment);
orderRouter
  .route("/create-mercadopago-order")
  .post(Controller.createMercadoPagoOrder);

export default orderRouter;
