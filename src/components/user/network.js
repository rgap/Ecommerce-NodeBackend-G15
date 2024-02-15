import { Router } from "express";
import { verifyStaticToken } from "../../middleware/authMiddleware.js"; // Adjust the path as necessary
import * as Controller from "./controller.js";

const userRouter = Router();

// LOGIN
userRouter.route("/login").post(verifyStaticToken, Controller.login);
// REGISTER
userRouter.route("/register").post(verifyStaticToken, Controller.register);

// GOOGLE OAUTH
userRouter.route("/auth/google").post(verifyStaticToken, Controller.verifyGoogleIdToken);
// VERIFYEMAIL
userRouter.route("/verify-email").get(Controller.verifyEmail);
// GETBYEMAIL
userRouter.route("/check-if-email-exists").post(verifyStaticToken, Controller.checkIfEmailExists);
// VERIFYEMAIL
userRouter.route("/get-by-email").post(verifyStaticToken, Controller.getByEmail);

////////// CRUD //////////

// READ
userRouter.route("/").get(verifyStaticToken, Controller.list);
// READ BY ID
userRouter.route("/:id").get(verifyStaticToken, Controller.getById);
// UPDATE BY ID
userRouter.route("/:id").put(verifyStaticToken, Controller.update);
// DESTROY BY ID
userRouter.route("/:id").delete(verifyStaticToken, Controller.destroy);

export default userRouter;
