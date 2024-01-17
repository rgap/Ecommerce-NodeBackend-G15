// node:crypto solo quiere decir que es de node. "node:" no es requerido
import { createHmac } from "node:crypto";

export function hash(text) {
  return createHmac("sha256", "secret").update(text).digest("hex");
}
