import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Ensure the path is correct
import * as Controller from "./controller.js";

const productRouter = Router();

// Assuming PLP and PDP routes can remain public
// PLP PRODUCTS
productRouter.route("/get-products-plp/:numberOfProducts").get(verifyStaticToken, Controller.getProductsPLP);
// PDP PRODUCT
productRouter.route("/get-product-pdp/:id").get(verifyStaticToken, Controller.getProductPDP);
// PDP PRODUCT BY SLUG
productRouter.route("/get-product-pdp-by-slug/:slug").get(verifyStaticToken, Controller.getProductPDPBySlug);

// GET RELATED PRODUCTS BY TITLE
productRouter.route("/related/:numberOfProducts").post(verifyStaticToken, Controller.getRelatedProducts);

////////// CRUD //////////

// Protecting CRUD operations
// READ
productRouter.route("/").get(verifyStaticToken, Controller.list);
// READ BY ID
productRouter.route("/:id").get(verifyStaticToken, Controller.getById);
// CREATE
productRouter.route("/").post(verifyStaticToken, Controller.store);
// UPDATE BY ID
productRouter.route("/:id").put(verifyStaticToken, Controller.update);
// DELETE BY ID
productRouter.route("/:id").delete(verifyStaticToken, Controller.destroy);

export default productRouter;
