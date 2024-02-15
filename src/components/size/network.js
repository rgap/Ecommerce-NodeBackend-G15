import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Adjust the path as necessary
import * as Controller from "./controller.js";

const sizeRouter = Router();

// Public routes for listing sizes
sizeRouter.route("/").get(Controller.list);
sizeRouter.route("/:id").get(Controller.list); // If this is meant to get details by id, consider renaming the controller method to getById or similar for clarity

// Protected routes for modifying sizes
sizeRouter.route("/").post(verifyStaticToken, Controller.store);
sizeRouter.route("/:id").put(verifyStaticToken, Controller.update);
sizeRouter.route("/:id").delete(verifyStaticToken, Controller.destroy);

export default sizeRouter;
