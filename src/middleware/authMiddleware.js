import dotenv from "dotenv";
dotenv.config();

function verifyStaticToken(req, res, next) {
  const authHeader = req.headers.authorization;
  const token = authHeader && authHeader.split(" ")[1];

  if (token === process.env.API_TOKEN) {
    next();
  } else {
    return res.status(403).json({ error: "Access denied. Invalid token." });
  }
}

export { verifyStaticToken };
