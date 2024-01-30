import { Router } from "express";
import * as Controller from "./controller.js";

const productRouter = Router();

// PLP PRODUCTS
productRouter
  .route("/get-products-plp/:numberOfProducts")
  .get(Controller.getProductsPLP);
// PDP PRODUCT
productRouter.route("/get-product-pdp/:id").get(Controller.getProductPDP);
// GET RELATED PRODUCTS BY TITLE
productRouter
  .route("/related/:numberOfProducts")
  .post(Controller.getRelatedProducts);

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
