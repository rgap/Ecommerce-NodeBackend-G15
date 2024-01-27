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
  const verificationLink = `${process.env.HOSTNAME_FRONTEND}/verify?token=${token}`; // Reemplace con su dominio real
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

/**
 * Enviar un correo electrónico de confirmación de pedido a un usuario
 * @param {Object} order - Los datos del pedido
 */
const sendOrderConfirmationEmail = async (order) => {
  let emailBody = `
    <h3>Confirmación de Pedido</h3>
    <p>¡Gracias por tu compra!</p>
    <p>Detalles del Pedido:</p>
    <ul>
      <li>Fecha de Pago: ${order.paymentDate}</li>
      <li>Monto Total: ${order.transactionAmount}</li>
      <li>Método de Pago: ${order.paymentMethodId}</li>
    </ul>
    <p>Artículos en tu Pedido:</p>
    <ul>`;

  // Agregando cada producto en el pedido al cuerpo del correo
  order.cart.forEach((product) => {
    emailBody += `
      <li>
        ${product.name} - ${product.color} - Cantidad: ${product.quantity} - Precio: $${product.price}
      </li>`;
  });

  emailBody += `</ul><p>Saludos cordiales,<br>Beautipol</p>`;

  await sendEmail({
    from: '"Beautipol" <r.guzmanap@gmail.com>', // Reemplazar con tu email
    to: order.payerEmail,
    subject: "Confirmación de Pedido",
    html: emailBody,
  });
};

/**
 * Enviar un correo electrónico de notificación de nuevo pedido al administrador del sitio web
 * @param {Object} order - Los datos del pedido
 * @param {string} adminEmail - Dirección de correo electrónico del administrador
 */
const sendOrderNotificationToAdmin = async (order, adminEmail) => {
  let emailBody = `
    <h3>Notificación de Nuevo Pedido</h3>
    <p>Se ha realizado un nuevo pedido.</p>
    <p>Detalles del Pedido:</p>
    <ul>
      <li>Fecha de Pago: ${order.paymentDate}</li>
      <li>Monto Total: ${order.transactionAmount}</li>
      <li>Método de Pago: ${order.paymentMethodId}</li>
    </ul>
    <p>Artículos en el Pedido:</p>
    <ul>`;

  // Agregando cada producto en el pedido al cuerpo del correo
  order.cart.forEach((product) => {
    emailBody += `
      <li>
        ${product.name} - ${product.color} - Cantidad: ${product.quantity} - Precio: $${product.price}
      </li>`;
  });

  await sendEmail({
    from: '"Beautipol" <r.guzmanap@gmail.com>', // Reemplazar con el email de la empresa
    to: adminEmail,
    subject: "Nuevo Pedido Realizado",
    html: emailBody,
  });
};

export {
  sendEmail,
  sendOrderConfirmationEmail,
  sendOrderNotificationToAdmin,
  sendVerificationEmail,
};
