import { Router } from "express";
import * as Controller from "./controller.js";

const userRouter = Router();

// LOGIN
userRouter.route("/login").post(Controller.login);
// REGISTER
userRouter.route("/register").post(Controller.register);
// GETBYEMAIL
userRouter.route("/findbyemail").post(Controller.findByEmail);

// CRUD
userRouter.route("/").get(Controller.list);
userRouter.route("/:id").get(Controller.getById);
userRouter.route("/").post(Controller.store);
userRouter.route("/:id").put(Controller.update);
userRouter.route("/:id").delete(Controller.destroy);

export default userRouter;
