//Creacion de servidor
import express from "express";
import { userRouter } from "./components";
import { apiVersion } from "./config";

export const app = express();

app.use(express.json());
app.use(`${apiVersion}/users`, userRouter);