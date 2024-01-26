import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";

/* SIZE CRUD */

//READ
export async function list(req, res) {
  try {
    const sizes = await prisma.size.findMany();
    return responseSuccess({ res, data: sizes });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

export async function getById(req, res) {
  try {
    const size = prisma.size.findUnique({
      where: {
        id: Number(req.params.id),
      },
    });

    if (!size) {
      return responseError({ res, data: "Size not found " });
    }
    return responseSuccess({ res, data: size });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

//CREATE

export async function store(req, res) {
  try {
    const size = req.body;
    await prisma.size.create({
      data: size,
    });
    return responseSuccess({ res, data: "Size created", status: 201 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

//UPDATE

export async function update(req, res) {
  try {
    const size = await prisma.size.update({
      where: {
        id: Number(req.params.id),
      },
      data: req.body,
    });

    if (!size) {
      return responseError({ res, data: "Size not found" });
    }

    return responseSuccess({ res, data: "Size updated" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

//DELETE

export async function destroy(req, res) {
  try {
    await prisma.size.delete({
      where: {
        id: Number(req.params.id),
      },
    });
    return responseSuccess({ res, data: "Size deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
