import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Adjust the path as necessary
import * as Controller from "./controller.js";

const stockRouter = Router();

stockRouter.route("/quantity-and-price").post(verifyStaticToken, Controller.getQuantityAndPrice);

// Protecting routes for modifying stock
stockRouter.route("/").post(verifyStaticToken, Controller.store);
stockRouter.route("/").put(verifyStaticToken, Controller.update);
stockRouter.route("/").delete(verifyStaticToken, Controller.destroy);

export default stockRouter;
