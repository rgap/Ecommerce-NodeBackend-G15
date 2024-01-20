// CREACION DE SERVIDOR
import cors from "cors";
import express from "express";
import {
  colorRouter,
  productRouter,
  sizeRouter,
  stockRouter,
  userRouter,
  imageRouter,
} from "./components";
import { apiVersion } from "./config";

export const app = express();

app.use(cors());
app.use(express.json());

app.use(`${apiVersion}/users`, userRouter);
app.use(`${apiVersion}/colors`, colorRouter);
app.use(`${apiVersion}/sizes`, sizeRouter);
app.use(`${apiVersion}/products`, productRouter);
app.use(`${apiVersion}/stocks`, stockRouter);
app.use(`${apiVersion}/images`, imageRouter);
