import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Ensure the path is correct
import * as Controller from "./controller.js";

const colorRouter = Router();

colorRouter.route("/").get(verifyStaticToken, Controller.list);
colorRouter.route("/:id").get(verifyStaticToken, Controller.list);
colorRouter.route("/").post(verifyStaticToken, Controller.store);
colorRouter.route("/:id").put(verifyStaticToken, Controller.update);
colorRouter.route("/:id").put(verifyStaticToken, Controller.destroy);

export default colorRouter;
