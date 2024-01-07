import { Router } from "express";
import * as Controller from "./controller.js";

const userRouter = Router();

// userRouter.get("/", Controller.list);
userRouter.route("/").get(Controller.list);

export default userRouter;
