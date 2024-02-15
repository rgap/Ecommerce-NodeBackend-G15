import { randomBytes } from "crypto";

function generateApiToken() {
  return randomBytes(32).toString("hex"); // Generates a 64-character hexadecimal string
}

const apiToken = generateApiToken();
console.log("API Token:", apiToken);
