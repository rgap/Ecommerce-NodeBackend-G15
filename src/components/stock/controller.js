import { prisma } from "../../db";

import { responseError, responseSuccess } from "../../network/responses";

// READING STOCK BY PRODUCT,COLOR,SIZE
export async function list(req, res) {
  try {
    const stock = await prisma.stock.findUnique({
      where: {
        productId: req.params.productId,
        colorId: req.params.colorId,
        sizeId: req.params.sizeId,
      },
    });

    if (!stock) {
      return responseError({ res, data: "Stock not found" });
    }

    return responseSuccess({ res, data: stock });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// UPDATE A NIVEL BACKEND
export async function update(req, res) {
  try {
    const stock = await prisma.product.update({
      where: {
        productId: req.params.productId,
        colorId: req.params.colorId,
        sizeId: req.params.sizeId,
      },
      data: req.body,
    });

    if (!stock) {
      return responseError({ res, data: "Stock not found" });
    }

    return responseSuccess({ res, data: "Stock updated" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// CREATE
export async function store(req, res) {
  try {
    const stock = req.body;

    await prisma.stock.create({
      data: stock,
    });
    return responseSuccess({ res, data: "Stock created", status: 201 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// DELETE
export async function destroy(req, res) {
  try {
    await prisma.stock.delete({
      where: {
        productId: req.params.productId,
        colorId: req.params.colorId,
        sizeId: req.params.sizeId,
      },
    });
    return responseSuccess({ res, data: "Stock deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
