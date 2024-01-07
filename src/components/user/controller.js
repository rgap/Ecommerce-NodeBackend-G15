import { prisma } from "../../db";
import { responseError, responseSuccess } from "../../network/responses";

// READ

export async function list(req, res) {
  try {
    const users = await prisma.user.findMany();
    return responseSuccess({ res, data: users });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
