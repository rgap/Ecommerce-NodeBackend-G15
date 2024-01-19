//CREANDO SERVIDOR Y ESPECIFICANDO PUERTO A USAR
import express from "express";

const app = express();

app.listen(3000, () => {
  console.log(`Server is running on http://localhost:3000`);
});
