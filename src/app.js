//Creacion de servidor
import cors from "cors";
import express from "express";
import {
  colorRouter,
  productRouter,
  sizeRouter,
  userRouter,
  stockRouter,
} from "./components";
import { apiVersion } from "./config";


export const app = express();

app.use(cors());
app.use(express.json());

app.use(`${apiVersion}/users`, userRouter);
app.use(`${apiVersion}/color`, colorRouter);
app.use(`${apiVersion}/size`, sizeRouter);
app.use(`${apiVersion}/product`, productRouter);
app.use(`${apiVersion}/stock`, stockRouter);
