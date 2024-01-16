import { Router } from "express";
import * as Controller from "./controller.js"

const colorRouter = Router();

colorRouter.route("/").get(Controller.list)

export default colorRouter;