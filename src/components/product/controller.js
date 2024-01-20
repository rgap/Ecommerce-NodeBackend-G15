import { prisma } from "../../db";

import { responseError, responseSuccess } from "../../network/responses";

///////////////////////////// CRUD ////////////////////////////

// READ
// GET
export async function list(req, res) {
  try {
    const products = await prisma.product.findMany();

    return responseSuccess({ res, data: products, status: 203 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// READ by id
// GET id

export async function getById(req, res) {
  try {
    const product = await prisma.product.findUnique({
      where: {
        id: Number(req.params.id),
      },
    });

    if (!product) {
      return responseError({ res, data: "Product not found" });
    }

    return responseSuccess({ res, data: product });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// CREATE
// POST

export async function store(req, res) {
  try {
    const product = req.body;

    await prisma.product.create({
      data: product,
    });
    return responseSuccess({ res, data: "Product created", status: 201 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// UPDATE
// PUT
export async function update(req, res) {
  try {
    const product = await prisma.product.update({
      where: {
        id: Number(req.params.id),
      },
      data: req.body,
    });

    if (!product) {
      return responseError({ res, data: "Product not found" });
    }

    return responseSuccess({ res, data: "Product updated" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// DELETE Y VALIDAR SI TIENE DATOS EN TABLA IMAGE
export async function destroy(req, res) {
  try {
    const productId = Number(req.params.id);

    const product = await prisma.product.findUnique({
      where: {
        id: productId,
      },
      include: {
        image: true,
      },
    });

    if (!product) {
      return responseError({ res, data: "Product not found" });
    }

    await prisma.product.delete({
      where: {
        id: productId,
      },
    });

    if (product.image) {
      await prisma.image.delete({
        where: {
          id: product.image.id,
        },
      });
    }

    return responseSuccess({
      res,
      data: "Product and associated image deleted",
    });
  } catch (error) {
    return responseError({ res, data: error.message });
  } finally {
    await prisma.$disconnect();
  }
}

///////////////////////////// CRUD ////////////////////////////

///////////////////////////// FRONT END ////////////////////////////

export async function getProductsPLP(req, res) {
  try {
    const products = await prisma.product.findMany({
      include: {
        Stock: {
          include: {
            color: true,
          },
        },
      },
    });

    const processedProducts = products.map((product) => {
      // Filter out stock items with no available stock
      const availableStock = product.Stock.filter(
        (stockItem) => stockItem.quantity > 0
      );

      // Use a map to ensure unique colors
      const colorMap = new Map();
      availableStock.forEach((stockItem) => {
        const colorKey = stockItem.color.name + stockItem.color.code;
        if (!colorMap.has(colorKey)) {
          colorMap.set(colorKey, {
            name: stockItem.color.name,
            hexCode: stockItem.color.code,
          });
        }
      });

      const colors = Array.from(colorMap.values());

      // Calculate minimum price from available stock
      const prices = availableStock.map((stockItem) => stockItem.price);
      const minPrice = prices.length > 0 ? Math.min(...prices) : 0;

      // Return the product without the "Stock" array
      return {
        ...product,
        availableColors: colors,
        minimumPrice: minPrice,
        Stock: undefined,
      };
    });

    return responseSuccess({ res, data: processedProducts, status: 203 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// VALIDAR SI TIENE DATOS EN TABLA IMAGE
export async function validateImage(req, res) {
  try {
    const image = await prisma.image.findMany();

    if (image.length > 0) {
      return responseSuccess({ res, data: "Image Table has data" });
    } else {
      return responseError({ res, data: "Image Table has no data" });
    }
  } catch (error) {
    return responseError({ res, data: error.message });
  } finally {
    await prisma.$disconnect();
  }
}
