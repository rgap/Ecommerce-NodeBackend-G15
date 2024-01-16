import { prisma } from "../../db";

import { responseError, responseSuccess } from "../../network/responses";

//READ

export async function list(req, res) {
    try {
      const products = await prisma.user.findMany();
      return responseSuccess({ res, data: products, status: 203 });
    } catch (error) {
      return responseError({ res, data: error.message });
    }
  }

// READ by id

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

  export async function store(req,res){
    try{
        const product = req.body;

        await prisma.product.create({
            data:product
        })
        return responseSuccess({res,data:"Product created",status:201})
    }catch(error){
        return responseError({ res, data: error.message });
    }
}

//UPDATE

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

// DELETE

  export async function destroy(req, res) {
    try {
      await prisma.product.delete({
        where: {
          id: Number(req.params.id),
        },
      });
      return responseSuccess({ res, data: "Product deleted" });
    } catch (error) {
      return responseError({ res, data: error.message });
    }
  }