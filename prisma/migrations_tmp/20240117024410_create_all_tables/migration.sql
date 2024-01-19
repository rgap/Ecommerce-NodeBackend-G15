-- CreateTable
CREATE TABLE `user` (
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_name` VARCHAR(120) NOT NULL,
    `user_email` VARCHAR(120) NOT NULL,
    `user_password` VARCHAR(120) NOT NULL,
    `user_phone_number` VARCHAR(20) NULL,
    `user_address` VARCHAR(255) NULL,
    `user_city` VARCHAR(50) NULL,
    `user_region` VARCHAR(50) NULL,
    `user_country` VARCHAR(50) NULL,
    `user_card_number` VARCHAR(20) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `user_user_email_key`(`user_email`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `color` (
    `color_id` INTEGER NOT NULL AUTO_INCREMENT,
    `color_name` VARCHAR(255) NOT NULL,
    `hex_color` VARCHAR(7) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`color_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `size` (
    `size_id` INTEGER NOT NULL AUTO_INCREMENT,
    `size_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`size_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product` (
    `product_id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_title` VARCHAR(84) NOT NULL,
    `product_description` VARCHAR(255) NOT NULL,
    `product_short_description` VARCHAR(28) NOT NULL,
    `product_main_image` VARCHAR(255) NOT NULL,
    `product_material` VARCHAR(255) NOT NULL,
    `product_care` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`product_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `image` (
    `image_id` INTEGER NOT NULL AUTO_INCREMENT,
    `image_url` VARCHAR(255) NULL,
    `image_product_id` INTEGER NOT NULL,

    PRIMARY KEY (`image_id`, `image_product_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stock` (
    `stock_id` INTEGER NOT NULL AUTO_INCREMENT,
    `stock_product_id` INTEGER NOT NULL,
    `stock_color_id` INTEGER NOT NULL,
    `stock_size_id` INTEGER NOT NULL,
    `stock_quantity` INTEGER NOT NULL,
    `price` DOUBLE NOT NULL,

    PRIMARY KEY (`stock_id`, `stock_product_id`, `stock_color_id`, `stock_size_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `image` ADD CONSTRAINT `image_image_product_id_fkey` FOREIGN KEY (`image_product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stock` ADD CONSTRAINT `stock_stock_product_id_fkey` FOREIGN KEY (`stock_product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stock` ADD CONSTRAINT `stock_stock_color_id_fkey` FOREIGN KEY (`stock_color_id`) REFERENCES `color`(`color_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stock` ADD CONSTRAINT `stock_stock_size_id_fkey` FOREIGN KEY (`stock_size_id`) REFERENCES `size`(`size_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
