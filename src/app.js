// CREACION DE SERVIDOR
import cors from "cors";
import express from "express";
import {
  colorRouter,
  imageRouter,
  paymentRouter,
  productRouter,
  sizeRouter,
  stockRouter,
  userRouter,
} from "./components/index.js";
import { apiVersion } from "./config/index.js";

export const app = express();

app.use(cors());
app.use(express.json());

app.use(`${apiVersion}/users`, userRouter);
app.use(`${apiVersion}/colors`, colorRouter);
app.use(`${apiVersion}/sizes`, sizeRouter);
app.use(`${apiVersion}/products`, productRouter);
app.use(`${apiVersion}/stocks`, stockRouter);
app.use(`${apiVersion}/images`, imageRouter);
app.use(`${apiVersion}/payments`, paymentRouter);
