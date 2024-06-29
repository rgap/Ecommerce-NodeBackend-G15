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
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "color" (
    "color_id" SERIAL NOT NULL,
    "color_name" VARCHAR(255) NOT NULL,
    "color_code" VARCHAR(7) NOT NULL,
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
    "product_slug" VARCHAR(255) NOT NULL,
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
    "stock_price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "stock_pkey" PRIMARY KEY ("stock_product_id","stock_color_id","stock_size_id")
);

-- CreateTable
CREATE TABLE "order" (
    "order_id" SERIAL NOT NULL,
    "order_payment_id" INTEGER,
    "order_user_id" INTEGER NOT NULL,
    "order_payment_date" TIMESTAMP(3),
    "order_payer_email" VARCHAR(250) NOT NULL,
    "order_payer_document_type" VARCHAR(10) NOT NULL,
    "order_payer_document_number" VARCHAR(50) NOT NULL,
    "order_installments" INTEGER NOT NULL,
    "order_payment_method_id" VARCHAR(20) NOT NULL,
    "order_status" VARCHAR(10) NOT NULL,
    "order_amount" DECIMAL(65,30) NOT NULL,
    "order_shipping_method" VARCHAR(255) NOT NULL,
    "order_shipping_name" VARCHAR(120) NOT NULL,
    "order_shipping_address" VARCHAR(255),
    "order_shipping_city" VARCHAR(50),
    "order_shipping_region" VARCHAR(50),
    "order_shipping_phone_number" VARCHAR(20),
    "order_billing_name" VARCHAR(120) NOT NULL,
    "order_billing_address" VARCHAR(255),
    "order_billing_city" VARCHAR(50),
    "order_billing_region" VARCHAR(50),
    "order_billing_phone_number" VARCHAR(20),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "order_pkey" PRIMARY KEY ("order_id")
);

-- CreateTable
CREATE TABLE "item" (
    "item_id" SERIAL NOT NULL,
    "item_order_id" INTEGER NOT NULL,
    "item_product_id" INTEGER NOT NULL,
    "item_title" VARCHAR(255) NOT NULL,
    "item_color" VARCHAR(50) NOT NULL,
    "item_image_url" VARCHAR(255) NOT NULL,
    "item_quantity" INTEGER NOT NULL,
    "item_price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "item_pkey" PRIMARY KEY ("item_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_user_email_key" ON "user"("user_email");

-- CreateIndex
CREATE UNIQUE INDEX "user_user_email_token_key" ON "user"("user_email_token");

-- CreateIndex
CREATE UNIQUE INDEX "color_color_name_key" ON "color"("color_name");

-- CreateIndex
CREATE UNIQUE INDEX "size_size_name_key" ON "size"("size_name");

-- CreateIndex
CREATE UNIQUE INDEX "product_product_slug_key" ON "product"("product_slug");

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_image_product_id_fkey" FOREIGN KEY ("image_product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_stock_product_id_fkey" FOREIGN KEY ("stock_product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_stock_color_id_fkey" FOREIGN KEY ("stock_color_id") REFERENCES "color"("color_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_stock_size_id_fkey" FOREIGN KEY ("stock_size_id") REFERENCES "size"("size_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_order_user_id_fkey" FOREIGN KEY ("order_user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_item_order_id_fkey" FOREIGN KEY ("item_order_id") REFERENCES "order"("order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_item_product_id_fkey" FOREIGN KEY ("item_product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;
