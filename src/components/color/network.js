import { Router } from "express";
import * as Controller from "./controller.js"

const colorRouter = Router();

colorRouter.route("/").get(Controller.list)
colorRouter.route("/:id").get(Controller.list)
colorRouter.route("/").post(Controller.store)
colorRouter.route("/:id").put(Controller.update)
colorRouter.route("/:id").put(Controller.destroy)

export default colorRouter;