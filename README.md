# ECOMMERCE-G15 - Back-End

An e-commerce website developed as a final project for a Fullstack bootcamp.

This is the Back-End project.

## Online Demo

https://ecommerce-react-g15.vercel.app/

## Tools & Frameworks

We implemented a PERN Stack: Postgres + Express.js + React + Node.js.

This repository only contains the API developed in Node.js

The tools used (besides VS Code) were Postman, pgAdmin, MySQL Workbench, Live Share, Github Copilot, and ChatGPT 4.

### Main Dependencies

- express: Framework for building web applications and APIs in Node.js, offers robust features.
- @prisma/client: ORM for safe, programmatic database access, simplifies queries and operations.
- prisma: ORM for database tasks like configuration and migrations during development.
- pg: PostgreSQL client for Node.js, used for database queries and operations.
- dotenv: Loads environment variables from a .env file for secure configuration management.
- nodemon: Automatically restarts Node.js applications when file changes are detected.
- cors: Enables/disables cross-origin resource sharing in web applications for security.

### Other Dependencies

- axios: Promise-based HTTP client for making web requests and communicating with APIs (for requests to mercadopago).
- nodemailer: Node.js module to send emails, useful for confirmations and notifications.

## Configuration

### Install Dependencies

```
npm install
```

### Create The .env File

```
DEBUG_MODE: This variable is used to enable or disable debugging functions. (true/false)

HMAC_SECRET_KEY: A secret key used for HMAC operations (Hash-based Message Authentication Code). (e.g., "secret")

SMTP_HOST: The hostname or IP address of your SMTP server, used for sending emails. (e.g., "smtp-relay.brevo.com")

SMTP_PORT: The port number on which your SMTP server is listening. (e.g., 587)

SMTP_SECURE: This boolean variable indicates whether to use SSL/TLS when connecting to the SMTP server. (true/false)

SMTP_USER: The username for authenticating with your SMTP server. (e.g., "email@email.com")

SMTP_PASSWORD: The password for authenticating with your SMTP server. (e.g., "pass")

MERCADO_PAGO_TOKEN: Your Mercado Pago API token. Mercado Pago is a digital payment platform, and this token is necessary to integrate with its API. (e.g., "TEST-AAAA1111")

HOSTNAME_FRONTEND: URL or address of the frontend application. (e.g., "http://localhost:5173")

DATABASE_URL: The connection string for the database.
```

### Database Migration

```
npx prisma migrate dev --name create_all_tables
npx prisma generate
```

### Run The Server

```
npm run dev
```

## Relational Model

<p align="center">
  <img src="https://raw.githubusercontent.com/rgap/Ecommerce-NodeBackend-G15/main/models/RelationalModel.png">
</p>

## Postman Queries

<p align="center">
  <img src="https://raw.githubusercontent.com/rgap/Ecommerce-NodeBackend-G15/main/models/postman.png" width="400">
</p>
