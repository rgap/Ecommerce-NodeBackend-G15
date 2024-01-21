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

// Before delete : Validate if there's data in Image and Stock
export async function destroy(req, res) {
  try {
    const id = Number(req.params.id);

    //Validating if Product has data in Image and Stock models
    const image = await prisma.image.findFirst({
      where: {
        productId: id,
      },
    });

    const stock = await prisma.stock.findFirst({
      where: {
        productId: id,
      },
    });

    if (image || stock) {
      return responseError({ res, data: "Product has stock/image" });
    }

    await prisma.product.delete({
      where: {
        id: id,
      },
    });

    return responseSuccess({ res, data: "Product was deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

///////////////////////////// CRUD ////////////////////////////

///////////////////////////// FRONT END ////////////////////////////

export async function getProductsPLP(req, res) {
  const numberOfProducts = req.params.numberOfProducts;

  try {
    let queryOptions = {
      include: {
        Stock: {
          include: {
            color: true,
          },
        },
      },
    };

    if (numberOfProducts !== "all") {
      if (numberOfProducts === "random") {
        // Logic for fetching random products
        const totalCount = await prisma.product.count();
        const randomOffset = Math.max(
          0,
          Math.floor(Math.random() * totalCount) - 2
        );
        queryOptions.take = 3;
        queryOptions.skip = randomOffset;
      } else if (!isNaN(numberOfProducts)) {
        // If it's a numeric value
        queryOptions.take = parseInt(numberOfProducts);
      }
    }

    const products = await prisma.product.findMany(queryOptions);

    const processedProducts = products.map((product) => {
      const availableStock = product.Stock.filter(
        (stockItem) => stockItem.quantity > 0
      ).map((stockItem) => ({
        ...stockItem,
        price: stockItem.price,
        colorName: stockItem.color.name,
        hexCode: stockItem.color.code,
      }));

      const sortedByPrice = availableStock.sort((a, b) => a.price - b.price);
      const uniqueColors = new Map();
      sortedByPrice.forEach((stockItem) => {
        if (!uniqueColors.has(stockItem.colorName) && uniqueColors.size < 3) {
          uniqueColors.set(stockItem.colorName, {
            name: stockItem.colorName,
            hexCode: stockItem.hexCode,
          });
        }
      });

      const colors = Array.from(uniqueColors.values());
      const minimumPrice =
        sortedByPrice.length > 0 ? sortedByPrice[0].price : null;

      return {
        ...product,
        availableColors: colors,
        minimumPrice: minimumPrice,
        Stock: undefined,
      };
    });

    return res.status(200).json({ data: processedProducts });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
}

export async function getProductPDP(req, res) {
  try {
    // Fetch the product with the given ID, including the related Stock, Color, Size, and Images
    const product = await prisma.product.findUnique({
      where: {
        id: Number(req.params.id),
      },
      include: {
        Stock: {
          include: {
            color: true,
            size: true,
          },
        },
        Image: true, // Include related images
      },
    });

    // Check if the product exists
    if (!product) {
      return responseError({ res, data: "Product not found", status: 404 });
    }

    // Initialize structures for stock, prices, sizes, colors, and image array
    const stock = {};
    const prices = {};
    const colorMap = new Map();
    const sizeSet = new Set();
    const imageArray = product.Image.map((img) => img.url); // Extract image URLs
    let minPrice = Number.MAX_VALUE;
    let minimumPriceColor = null;
    let minimumPriceSize = null;

    // Process each stock item
    product.Stock.forEach((stockItem) => {
      if (stockItem.quantity > 0) {
        const size = stockItem.size.name;
        const colorName = stockItem.color.name;
        const hexCode = stockItem.color.code;
        const price = stockItem.price.toFixed(2);

        // Add color and size to respective sets
        colorMap.set(colorName, hexCode);
        sizeSet.add(size);

        // Initialize nested objects if not already present
        stock[size] = stock[size] || {};
        prices[size] = prices[size] || {};

        // Assign quantity and price
        stock[size][colorName] = stockItem.quantity;
        prices[size][colorName] = price;

        // Update minimum price and corresponding color and size
        if (parseFloat(price) < minPrice) {
          minPrice = parseFloat(price);
          minimumPriceColor = colorName;
          minimumPriceSize = size;
        }
      }
    });

    // Convert sets and maps to arrays
    const availableSizes = Array.from(sizeSet);
    const availableColors = Array.from(colorMap, ([name, hexCode]) => ({
      name,
      hexCode,
    }));

    // Construct the response object
    const processedProduct = {
      ...product,
      availableSizes,
      availableColors,
      stock,
      prices,
      imageArray,
      minimumPriceColor,
      minimumPriceSize,
      Stock: undefined, // Exclude the original Stock array
      Image: undefined, // Exclude the original Image array
    };

    // Return the processed product
    return responseSuccess({ res, data: processedProduct, status: 200 });
  } catch (error) {
    // Handle any errors
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
