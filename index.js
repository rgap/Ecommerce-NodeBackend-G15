import { PrismaClient } from "@prisma/client";
import express from "express";

const app = express();
app.use(express.json());

const prisma = new PrismaClient();

app.get("/", function (req, res) {
  const http_status = 200;
  return res.status(http_status).json({
    ok: true,
    data: "hola",
  });
});

app.get("/user", async function (req, res) {
  const users = await prisma.user.findMany();
  return res.status(200).json({
    ok: true,
    data: users,
  });
});

app.listen(3000, () => {
  console.log(`Server is running on http://localhost:3000`);
});
