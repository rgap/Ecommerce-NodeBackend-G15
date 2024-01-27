import dotenv from "dotenv";
import nodemailer from "nodemailer";

// Load environment variables from .env file
dotenv.config();

// Create a transporter for nodemailer
const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: process.env.SMTP_PORT,
  secure: process.env.SMTP_SECURE === "true", // true for 465, false for other ports
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASSWORD,
  },
});

/**
 * Send an email using the preconfigured transporter
 * @param {Object} mailOptions - Options for the email
 */
const sendEmail = async (mailOptions) => {
  try {
    const info = await transporter.sendMail(mailOptions);
    console.log(`Email sent: ${info.messageId}`);
  } catch (error) {
    console.error(`Error sending email: ${error}`);
    throw error; // Rethrow the error for further handling
  }
};

/**
 * Send a verification email to a user
 * @param {string} email - The user's email address
 * @param {string} token - The email verification token
 */
const sendVerificationEmail = async (email, token) => {
  const verificationLink = `${process.env.HOSTNAME_FRONTEND}/users/verify-email?token=${token}`; // Reemplace con su dominio real
  await sendEmail({
    from: '"Beautipol" <r.guzmanap@gmail.com>', // Reemplace con su email
    to: email,
    subject: "Verifica tu correo electrónico",
    html: `
      <div style="font-family: Arial, sans-serif; color: #333; text-align: center;">
        <h2 style="color: #49656f;">¡Bienvenido a Beautipol!</h2>
        <p>Gracias por registrarte con nosotros. Por favor confirma tu dirección de correo electrónico para activar tu cuenta.</p>
        <p style="margin: 20px 0;">
          <a href="${verificationLink}" 
             style="background-color: #49656f; color: #fff; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block; transition: background-color 0.3s;"
             onmouseover="this.style.backgroundColor='#b27652'"
             onmouseout="this.style.backgroundColor='#49656f'">
            Confirmar Correo
          </a>
        </p>
        <p>Si el botón anterior no funciona, por favor copia y pega el siguiente enlace en tu navegador:</p>
        <a href="${verificationLink}" style="word-break: break-all;">${verificationLink}</a>
        <p style="margin-top: 30px;">Saludos,<br>El equipo de Beautipol</p>
      </div>
    `,
  });
};

export { sendEmail, sendVerificationEmail };
