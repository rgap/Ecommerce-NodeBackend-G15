/*
  Warnings:

  - Made the column `slug` on table `product` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "product" ALTER COLUMN "slug" SET NOT NULL;
