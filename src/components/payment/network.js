import { Router } from "express";
import * as Controller from "./controller.js";

const paymentRouter = Router();

////////// CRUD /////////////
paymentRouter.route("/").get(Controller.list)
paymentRouter.route("/get-by-user").get(Controller.getByUserId)
paymentRouter.route("/delete").delete(Controller.destroy)

// GENERATE PAYMENT on Mercado Pago
paymentRouter.route("/generate").post(Controller.generatePayment)

export default paymentRouter;