//Creacion de servidor

import express from "express";
import { userRouter,colorRouter,sizeRouter } from "./components";
import { apiVersion } from "./config";

export const app = express();

app.use(express.json());

app.use(`${apiVersion}/users`, userRouter);
app.use(`${apiVersion}/stock`, userRouter);
app.use(`${apiVersion}/color`, colorRouter);
app.use(`${apiVersion}/size`, sizeRouter);
