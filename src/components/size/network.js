import { Router } from "express";
import * as Controller from "./controller.js";

const sizeRouter = Router();

sizeRouter.route("/").get(Controller.list);
sizeRouter.route("/:id").get(Controller.list);
sizeRouter.route("/").post(Controller.store);
sizeRouter.route("/:id").put(Controller.update);
sizeRouter.route("/:id").delete(Controller.destroy);

export default sizeRouter;
