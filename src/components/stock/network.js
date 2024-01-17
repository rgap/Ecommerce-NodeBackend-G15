import { Router } from "express";
import * as Controller from "./controller.js";

const stockRouter = Router();

//stockRouter.route("/:belen/:colorId/:sizeId").get(Controller.list)
stockRouter.route("/:id").get(Controller.list);
stockRouter.route("/").post(Controller.store);
stockRouter.route("/").put(Controller.update);
stockRouter.route("/").delete(Controller.destroy);

export default stockRouter;

