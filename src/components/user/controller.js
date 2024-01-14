import { prisma } from "../../db";
import { responseSuccess, responseError } from "../../network/responses";

//READ
export async function list(req, res) {
  try {
    const users = await prisma.user.findMany(); //select * from users
    return responseSuccess({ res, data: users });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
