import { Router } from "express";
import * as Controller from "./controller.js";

const userRouter = Router();

// LOGIN
userRouter.route("/login").post(Controller.login);
// REGISTER
userRouter.route("/register").post(Controller.register);
// GETBYEMAIL
userRouter.route("/findbyemail").post(Controller.findByEmail);
// VERIFYEMAIL
userRouter.route("/verify-email").get(Controller.verifyEmail);

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
