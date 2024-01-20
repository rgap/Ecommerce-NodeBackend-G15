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
