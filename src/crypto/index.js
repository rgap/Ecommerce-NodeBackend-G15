import jwt from "jsonwebtoken";
import { createHmac, randomBytes } from "node:crypto";

export function hash(text) {
  const secretKey = process.env.HMAC_SECRET_KEY;
  return createHmac("sha256", secretKey).update(text).digest("hex");
}

export function generateVerificationToken() {
  const secretKey = process.env.JWT_SECRET;
  const options = { expiresIn: "24h" };
  // No payload
  const payload = {};

  return jwt.sign(payload, secretKey, options);
}

export function generateRandomToken() {
  // Generate a secure random string
  const secureRandomString = randomBytes(16).toString("hex");
  // Use the hash function to hash the secure random string
  return hash(secureRandomString);
}
