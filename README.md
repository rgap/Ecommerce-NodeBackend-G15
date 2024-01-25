# ECOMMERCE-G15 - Back-End

An e-commerce website developed as a final project for a Fullstack bootcamp.

This is the Back-End project.

## Online Demo

https://ecommerce-react-g15.vercel.app/

## Tools & Frameworks

- PERN Stack: Postgres + Express.js + React + Node.js
- Nodemailer
- Prisma
- Nodemon
- Postman
- pgAdmin

## Install Dependencies

```
npm install
```

## Create .env

```
DATABASE_URL=""
```

## Database Migration

```
npx prisma migrate dev --name create_all_tables
npx prisma generate
```

## Run The Server

```
npm run dev
```
