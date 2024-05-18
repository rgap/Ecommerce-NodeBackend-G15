/*
  Warnings:

  - You are about to drop the column `slug` on the `product` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[product_slug]` on the table `product` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `product_slug` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "product_slug_key";

-- AlterTable
ALTER TABLE "product" DROP COLUMN "slug",
ADD COLUMN     "product_slug" VARCHAR(255) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "product_product_slug_key" ON "product"("product_slug");
