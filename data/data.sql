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


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 3
-- -------------------------------------------

-- Insert new colors if not present
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('amarillo', '#FFFF00', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('rojo', '#FF0000', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('índigo', '#4B0082', NOW(), NOW());

-- Insert new product
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
('Polo Billabong Amarillo', 'Este polo Billabong en amarillo vibrante es ideal para un estilo juvenil y desenfadado. Excelente para el día a día, combinando comodidad y moda.', 'Vibrante y Confortable', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-%20amarillo-billabong-logo.jpg', 'Confección de calidad, 50% algodón, 50% modal, perfecto para el uso diario.', 'Lavado suave en ciclo delicado. No usar secadora. Planchar a temperatura baja.', '2023-10-31 14:20:00', '2023-10-31 14:20:00');

-- Insert additional images for this product
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 3);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 3);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 3);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 3);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-quiksilver.jpg', 3);

-- Insert stock information for each size and color variant
-- Replace color_id and size_id with the correct IDs from your tables

-- Talla S, Color Amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 7, 1, 18, 48.00);
-- Talla S, Color Rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 8, 1, 14, 48.00);
-- Talla S, Color Índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 9, 1, 11, 48.00);

-- Talla M, Color Amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 7, 2, 16, 58.00);
-- Talla M, Color Rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 8, 2, 10, 58.00);
-- Talla M, Color Índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 9, 2, 15, 58.00);

-- Talla L, Color Amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 7, 3, 14, 68.00);
-- Talla L, Color Rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 8, 3, 12, 68.00);
-- Talla L, Color Índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 9, 3, 8, 68.00);

-- Talla XL, Color Amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 7, 4, 10, 78.00);
-- Talla XL, Color Rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 8, 4, 8, 78.00);
-- Talla XL, Color Índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (3, 9, 4, 5, 78.00);


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 4
-- -------------------------------------------

-- Insert new colors if not present
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('marrón', '#A52A2A', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('crema', '#FFFDD0', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('rosado', '#FFC0CB', NOW(), NOW());

-- Insert new product
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
('Polo Ripcurl Marrón Floreado', 'El Polo Ripcurl Marrón Floreado combina estilo y confort, ideal para un look casual pero llamativo. Perfecto para cualquier ocasión.', 'Casual y Atractivo', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-marron-ripcurl-floreado.jpg', 'Composición mezclada: 60% algodón y 40% poliéster. Duradero y cómodo.', 'No usar lejía. Lavar a máquina temperatura normal. No secar en secadora. Planchar a temperatura media.', '2023-10-31 15:00:00', '2023-10-31 15:00:00');

-- Insert additional images for this product
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 4);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 4);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 4);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-celeste-quiksilver.jpg', 4);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 4);

-- Insert stock information for each size and color variant
-- Replace color_id and size_id with the correct IDs from your tables

-- Talla S, Color Marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 10, 1, 20, 50.00);
-- Talla S, Color Crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 11, 1, 15, 50.00);
-- Talla S, Color Rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 12, 1, 10, 50.00);

-- Talla M, Color Marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 10, 2, 18, 60.00);
-- Talla M, Color Crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 11, 2, 12, 60.00);
-- Talla M, Color Rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 12, 2, 8, 60.00);

-- Talla L, Color Marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 10, 3, 15, 70.00);
-- Talla L, Color Crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 11, 3, 10, 70.00);
-- Talla L, Color Rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 12, 3, 5, 70.00);

-- Talla XL, Color Marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 10, 4, 12, 80.00);
-- Talla XL, Color Crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 11, 4, 8, 80.00);
-- Talla XL, Color Rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (4, 12, 4, 3, 80.00);


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 5
-- -------------------------------------------

-- Insert new colors if not present
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('azul verdoso', '#008080', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('azul', '#0000FF', NOW(), NOW());
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('gris', '#808080', NOW(), NOW());

-- Insert new product
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
('Polo Nike Azul Claro', 'Este polo Nike en azul claro es la combinación perfecta de comodidad y estilo, ideal para un look relajado y deportivo.', 'Cómodo y Estilizado', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', '100% Algodón orgánico. Suave al tacto y amigable con el medio ambiente.', 'Lavado en ciclo suave con colores similares. No usar blanqueador. Secar a baja temperatura.', '2023-10-31 15:10:00', '2023-10-31 15:10:00');

-- Insert additional images for this product
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 5);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 5);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-ripcurl.jpg', 5);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 5);
INSERT INTO image (image_url, image_product_id) VALUES ('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-durazno-volcom.jpg', 5);

-- Insert stock information for each size and color variant
-- Replace color_id and size_id with the correct IDs from your tables

-- Talla S, Color Azul Verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 13, 1, 22, 49.00);
-- Talla S, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 14, 1, 18, 49.00);
-- Talla S, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 15, 1, 16, 49.00);

-- Talla M, Color Azul Verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 13, 2, 20, 59.00);
-- Talla M, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 14, 2, 15, 59.00);
-- Talla M, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 15, 2, 14, 59.00);

-- Talla L, Color Azul Verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 13, 3, 18, 69.00);
-- Talla L, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 14, 3, 12, 69.00);
-- Talla L, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 15, 3, 10, 69.00);

-- Talla XL, Color Azul Verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 13, 4, 15, 79.00);
-- Talla XL, Color Azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 14, 4, 10, 79.00);
-- Talla XL, Color Gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (5, 15, 4, 8, 79.00);
