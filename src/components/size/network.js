import { Router } from "express";
import * as Controller from "./controller.js"

const sizeRouter = Router();

sizeRouter.route("/").get(Controller.list)

export default sizeRouter;