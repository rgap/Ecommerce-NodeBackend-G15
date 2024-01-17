USE beautipol;

-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 1
-- -------------------------------------------

-- Insertar en la tabla `color` con nombres de colores en español y valores hexadecimales
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('verde', '#008000', NOW(), NOW());  -- Verde, asumiendo #008000
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('azul verdoso', '#008080', NOW(), NOW());  -- Azul verdoso (Teal), asumiendo #008080
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('crema', '#FFFDD0', NOW(), NOW()); -- Crema, asumiendo #FFFDD0

-- Insertar en la tabla `size`
INSERT INTO size (size_name, created_at, updated_at) VALUES ('s', NOW(), NOW());
INSERT INTO size (size_name, created_at, updated_at) VALUES ('m', NOW(), NOW());
INSERT INTO size (size_name, created_at, updated_at) VALUES ('l', NOW(), NOW());
INSERT INTO size (size_name, created_at, updated_at) VALUES ('xl', NOW(), NOW());

-- Insertar en la tabla `product`
INSERT INTO product 
(product_id, product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
(1, 'Polo Nike Verde Claro', 'Este polo Nike en verde claro combina estilo y comodidad. Ideal para actividades al aire libre o un look casual. Material suave y duradero.', 'Confort Casual y Estilo', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-nike-m-nobg.jpg', 'Tejido de alta calidad, 60% algodón, 40% poliéster, suave al tacto.', 'Lavado a máquina con colores similares, secado en línea, planchar a baja temperatura.', '2023-10-31 14:05:00', '2023-10-31 14:05:00');

-- Insertar en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 1);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 1);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 1);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-guinda-ripcurl.jpg', 1);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 1);


-- Insertar en la tabla stock con precio uniforme para todas las combinaciones
-- Asumiendo un precio estándar de $50.00 para el ejemplo
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 1, 20, 55.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 1, 15, 55.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 1, 10, 55.00); -- crema

-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 2, 25, 65.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 2, 20, 65.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 2, 12, 65.00); -- crema

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 3, 30, 75.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 3, 18, 75.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 3, 8, 75.00); -- crema

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 4, 15, 85.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 4, 10, 85.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 4, 5, 85.00); -- crema


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 2
-- -------------------------------------------

-- Insert new colors if not present
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('azul', '#0000FF', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('negro', '#000000', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('gris', '#808080', NOW(), NOW());

-- Insert new product
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
('Polo Quiksilver Turquesa', 'El polo Quiksilver en color turquesa ofrece un look fresco y relajado, perfecto para días soleados. Material resistente y fácil de cuidar.', 'Frescura y Estilo Veraniego', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-turqueza-quiksilver.jpg', 'Tejido transpirable, 70% algodón y 30% poliéster, ideal para el calor.', 'Lavar a mano o máquina con agua fría. No usar cloro. Secar colgado a la sombra.', '2023-10-31 14:15:00', '2023-10-31 14:15:00');

-- Insert additional images for this product
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 2);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 2);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 2);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 2);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 2);

-- Insert stock information for each size and color variant
-- Replace color_id and size_id with the correct IDs from your tables

-- Talla S, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 4, 1, 10, 55.00);
-- Talla S, Color Negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 5, 1, 12, 55.00);
-- Talla S, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 6, 1, 8, 55.00);

-- Talla M, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 4, 2, 15, 65.00);
-- Talla M, Color Negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 5, 2, 9, 65.00);
-- Talla M, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 6, 2, 10, 65.00);

-- Talla L, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 4, 3, 12, 75.00);
-- Talla L, Color Negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 5, 3, 7, 75.00);
-- Talla L, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 6, 3, 6, 75.00);

-- Talla XL, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 4, 4, 8, 85.00);
-- Talla XL, Color Negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 5, 4, 5, 85.00);
-- Talla XL, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, 6, 4, 4, 85.00);
