import dotenv from "dotenv";
import nodemailer from "nodemailer";
import { formatAmount } from "../utils/utils.js";

dotenv.config();

const adminEmail = "r.guzmanap@gmail.com";

// Crear transporter para nodemailer
const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: process.env.SMTP_PORT,
  secure: process.env.SMTP_SECURE === "true", // true si es que es 465
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASSWORD,
  },
});

const sendEmail = async (mailOptions) => {
  try {
    const info = await transporter.sendMail(mailOptions);
    console.log(`Email sent: ${info.messageId}`);
  } catch (error) {
    console.error(`Error sending email: ${error}`);
    throw error;
  }
};

const sendVerificationEmail = async (email, token) => {
  const verificationLink = `${process.env.HOSTNAME_FRONTEND}/verify-email?token=${token}`; // Reemplace con su dominio real
  await sendEmail({
    from: `Beautipol <${adminEmail}>`,
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

const sendOrderConfirmationEmail = async (order) => {
  let emailBody = `
    <html>
      <head>
        <style>
          body { font-family: 'Helvetica Neue', Arial, sans-serif; color: #333333; line-height: 1.6; }
          .email-container { background-color: #f4f4f4; padding: 20px; }
          .email-content { background-color: #ffffff; padding: 30px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
          .header { color: #49656f; font-size: 26px; margin-bottom: 20px; }
          .sub-header { font-size: 18px; color: #333333; margin-bottom: 10px; }
          .order-details, .order-items { margin-top: 20px; text-align: left; }
          ul { padding: 0; }
          li { list-style-type: none; margin-bottom: 15px; color: #555555; font-size: 16px; }
          .footer { margin-top: 40px; color: #777777; font-size: 14px; }
          .button {
            background-color: #49656f; color: #ffffff; padding: 12px 25px; text-decoration: none; border-radius: 6px; display: inline-block; font-weight: bold; margin-top: 20px;
          }
          .button:hover { background-color: #3a545f; }
        </style>
      </head>
      <body>
        <div class="email-container" style="text-align: center;">
          <div class="email-content">
            <p class="header">¡Gracias por tu compra!</p>
            <div class="order-details">
              <p class="sub-header">Detalles del Pedido:</p>
              <ul>
                <li>Fecha de Pago: ${new Date(
                  order.paymentDate
                ).toLocaleDateString("es-ES", {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                  hour: "2-digit",
                  minute: "2-digit",
                })}</li>
                <li>Monto Total: S/ ${formatAmount(
                  parseFloat(order.transactionAmount)
                )}</li>
              </ul>
            </div>
            <div class="order-items">
              <p class="sub-header">Artículos en tu Pedido:</p>
              <ul>`;

  order.cart.forEach((product) => {
    emailBody += `
                <li>
                  ${product.title} - ${product.color} - Cantidad: ${product.quantity} - Precio: S/ ${product.price}
                </li>`;
  });

  emailBody += `
              </ul>
            </div>
            <p class="footer">Saludos cordiales,<br>Beautipol</p>
          </div>
        </div>
      </body>
    </html>`;

  await sendEmail({
    from: `Beautipol <${adminEmail}>`,
    to: order.payerEmail,
    subject: "Confirmación de Pedido",
    html: emailBody,
  });
};

const sendOrderNotificationToAdmin = async (order) => {
  let emailBody = `
    <html>
      <head>
        <style>
          body { font-family: 'Helvetica Neue', Arial, sans-serif; color: #333333; line-height: 1.6; }
          .email-container { background-color: #f4f4f4; padding: 20px; }
          .email-content { background-color: #ffffff; padding: 30px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
          .header { color: #49656f; font-size: 26px; margin-bottom: 20px; }
          .sub-header { font-size: 18px; color: #333333; margin-bottom: 10px; }
          .details-section { margin-top: 20px; text-align: left; }
          .details-section ul { padding: 0; }
          .details-section li { list-style-type: none; margin-bottom: 15px; color: #555555; font-size: 16px; }
          .footer { margin-top: 40px; color: #777777; font-size: 14px; }
        </style>
      </head>
      <body>
      <div class="email-container" style="text-align: center;">
        <div class="email-content">
            <p class="header">Notificación de Nuevo Pedido</p>

            <div class="details-section">
              <p class="sub-header">Información del Cliente:</p>
              <ul>
                <li>Email del Cliente: ${order.payerEmail}</li>
                <li>Tipo de Documento: ${order.payerDocumentType}</li>
                <li>Número de Documento: ${order.payerDocumentNumber}</li>
                <li>Método de Envío: ${order.shippingMethod}</li>
              </ul>
            </div>

            <div class="details-section">
              <p class="sub-header">Detalles de Facturación:</p>
              <ul>
                <li>Nombre de Facturación: ${order.billingName}</li>
                <li>Dirección de Facturación: ${order.billingAddress}, ${
    order.billingCity
  }, ${order.billingRegion}</li>
                <li>Teléfono de Facturación: ${order.billingPhoneNumber}</li>
              </ul>
            </div>

            <div class="details-section">
              <p class="sub-header">Detalles de Envío:</p>
              <ul>
                <li>Nombre de Envío: ${order.shippingName ?? "N/A"}</li>
                <li>Dirección de Envío: ${order.shippingAddress ?? "N/A"}, ${
    order.shippingCity ?? "N/A"
  }, ${order.shippingRegion ?? "N/A"}</li>
                <li>Teléfono de Envío: ${
                  order.shippingPhoneNumber ?? "N/A"
                }</li>
              </ul>
            </div>

            <div class="details-section">
              <p class="sub-header">Detalles del Pedido:</p>
              <ul>
                <li>Fecha de Pago: ${new Date(
                  order.paymentDate
                ).toLocaleDateString("es-ES", {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                  hour: "2-digit",
                  minute: "2-digit",
                })}</li>
                <li>Monto Total: S/ ${formatAmount(
                  parseFloat(order.transactionAmount)
                )}</li>
              </ul>
            </div>

            <div class="details-section">
              <p class="sub-header">Artículos en el Pedido:</p>
              <ul>`;

  order.cart.forEach((product) => {
    emailBody += `
                <li>
                  ${product.title} - ${product.color} - Cantidad: ${product.quantity} - Precio: S/ ${product.price}
                </li>`;
  });

  emailBody += `
              </ul>
            </div>

            <p class="footer">Saludos,<br>El equipo de Beautipol</p>
          </div>
        </div>
      </body>
    </html>`;

  await sendEmail({
    from: `Beautipol <${adminEmail}>`,
    to: adminEmail,
    subject: "Notificación de Nuevo Pedido",
    html: emailBody,
  });
};

export {
  sendOrderConfirmationEmail,
  sendOrderNotificationToAdmin,
  sendVerificationEmail,
};
