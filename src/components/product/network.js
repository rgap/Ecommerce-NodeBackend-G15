import { Router } from "express";
import * as Controller from "./controller.js";

const productRouter = Router();

// PLP products
productRouter.route("/get-products-plp").get(Controller.getProductsPLP);
productRouter.route("/get-product-pdp/:id").get(Controller.getProductPDP);

////////// CRUD //////////

// READ
productRouter.route("/").get(Controller.list);
// READ BY ID
productRouter.route("/:id").get(Controller.getById);
// CREATE
productRouter.route("/").post(Controller.store);
// UPDATE BY ID
productRouter.route("/:id").put(Controller.update);
// DELETE BY ID
productRouter.route("/:id").delete(Controller.destroy);

export default productRouter;
