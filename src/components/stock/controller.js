import { prisma } from "../../db";

import { responseError, responseSuccess } from "../../network/responses";

// READING STOCK BY PRODUCT,COLOR,SIZE
export async function getQuantityAndPrice(req, res) {
  try {
    const { productId, colorId, sizeId } = req.body;

    const stock = await prisma.stock.findUnique({
      where: {
        productId: productId,
        colorId: colorId,
        sizeId: sizeId,
      },
      select: {
        stock_quantity: true,
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


 // VALIDAR SI PRODUCTO TIENE STOCK ANTES DE SER ELIMINADO
 /*export async function validateStock(req, res) {
  try {
    const product = await prisma.product.findUnique({
      where: { 
        id: Number(req.params.id), 
      },
    });

    if (!product) {
      return responseError({ res, data: "Product not found" });
    }

    const { productId} = req.body;

    const stock = await prisma.stock.findUnique({
      where: { 
        productId: productId, 
      },
    });

    if (!stock) {
      return responseError({ res, data: "Stock not found for the product" });
    }

    if (stock.quantity >= cantidadRequerida) {
      return responseSuccess({ res, data: "Available stock!" });
    } else {
      return responseError({ res, data: "Not enough stock!" });
    }
  } catch (error) {
    return responseError({ res, data: error.message });
  } finally {
    await prisma.$disconnect();
  }
}*/

