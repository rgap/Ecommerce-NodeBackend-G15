import { createHmac } from "node:crypto";

export function hash(text) {
  const secretKey = process.env.HMAC_SECRET_KEY;
  return createHmac("sha256", secretKey).update(text).digest("hex");
}

export function generateVerificationToken() {
  const randomPart = Date.now().toString() + Math.random().toString();
  const secretKey = process.env.HMAC_SECRET_KEY;
  return createHmac("sha256", secretKey).update(randomPart).digest("hex");
}
