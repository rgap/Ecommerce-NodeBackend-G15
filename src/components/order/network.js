import { Router } from "express";
import * as Controller from "./controller.js";

const orderRouter = Router();

////////// CRUD /////////////
orderRouter.route("/").get(Controller.list);
orderRouter.route("/:userId").get(Controller.getOrdersByUserId);
orderRouter.route("/:id").delete(Controller.destroy);

// GENERATE Payment - Mercado Pago
orderRouter
  .route("/create-order-mercadopago")
  .post(Controller.createOrderMercadoPago);

export default orderRouter;
