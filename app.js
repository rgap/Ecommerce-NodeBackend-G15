import express from "express";

const app = express();
app.use(express.json());

app.get("/", function (req, res) {
  const http_status = 200;
  return res.status(http_status).json({
    ok: true,
    data: "hola",
  });
});

app.listen(3000, () => {
  console.log(`Server is running on http://localhost:3000`);
});
