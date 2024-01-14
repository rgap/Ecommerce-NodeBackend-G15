-- SQLBook: Code
-- Insert data into `user`
INSERT INTO `user` (user_id, user_name, user_email, user_password, user_phone_number, user_address, user_city, user_region, user_country, user_card_number, created_at, updated_at) VALUES
(1, 'John Doe', 'johndoe@example.com', 'hashed_password', '1234567890', '1234 Main St', 'Springfield', 'State1', 'CountryX', '1234123412341234', NOW(), NOW()),
(2, 'Jane Smith', 'janesmith@example.com', 'hashed_password2', '0987654321', '5678 Second Ave', 'Centerville', 'State2', 'CountryY', '4321432143214321', NOW(), NOW());

-- Insert data into `color`
INSERT INTO `color` (color_id, color_name, created_at, updated_at) VALUES
(1, 'Red', NOW(), NOW()),
(2, 'Blue', NOW(), NOW());

-- Insert data into `size`
INSERT INTO `size` (size_id, size_name, created_at, updated_at) VALUES
(1, 'Small', NOW(), NOW()),
(2, 'Medium', NOW(), NOW()),
(3, 'Large', NOW(), NOW());

-- Insert data into `product`
INSERT INTO `product` (product_id, product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) VALUES
(1, 'T-Shirt', 'A comfortable cotton t-shirt', 'Cotton Tee', 'image_url_1', '100% Cotton', 'Machine wash', NOW(), NOW()),
(2, 'Jeans', 'Stylish denim jeans', 'Denim Jeans', 'image_url_2', 'Denim', 'Machine wash', NOW(), NOW());

-- Insert data into `image`
INSERT INTO `image` (image_id, image_url, image_product_id) VALUES
(1, 'image_url_1', 1),
(2, 'image_url_2', 2);

-- Insert data into `stock`
INSERT INTO `stock` (stock_id, stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES
(1, 1, 1, 1, 100, 19.99),
(2, 1, 2, 2, 150, 19.99),
(3, 2, 1, 3, 50, 49.99);
