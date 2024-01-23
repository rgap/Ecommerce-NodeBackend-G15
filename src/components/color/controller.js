import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";

/* COLOR CRUD */

//READ
export async function list(req, res) {
  try {
    const colors = await prisma.color.findMany();
    return responseSuccess({ res, data: colors });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

export async function getById(req, res) {
  try {
    const color = prisma.color.findUnique({
      where: {
        id: Number(req.params.id),
      },
    });

    if (!color) {
      return responseError({ res, data: "Color not found " });
    }
    return responseSuccess({ res, data: color });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

//CREATE

export async function store(req, res) {
  try {
    const color = req.body;

    await prisma.color.create({
      data: color,
    });
    return responseSuccess({ res, data: "Color created", status: 201 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

//UPDATE

export async function update(req, res) {
  try {
    const color = await prisma.color.update({
      where: {
        id: Number(req.params.id),
      },
      data: req.body,
    });

    if (!color) {
      return responseError({ res, data: "Color not found" });
    }

    return responseSuccess({ res, data: "Color updated" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

//DELETE

export async function destroy(req, res) {
  try {
    await prisma.color.delete({
      where: {
        id: Number(req.params.id),
      },
    });
    return responseSuccess({ res, data: "Color deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
