-- CreateTable
CREATE TABLE "user" (
    "user_id" SERIAL NOT NULL,
    "user_name" VARCHAR(120) NOT NULL,
    "user_email" VARCHAR(120) NOT NULL,
    "user_password" VARCHAR(120) NOT NULL,
    "user_is_verified" BOOLEAN NOT NULL DEFAULT false,
    "user_email_token" VARCHAR(255),
    "user_phone_number" VARCHAR(20),
    "user_address" VARCHAR(255),
    "user_city" VARCHAR(50),
    "user_region" VARCHAR(50),
    "user_country" VARCHAR(50),
    "user_card_number" VARCHAR(20),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "color" (
    "color_id" SERIAL NOT NULL,
    "color_name" VARCHAR(255) NOT NULL,
    "hex_color" VARCHAR(7) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "color_pkey" PRIMARY KEY ("color_id")
);

-- CreateTable
CREATE TABLE "size" (
    "size_id" SERIAL NOT NULL,
    "size_name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "size_pkey" PRIMARY KEY ("size_id")
);

-- CreateTable
CREATE TABLE "product" (
    "product_id" SERIAL NOT NULL,
    "product_title" VARCHAR(84) NOT NULL,
    "product_description" VARCHAR(255) NOT NULL,
    "product_short_description" VARCHAR(28) NOT NULL,
    "product_main_image" VARCHAR(255) NOT NULL,
    "product_material" VARCHAR(255) NOT NULL,
    "product_care" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "image" (
    "image_id" SERIAL NOT NULL,
    "image_url" VARCHAR(255) NOT NULL,
    "image_product_id" INTEGER NOT NULL,

    CONSTRAINT "image_pkey" PRIMARY KEY ("image_id")
);

-- CreateTable
CREATE TABLE "stock" (
    "stock_product_id" INTEGER NOT NULL,
    "stock_color_id" INTEGER NOT NULL,
    "stock_size_id" INTEGER NOT NULL,
    "stock_quantity" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "stock_pkey" PRIMARY KEY ("stock_product_id","stock_color_id","stock_size_id")
);

-- CreateTable
CREATE TABLE "payment" (
    "id" SERIAL NOT NULL,
    "payment_id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "payment_date" TIMESTAMP(3),
    "payer_email" VARCHAR(250) NOT NULL,
    "payer_document_type" VARCHAR(10) NOT NULL,
    "payer_document_number" VARCHAR(50) NOT NULL,
    "installments" INTEGER,
    "issuer_id" VARCHAR(100) NOT NULL,
    "payment_method_id" VARCHAR(20) NOT NULL,
    "token" VARCHAR(250) NOT NULL,
    "status" VARCHAR(10) NOT NULL,
    "amount" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "payment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_user_email_key" ON "user"("user_email");

-- CreateIndex
CREATE UNIQUE INDEX "user_user_email_token_key" ON "user"("user_email_token");

-- CreateIndex
CREATE UNIQUE INDEX "color_color_name_key" ON "color"("color_name");

-- CreateIndex
CREATE UNIQUE INDEX "size_size_name_key" ON "size"("size_name");

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_image_product_id_fkey" FOREIGN KEY ("image_product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_stock_product_id_fkey" FOREIGN KEY ("stock_product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_stock_color_id_fkey" FOREIGN KEY ("stock_color_id") REFERENCES "color"("color_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_stock_size_id_fkey" FOREIGN KEY ("stock_size_id") REFERENCES "size"("size_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
