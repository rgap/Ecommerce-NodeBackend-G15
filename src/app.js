//Creacion de servidor

import express from "express";
import { userRouter,colorRouter,sizeRouter,productRouter } from "./components";
import { apiVersion } from "./config";

export const app = express();

app.use(express.json());

app.use(`${apiVersion}/users`, userRouter);
app.use(`${apiVersion}/stock`, stockRouter);
app.use(`${apiVersion}/color`, colorRouter);
app.use(`${apiVersion}/size`, sizeRouter);
app.use(`${apiVersion}/product`, productRouter);
