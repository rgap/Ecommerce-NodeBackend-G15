import { Router } from "express";
import * as Controller from "./controller";

const userRouter = Router();

userRouter.get("/", Controller.list);

export default userRouter;
