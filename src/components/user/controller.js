import { prisma } from "../../db";

import { responseError, responseSuccess } from "../../network/responses";

// READ

export async function list(req, res) {
  try {
    const users = await prisma.user.findMany();
    return responseSuccess({ res, data: users, status: 203 });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// READ by id

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
    return responseError({ res, data: error.message });
  }
}

// LOGIN

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

    const isPasswordValid = await bcrypt.compare(password, user.password);
    // Password invalid
    if (!isPasswordValid) {
      return responseError({ res, data: "Invalid password", status: 401 });
    }

    // Login successful
    return responseSuccess({ res, data: "User authenticated successfully" });
  } catch (error) {
    return responseError({ res, data: error.message });
  }
}

// CREATE

export async function store(req, res) {
  try {
    const { password, ...otherUserData } = req.body;

    // Hash the password
    const saltRounds = 10; // You can adjust the number of rounds as needed
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    await prisma.user.create({
      data: {
        ...otherUserData,
        password: hashedPassword,
      },
    });

    return responseSuccess({ res, data: "User created", status: 201 });
  } catch (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
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

// UPDATE

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
