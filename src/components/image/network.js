import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Ensure the path is correct
import * as Controller from "./controller.js";

const imageRouter = Router();

imageRouter.route("/").get(verifyStaticToken, Controller.list);
imageRouter.route("/:productId").get(verifyStaticToken, Controller.getbyProduct);
imageRouter.route("/").post(verifyStaticToken, Controller.store);
imageRouter.route("/").put(verifyStaticToken, Controller.update);
imageRouter.route("/:productId").delete(verifyStaticToken, Controller.destroy);

export default imageRouter;
