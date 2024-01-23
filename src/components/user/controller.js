import dotenv from "dotenv";
import { generateVerificationToken, hash } from "../../crypto/index.js";
import { prisma, prismaError } from "../../db/index.js";
import { responseError, responseSuccess } from "../../network/responses.js";
import { sendVerificationEmail } from "../../services/emailService.js"; // Adjust the path as necessary

// Load environment variables from .env file
dotenv.config();

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
    return responseError({ res, data: `${error.message}` });
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

    // User not found or not verified
    if (!user || !user.isVerified) {
      return responseError({
        res,
        data: "Invalid email or password",
        status: 401,
      });
    }

    // Compare hashed passwords
    const hashedInputPassword = hash(password);
    if (user.password !== hashedInputPassword) {
      return responseError({
        res,
        data: "Invalid email or password",
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

export async function checkIfEmailExists(req, res) {
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
    const { name, email, password } = req.body;
    const hashedPassword = hash(password);
    const isDebugMode = process.env.DEBUG_MODE === "true";
    // Generate email verification token only if not in debug mode
    const emailToken = isDebugMode ? null : generateVerificationToken();

    // Create new user
    await prisma.user.create({
      data: {
        name,
        email,
        password: hashedPassword,
        emailToken,
        isVerified: isDebugMode,
        phoneNumber: "",
        address: "",
        city: "",
        region: "",
        country: "",
        cardNumber: "",
      },
    });

    // console.log("process.env.SMTP_USER", process.env.SMTP_USER);

    // Send verification email only if not in debug mode
    if (!isDebugMode) {
      await sendVerificationEmail(email, emailToken);
    }

    const message = isDebugMode
      ? "User created in debug mode (no email verification)."
      : "User created. Please check your email to verify your account.";

    return responseSuccess({
      res,
      data: message,
      status: 201,
    });
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

// VERIFY EMAIL

export async function verifyEmail(req, res) {
  try {
    const { token } = req.query;

    if (!token) {
      return responseError({
        res,
        data: "Verification token is required.",
        status: 400,
      });
    }

    const user = await prisma.user.findUnique({
      where: {
        emailToken: token,
      },
    });

    if (!user) {
      return responseError({
        res,
        data: "Invalid or expired token.",
        status: 400,
      });
    }

    await prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        isVerified: true,
        emailToken: null, // Clear the verification token
      },
    });

    return responseSuccess({
      res,
      data: "Email verified successfully. You may now log in.",
      status: 200,
    });
  } catch (error) {
    console.error("Failed to verify email:", error);
    return responseError({
      res,
      data: "An error occurred during email verification.",
    });
  }
}

export async function getByEmail(req, res) {
  try {
    const { email } = req.body;
    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
      select: {
        id: true,
        email: true,
        name: true,
        phoneNumber: true,
        address: true,
        city: true,
        region: true,
        country: true,
        cardNumber: true,
      },
    });

    if (!user) {
      return responseError({ res, data: "User not found" });
    }

    return responseSuccess({ res, data: user });
  } catch (error) {
    return responseError({ res, data: `${error.message}` });
  }
}
