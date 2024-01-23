import { Router } from "express";
import * as Controller from "./controller.js";

const userRouter = Router();

// LOGIN
userRouter.route("/login").post(Controller.login);
// REGISTER
userRouter.route("/register").post(Controller.register);
// VERIFYEMAIL
userRouter.route("/verify-email").get(Controller.verifyEmail);
// GETBYEMAIL
userRouter.route("/check-if-email-exists").post(Controller.checkIfEmailExists);
// VERIFYEMAIL
userRouter.route("/get-by-email").post(Controller.getByEmail);

////////// CRUD //////////

// READ
userRouter.route("/").get(Controller.list);
// READ BY ID
userRouter.route("/:id").get(Controller.getById);
// UPDATE BY ID
userRouter.route("/:id").put(Controller.update);
// DESTROY BY ID
userRouter.route("/:id").delete(Controller.destroy);

export default userRouter;
