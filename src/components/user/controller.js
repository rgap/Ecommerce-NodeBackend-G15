import { hash } from "../../crypto";
import { prisma, prismaError } from "../../db";

import { responseError, responseSuccess } from "../../network/responses";

///////////////////////////// CRUD ////////////////////////////

// READ
// GET

export async function list(req, res) {
  try {
    const users = await prisma.user.findMany();
    return responseSuccess({ res, data: users, status: 203 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// READ by id
// GET id

export async function getById(req, res) {
  try {
    const user = await prisma.user.findUnique({
      where: {
        id: Number(req.params.id),
      },
    });

    if (!user) {
      return responseError({ res, data: "User not found" });
    }

    return responseSuccess({ res, data: user });
  } catch (error) {
    return responseError({ res, data: `getById: ${error.message}` });
  }
}

// UPDATE
// PUT

export async function update(req, res) {
  try {
    const user = await prisma.user.update({
      where: {
        id: Number(req.params.id),
      },
      data: req.body,
    });

    if (!user) {
      return responseError({ res, data: "User not found" });
    }

    return responseSuccess({ res, data: "User updated" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// DELETE
// DELETE

export async function destroy(req, res) {
  try {
    await prisma.user.delete({
      where: {
        id: Number(req.params.id),
      },
    });

    return responseSuccess({ res, data: "User deleted" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

///////////////////////////// CRUD ////////////////////////////

///////////////////////////// FRONT END ////////////////////////////

// LOGIN
// POST login

export async function login(req, res) {
  try {
    const { email, password } = req.body;

    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });

    // User not found
    if (!user) {
      return responseError({ res, data: "User not found", status: 404 });
    }

    // Password invalid
    if (user.password !== hash(password)) {
      return responseError({
        res,
        data: "Invalid password",
        status: 401,
      });
    }

    // Login successful
    return responseSuccess({
      res,
      data: "User authenticated successfully",
    });
  } catch (error) {
    return responseError({ res, data: `${error.message}` });
  }
}

// GET by email

export async function findByEmail(req, res) {
  try {
    const { email } = req.body;

    if (!email) {
      return responseError({
        res,
        data: "Email parameter is missing",
        status: 400,
      });
    }

    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });

    // User email exists
    if (user) {
      return responseSuccess({ res, data: "User exists", status: 200 });
    }

    // User email not found
    return responseError({
      res,
      data: "User not found",
      status: 400,
    });
  } catch (error) {
    return responseError({ res, data: `${error.message}` });
  }
}

// CREATE
// POST

export async function register(req, res) {
  try {
    const { password, ...otherUserData } = req.body;

    // Hash the password
    const hashedPassword = hash(password);

    await prisma.user.create({
      data: {
        ...otherUserData,
        password: hashedPassword,
      },
    });

    return responseSuccess({ res, data: "User created", status: 201 });
  } catch (error) {
    if (error instanceof prismaError) {
      // Unique constraint failed
      if (error.code === "P2002") {
        return responseError({
          res,
          data: "A new user cannot be created with this email",
          status: 400,
        });
      }
    }
    return responseError({ res, data: error.message });
  }
}
