import { prisma } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";

///////////////////////////// CRUD ////////////////////////////

// READ
export async function list(req, res) {
  try {
    const images = await prisma.image.findMany();
    return responseSuccess({ res, data: images, status: 203 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// READ BY PRODUCT
export async function getbyProduct(req, res) {
  try {
    const product = await prisma.image.findMany({
      where: {
        productId: Number(req.params.productId),
      },
    });

    if (!product) {
      return responseError({ res, data: "Image not found for this product." });
    }

    responseSuccess({ res, data: product });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// CREATE
export async function store(req, res) {
  try {
    const existingProduct = await prisma.product.findUnique({
      where: {
        id: req.body.productId,
      },
    });

    if (!existingProduct) {
      return responseError({ res, data: "Product not found" });
    }

    await prisma.image.create({
      data: req.body,
    });

    return responseSuccess({ res, data: "Image created", status: 201 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// UPDATE
export async function update(req, res) {
  try {
    // Step 1: Find the image record first
    const existingImage = await prisma.image.findFirst({
      where: {
        id: req.body.id,
        productId: req.body.productId,
      },
    });

    if (!existingImage) {
      return responseError({ res, data: "Image not found" });
    }

    // Step 2: Update the image
    const updatedImage = await prisma.image.update({
      where: {
        id: existingImage.id, // unique identifier
      },
      data: req.body,
    });

    return responseSuccess({ res, data: "Image updated" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// DELETE

export async function destroy(req, res) {
  try {
    const existingProduct = await prisma.image.findFirst({
      where: {
        productId: Number(req.params.productId),
      },
    });

    if (!existingProduct) {
      return responseError({ res, data: "Image not found" });
    }

    await prisma.image.deleteMany({
      where: {
        productId: Number(req.params.productId),
      },
    });
    return responseSuccess({ res, data: "Images deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}
