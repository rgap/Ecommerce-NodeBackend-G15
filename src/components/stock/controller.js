import { prisma } from "../../db/index.js";

import { responseError, responseSuccess } from "../../network/responses.js";

// READING STOCK BY PRODUCT,COLOR,SIZE
export async function getQuantityAndPrice(req, res) {
  try {
    const { productId, colorId, sizeId } = req.body;

    const stock = await prisma.stock.findUnique({
      where: {
        productId_colorId_sizeId: {
          // Use the compound unique key
          productId: productId,
          colorId: colorId !== undefined ? colorId : null,
          sizeId: sizeId !== undefined ? sizeId : null,
        },
      },
      select: {
        quantity: true,
        price: true,
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

export async function update(req, res) {
  try {
    const { productId, colorId, sizeId } = req.body;
    const stock = await prisma.stock.update({
      where: {
        productId_colorId_sizeId: {
          // Use the compound unique key
          productId: productId,
          colorId: colorId !== undefined ? colorId : null,
          sizeId: sizeId !== undefined ? sizeId : null,
        },
      },
      data: { quantity: req.body.quantity, price: req.body.price },
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
    const { productId, colorId, sizeId } = req.body;

    await prisma.stock.delete({
      where: {
        productId_colorId_sizeId: {
          // Use the compound unique key
          productId: productId,
          colorId: colorId,
          sizeId: sizeId,
        },
      },
    });
    return responseSuccess({ res, data: "Stock deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
