-- ------------------------------------------- 
-- ------------------------------------------- USERS
-- -------------------------------------------

INSERT INTO "user"
(user_name, user_email, user_password, user_is_verified, user_email_token, user_phone_number, user_address, user_city, user_region, user_country, updated_at) 
VALUES 
('Beautipol Alpha', 'beautipol.alpha.1@gmail.com', 'bc803f8921a459d6e00098c8c09dcfb42778ca286be413fbbc0fb6dbbfe3d537', true, 'token', '+51 123909090', 'Av. Larco 1010, Miraflores', 'Lima', 'Lima', 'Perú', NOW());
-- pass: a1234567

-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 1
-- -------------------------------------------

-- Insertar colores nuevos en la base de datos
INSERT INTO color (color_name, color_code, created_at, updated_at) VALUES 
('verde', '#008000', NOW(), NOW()),  -- Verde
('azul verdoso', '#008080', NOW(), NOW()),  -- Azul verdoso (Teal)
('crema', '#FFFDD0', NOW(), NOW()), -- Crema
('blanco', '#FFFFFF', NOW(), NOW()); -- Blanco

-- Insertar en la tabla `size`
INSERT INTO size (size_name, created_at, updated_at) VALUES 
('s', NOW(), NOW()),
('m', NOW(), NOW()),
('l', NOW(), NOW()),
('xl', NOW(), NOW());

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Nike Verde Claro', 
 'Este polo Nike en verde claro combina estilo y comodidad. Ideal para actividades al aire libre o un look casual. Material suave y duradero.', 
 'Confort Casual y Estilo', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-nike-m-nobg.jpg', 
 'Tejido de alta calidad, 60% algodón, 40% poliéster, suave al tacto.', 
 'Lavado a máquina con colores similares, secado en línea, planchar a baja temperatura.', 
 'polo-nike-verde-claro', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-guinda-ripcurl.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 1);

-- Insertar en la tabla stock para el Producto 1 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 1, 1, 20, 55.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 2, 1, 15, 55.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 3, 1, 10, 55.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 4, 1, 12, 55.00); -- blanco

-- Talla M (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 1, 2, 25, 65.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 2, 2, 20, 65.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 3, 2, 12, 65.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 4, 2, 14, 65.00); -- blanco

-- Talla L (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 1, 3, 30, 75.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 2, 3, 18, 75.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 3, 3, 8, 75.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 4, 3, 16, 75.00); -- blanco

-- Talla XL (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 1, 4, 15, 85.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 2, 4, 10, 85.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 3, 4, 5, 85.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (1, 4, 4, 7, 85.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 2
-- -------------------------------------------

-- Insertar colores nuevos en la base de datos (si no están ya insertados)
INSERT INTO color (color_name, color_code, created_at, updated_at) VALUES 
('turquesa', '#40E0D0', NOW(), NOW()),  -- Turquesa
('negro', '#000000', NOW(), NOW()),     -- Negro
('gris', '#808080', NOW(), NOW());      -- Gris
-- Asumiendo que el color 'blanco' ya está insertado

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Quiksilver Turquesa', 
 'El polo Quiksilver en color turquesa ofrece un look fresco y relajado, perfecto para días soleados. Material resistente y fácil de cuidar.', 
 'Frescura y Estilo Veraniego', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-turqueza-quiksilver.jpg', 
 'Tejido transpirable, 70% algodón y 30% poliéster, ideal para el calor.', 
 'Lavar a mano o máquina con agua fría. No usar cloro. Secar colgado a la sombra.', 
 'polo-quiksilver-turquesa', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 2);

-- Insertar en la tabla stock para el Producto 2 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 5, 1, 10, 55.00); -- turquesa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 6, 1, 12, 55.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 7, 1, 8, 55.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 4, 1, 7, 55.00);  -- blanco

-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 5, 2, 12, 65.00); -- turquesa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 6, 2, 8, 65.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 7, 2, 18, 65.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 4, 2, 14, 65.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 5, 3, 10, 75.00); -- turquesa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 6, 3, 6, 75.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 7, 3, 15, 75.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 4, 3, 16, 75.00); -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 5, 4, 7, 85.00); -- turquesa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 6, 4, 4, 85.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 7, 4, 12, 85.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (2, 4, 4, 10, 85.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 3
-- -------------------------------------------

-- Insertar colores nuevos si aún no están en la base de datos
INSERT INTO color (color_name, color_code, created_at, updated_at) VALUES 
('amarillo', '#FFFF00', NOW(), NOW()),  -- Amarillo
('rojo', '#FF0000', NOW(), NOW()),      -- Rojo
('indigo', '#4B0082', NOW(), NOW());    -- Indigo

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' y los colores 'amarillo', 'rojo', 'indigo', 'blanco' ya están insertados

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Billabong Amarillo', 
 'Este polo Billabong en amarillo vibrante es ideal para un estilo juvenil y desenfadado. Excelente para el día a día, combinando comodidad y moda.', 
 'Vibrante y Confortable', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-%20amarillo-billabong-logo.jpg', 
 'Confección de calidad, 50% algodón, 50% modal, perfecto para el uso diario.', 
 'Lavado suave en ciclo delicado. No usar secadora. Planchar a temperatura baja.', 
 'polo-billabong-amarillo', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 3),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 3),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 3),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 3),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-quiksilver.jpg', 3);

-- Insertar en la tabla stock para el Producto 3 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 8, 1, 18, 48.00); -- amarillo (ID 8)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 9, 1, 14, 48.00); -- rojo (ID 9)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 10, 1, 11, 48.00); -- indigo (ID 10)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 4, 1, 9, 48.00);  -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 8, 2, 16, 58.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 9, 2, 10, 58.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 10, 2, 15, 58.00); -- indigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 4, 2, 12, 58.00);  -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 8, 3, 14, 68.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 9, 3, 12, 68.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 10, 3, 8, 68.00);  -- indigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 4, 3, 10, 68.00);  -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 8, 4, 10, 78.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 9, 4, 8, 78.00);  -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 10, 4, 5, 78.00);  -- indigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (3, 4, 4, 7, 78.00);   -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 4
-- -------------------------------------------

-- Insertar color nuevo en la base de datos (si no está ya insertado)
INSERT INTO color (color_name, color_code, created_at, updated_at) VALUES 
('marrón', '#A52A2A', NOW(), NOW()),   -- Marrón
('rosado', '#FFC0CB', NOW(), NOW());    -- Rosado
-- Asumiendo que los colores 'crema' y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Ripcurl Marrón Floreado', 
 'El Polo Ripcurl Marrón Floreado combina estilo y confort, ideal para un look casual pero llamativo. Perfecto para cualquier ocasión.', 
 'Casual y Atractivo', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-marron-ripcurl-floreado.jpg', 
 'Composición mezclada: 60% algodón y 40% poliéster. Duradero y cómodo.', 
 'No usar lejía. Lavar a máquina temperatura normal. No secar en secadora. Planchar a temperatura media.', 
 'polo-ripcurl-marron-floreado', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 4),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 4),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 4),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-celeste-quiksilver.jpg', 4),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 4);

-- Insertar en la tabla stock para el Producto 4 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 11, 1, 20, 50.00); -- marrón (ID 11)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 3, 1, 15, 50.00);  -- crema (ID 3)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 12, 1, 10, 50.00); -- rosado (ID 12)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 4, 1, 12, 50.00);  -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 11, 2, 18, 60.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 3, 2, 12, 60.00);  -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 12, 2, 8, 60.00);  -- rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 4, 2, 14, 60.00);  -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 11, 3, 15, 70.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 3, 3, 10, 70.00);  -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 12, 3, 5, 70.00);  -- rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 4, 3, 16, 70.00);  -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 11, 4, 12, 80.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 3, 4, 8, 80.00);  -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 12, 4, 3, 80.00);  -- rosado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (4, 4, 4, 10, 80.00);  -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 5
-- -------------------------------------------

-- Asumiendo que los colores 'azul verdoso' (teal), 'azul', 'gris' y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Nike Azul Claro', 
 'Este polo Nike en azul claro es la combinación perfecta de comodidad y estilo, ideal para un look relajado y deportivo.', 
 'Cómodo y Estilizado', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 
 '100% Algodón orgánico. Suave al tacto y amigable con el medio ambiente.', 
 'Lavado en ciclo suave con colores similares. No usar blanqueador. Secar a baja temperatura.', 
 'polo-nike-azul-claro', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 5),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 5),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-ripcurl.jpg', 5),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 5),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-durazno-volcom.jpg', 5);

-- Insertar en la tabla stock para el Producto 5 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 2, 1, 22, 49.00); -- azul verdoso (teal) (ID 2)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 5, 1, 18, 49.00); -- azul (ID 5)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 7, 1, 16, 49.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 4, 1, 14, 49.00); -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 2, 2, 20, 59.00); -- azul verdoso (teal)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 5, 2, 15, 59.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 7, 2, 14, 59.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 4, 2, 12, 59.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 2, 3, 18, 69.00); -- azul verdoso (teal)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 5, 3, 12, 69.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 7, 3, 10, 69.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 4, 3, 8, 69.00);  -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 2, 4, 15, 79.00); -- azul verdoso (teal)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 5, 4, 10, 79.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 7, 4, 8, 79.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (5, 4, 4, 6, 79.00);  -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 6
-- -------------------------------------------

-- Asumiendo que los colores 'verde', 'amarillo', 'blanco' y 'gris' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Quiksilver Verde Claro', 
 'Polo Quiksilver en tono verde claro, perfecto para un estilo casual y moderno. Ideal para el día a día y salidas casuales.', 
 'Casual y Moderno', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 
 'Material premium: 75% algodón y 25% poliéster. Resistente y fresco.', 
 'Lavar a mano con agua tibia. No usar secadora. Planchar a baja temperatura. Evitar el uso de blanqueadores.', 
 'polo-quiksilver-verde-claro', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 6),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 6),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 6),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-amarillo-adidas.jpg', 6),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 6);

-- Insertar en la tabla stock para el Producto 6 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 1, 1, 10, 43.00); -- verde (ID 1)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 8, 1, 8, 43.00);  -- amarillo (ID 8)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 4, 1, 12, 43.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 7, 1, 9, 43.00);  -- gris (ID 7)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 1, 2, 12, 53.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 8, 2, 10, 53.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 4, 2, 14, 53.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 7, 2, 11, 53.00); -- gris

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 1, 3, 14, 63.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 8, 3, 12, 63.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 4, 3, 16, 63.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 7, 3, 13, 63.00); -- gris

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 1, 4, 16, 73.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 8, 4, 14, 73.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 4, 4, 18, 73.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (6, 7, 4, 15, 73.00); -- gris


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 7
-- -------------------------------------------

-- Asumiendo que los colores 'azul', 'índigo', 'gris' y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Ripcurl Azul Claro', 
 'Este Polo Ripcurl en azul claro es perfecto para un estilo relajado y versátil, adaptándose a diversas ocasiones y estilos.', 
 'Versátil y Relajado', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 
 'Composición: 80% algodón, 20% poliéster. Ideal para confort diario.', 
 'Lavado a máquina con colores similares. No usar cloro. Secar al aire libre.', 
 'polo-ripcurl-azul-claro', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-melange-nike.jpg', 7),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 7),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 7),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-durazno-volcom.jpg', 7),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 7);

-- Insertar en la tabla stock para el Producto 7 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 5, 1, 15, 47.00); -- azul (ID 5)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 10, 1, 12, 47.00); -- índigo (ID 10)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 7, 1, 10, 47.00);  -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 4, 1, 8, 47.00);   -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 5, 2, 13, 57.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 10, 2, 10, 57.00); -- índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 7, 2, 8, 57.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 4, 2, 6, 57.00);  -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 5, 3, 10, 67.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 10, 3, 8, 67.00);  -- índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 7, 3, 6, 67.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 4, 3, 4, 67.00);  -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 5, 4, 8, 77.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 10, 4, 5, 77.00);  -- índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 7, 4, 4, 77.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (7, 4, 4, 2, 77.00);  -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 8
-- -------------------------------------------

-- Insertar color nuevo en la base de datos (si no está ya insertado)
INSERT INTO color (color_name, color_code, created_at, updated_at) VALUES 
('guinda', '#800000', NOW(), NOW());   -- Guinda
-- Asumiendo que los colores 'negro', 'crema' y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Ripcurl Guinda', 
 'El Polo Ripcurl en tono guinda combina comodidad y elegancia, ideal para un estilo sofisticado en cualquier ocasión.', 
 'Elegante y Cómodo', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-guinda-ripcurl.jpg', 
 'Tela suave y resistente, 60% algodón y 40% poliéster, para un uso prolongado.', 
 'Lavar a mano en agua fría. No exprimir. Secar a la sombra para mantener el color.', 
 'polo-ripcurl-guinda', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 8),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-amarillo-adidas.jpg', 8),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 8),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 8),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-celeste-quiksilver.jpg', 8);

-- Insertar en la tabla stock para el Producto 8 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 13, 1, 11, 49.00); -- guinda (ID 13)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 6, 1, 9, 49.00);  -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 3, 1, 7, 49.00);  -- crema (ID 3)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 4, 1, 5, 49.00);  -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 13, 2, 13, 59.00); -- guinda
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 6, 2, 11, 59.00);  -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 3, 2, 9, 59.00);  -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 4, 2, 7, 59.00);  -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 13, 3, 10, 69.00); -- guinda
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 6, 3, 8, 69.00);  -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 3, 3, 6, 69.00);  -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 4, 3, 4, 69.00);  -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 13, 4, 7, 79.00); -- guinda
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 6, 4, 5, 79.00);  -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 3, 4, 3, 79.00);  -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (8, 4, 4, 2, 79.00);  -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 9
-- -------------------------------------------

-- Asumiendo que los colores 'negro', 'gris', 'blanco' y 'azul' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Volcom Negro', 
 'Polo Volcom en color negro, un básico indispensable con un diseño moderno y materiales de calidad superior.', 
 'Moderno y Versátil', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 
 'Hecho con 100% algodón orgánico, suave al tacto y amigable con el medio ambiente.', 
 'Lavar a máquina con colores similares, agua fría. No usar secadora. Planchar a temperatura baja.', 
 'polo-volcom-negro', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 9),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 9),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 9),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 9),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 9);

-- Insertar en la tabla stock para el Producto 9 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 6, 1, 20, 40.00); -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 7, 1, 18, 40.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 4, 1, 15, 40.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 5, 1, 17, 40.00); -- azul (ID 5)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 6, 2, 18, 50.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 7, 2, 16, 50.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 4, 2, 13, 50.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 5, 2, 15, 50.00); -- azul

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 6, 3, 15, 60.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 7, 3, 13, 60.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 4, 3, 10, 60.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 5, 3, 12, 60.00); -- azul

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 6, 4, 12, 70.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 7, 4, 10, 70.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 4, 4, 8, 70.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (9, 5, 4, 9, 70.00);  -- azul


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 10
-- -------------------------------------------

-- Asumiendo que los colores 'morado', 'índigo', 'azul', y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Adidas Morado', 
 'Con un diseño único y moderno, este polo morado de Adidas es perfecto para cualquier ocasión, combinando estilo y confort.', 
 'Estilo Único y Fresco', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 
 'Fabricado con una mezcla perfecta de algodón (60%) y poliéster (40%), garantizando comodidad y resistencia.', 
 'Recomendable lavar a máquina en programa delicado. No usar secadora. Planchar a baja temperatura.', 
 'polo-adidas-morado', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 10),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 10),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 10),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 10),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 10);

-- Insertar en la tabla stock para el Producto 10 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 8, 1, 20, 47.00); -- morado (ID 8)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 9, 1, 15, 47.00); -- índigo (ID 9)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 5, 1, 10, 47.00); -- azul (ID 5)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 4, 1, 12, 47.00); -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 8, 2, 18, 57.00); -- morado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 9, 2, 12, 57.00); -- índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 5, 2, 8, 57.00);  -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 4, 2, 14, 57.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 8, 3, 16, 67.00); -- morado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 9, 3, 10, 67.00); -- índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 5, 3, 6, 67.00);  -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 4, 3, 16, 67.00); -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 8, 4, 14, 77.00); -- morado
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 9, 4, 8, 77.00);  -- índigo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 5, 4, 4, 77.00);  -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (10, 4, 4, 18, 77.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 11
-- -------------------------------------------

-- Asumiendo que los colores 'gris', 'negro', 'blanco', y 'azul' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Nike Gris Naranja', 
 'Este polo gris con naranja de Nike es la combinación perfecta de estilo y comodidad, ideal para el uso diario y ocasiones casuales.', 
 'Cómodo y Estilizado', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-melange-nike.jpg', 
 'Hecho con un 80% de algodón y 20% poliéster, ofrece confort y durabilidad en su uso diario.', 
 'Lavar en máquina en programa para prendas delicadas, secar colgado, no usar blanqueador.', 
 'polo-nike-gris-naranja', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 11),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 11),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 11),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 11),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 11);

-- Insertar en la tabla stock para el Producto 11 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 7, 1, 20, 48.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 6, 1, 15, 48.00); -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 4, 1, 12, 48.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 5, 1, 14, 48.00); -- azul (ID 5)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 7, 2, 18, 58.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 6, 2, 12, 58.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 4, 2, 10, 58.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 5, 2, 13, 58.00); -- azul

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 7, 3, 15, 68.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 6, 3, 10, 68.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 4, 3, 8, 68.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 5, 3, 11, 68.00); -- azul

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 7, 4, 10, 78.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 6, 4, 7, 78.00);  -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 4, 4, 5, 78.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (11, 5, 4, 9, 78.00);  -- azul


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 12
-- -------------------------------------------

-- Asumiendo que los colores 'blanco', 'crema', 'gris', y un cuarto color (añadido aquí como 'azul') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Quiksilver Blanco', 
 'El polo Quiksilver blanco es una pieza esencial para un estilo casual y relajado, perfecto para el día a día o actividades al aire libre.', 
 'Casual y Ecológico', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 
 'Fabricado con 100% algodón orgánico, brinda una experiencia de uso suave y respetuosa con el medio ambiente.', 
 'Lavar a mano o en ciclo suave, no usar secadora, planchar a baja temperatura.', 
 'polo-quiksilver-blanco', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 12),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 12),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 12),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 12),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 12);

-- Insertar en la tabla stock para el Producto 12 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 4, 1, 22, 49.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 3, 1, 18, 49.00); -- crema (ID 3)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 7, 1, 14, 49.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 5, 1, 16, 49.00); -- azul (ID 5)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 4, 2, 20, 59.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 3, 2, 16, 59.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 7, 2, 12, 59.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 5, 2, 14, 59.00); -- azul

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 4, 3, 17, 69.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 3, 3, 14, 69.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 7, 3, 10, 69.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 5, 3, 11, 69.00); -- azul

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 4, 4, 13, 79.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 3, 4, 11, 79.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 7, 4, 8, 79.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (12, 5, 4, 9, 79.00);  -- azul


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 13
-- -------------------------------------------

-- Asumiendo que los colores 'amarillo', 'blanco', 'negro', y un cuarto color (añadido aquí como 'azul') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Adidas Amarillo', 
 'El polo amarillo de Adidas combina estilo y comodidad, perfecto para actividades deportivas o un look casual diario.', 
 'Deporte y Estilo Diario', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-amarillo-adidas.jpg', 
 'Tejido 90% algodón y 10% elastano para mayor comodidad y flexibilidad durante todo el día.', 
 'Lavar a máquina a 30ºC. No usar blanqueador. No apto para secadora. Planchar a temperatura media.', 
 'polo-adidas-amarillo', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 13),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 13),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 13),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 13),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-quiksilver.jpg', 13);

-- Insertar en la tabla stock para el Producto 13 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 10, 1, 10, 50.00); -- amarillo (ID 10)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 4, 1, 20, 50.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 6, 1, 15, 50.00); -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 5, 1, 17, 50.00); -- azul (ID 5)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 10, 2, 12, 60.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 4, 2, 18, 60.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 6, 2, 14, 60.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 5, 2, 16, 60.00); -- azul

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 10, 3, 8, 70.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 4, 3, 15, 70.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 6, 3, 12, 70.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 5, 3, 14, 70.00); -- azul

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 10, 4, 5, 80.00); -- amarillo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 4, 4, 10, 80.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 6, 4, 8, 80.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (13, 5, 4, 9, 80.00); -- azul


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 14
-- -------------------------------------------

-- Asumiendo que los colores 'azul', 'negro', 'gris', y un cuarto color (añadido aquí como 'blanco') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Nike Azul', 
 'Este polo Nike en tono azul es ideal para cualquier actividad, ofreciendo confort y un estilo moderno y versátil.', 
 'Confort y Estilo Moderno', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 
 '100% algodón de alta calidad, garantiza durabilidad y una sensación agradable al tacto.', 
 'Lavado a máquina en agua fría con colores similares. No usar lejía. Secar en horizontal. No planchar los estampados.', 
 'polo-nike-azul', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 14),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-amarillo-adidas.jpg', 14),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 14),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 14),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-celeste-quiksilver.jpg', 14);

-- Insertar en la tabla stock para el Producto 14 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 5, 1, 15, 52.00); -- azul (ID 5)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 6, 1, 10, 52.00); -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 7, 1, 20, 52.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 4, 1, 18, 52.00); -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 5, 2, 12, 62.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 6, 2, 8, 62.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 7, 2, 18, 62.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 4, 2, 16, 62.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 5, 3, 10, 72.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 6, 3, 6, 72.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 7, 3, 15, 72.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 4, 3, 14, 72.00); -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 5, 4, 7, 82.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 6, 4, 4, 82.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 7, 4, 12, 82.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (14, 4, 4, 10, 82.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 15
-- -------------------------------------------

-- Asumiendo que los colores 'azul', 'blanco', 'verde', y un cuarto color (añadido aquí como 'gris') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Quiksilver Celeste', 
 'Este polo celeste es perfecto para un look casual de fin de semana. Combina estilo y confort de manera única.', 
 'Estilo Casual de Finde', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-celeste-quiksilver.jpg', 
 'Confeccionado con 95% algodón y 5% spandex, brindando elasticidad y comodidad todo el día.', 
 'Lavado suave a máquina a 30°C. No usar cloro. Secar a baja temperatura. No lavar en seco. Planchar a temperatura baja.', 
 'polo-quiksilver-celeste', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-durazno-volcom.jpg', 15),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 15),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 15),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 15),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 15);

-- Insertar en la tabla stock para el Producto 15 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 5, 1, 20, 47.00); -- azul (ID 5)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 4, 1, 15, 47.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 2, 1, 10, 47.00); -- verde (ID 2)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 7, 1, 12, 47.00); -- gris (ID 7)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 5, 2, 18, 57.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 4, 2, 12, 57.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 2, 2, 8, 57.00);  -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 7, 2, 14, 57.00); -- gris

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 5, 3, 15, 67.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 4, 3, 10, 67.00); -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 2, 3, 5, 67.00);  -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 7, 3, 11, 67.00); -- gris

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 5, 4, 10, 77.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 4, 4, 7, 77.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 2, 4, 3, 77.00);  -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (15, 7, 4, 8, 77.00);  -- gris


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 16
-- -------------------------------------------

-- Asumiendo que los colores 'negro', 'gris', 'blanco', y un cuarto color (añadido aquí como 'azul') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Volcom Gris', 
 'El Polo Volcom Gris ofrece un estilo atemporal con su diseño minimalista. Ideal para combinar con cualquier atuendo.', 
 'Estilo Minimalista', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-volcom.png', 
 'Fabricado con tejido premium de 100% algodón para máxima comodidad y durabilidad.', 
 'Lavar a máquina en frío. No usar cloro. Secar al aire libre. No planchar sobre el estampado. Lavar colores oscuros por separado.', 
 'polo-volcom-gris', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-amarillo-adidas.jpg', 16),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-nike.jpg', 16),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-ripcurl.jpg', 16),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-celeste-quiksilver.jpg', 16),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-durazno-volcom.jpg', 16);

-- Insertar en la tabla stock para el Producto 16 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 6, 1, 20, 48.00); -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 7, 1, 15, 48.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 4, 1, 10, 48.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 5, 1, 12, 48.00); -- azul (ID 5)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 6, 2, 18, 58.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 7, 2, 13, 58.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 4, 2, 8, 58.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 5, 2, 14, 58.00); -- azul

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 6, 3, 15, 68.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 7, 3, 10, 68.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 4, 3, 6, 68.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 5, 3, 11, 68.00); -- azul

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 6, 4, 12, 78.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 7, 4, 7, 78.00);  -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 4, 4, 4, 78.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (16, 5, 4, 9, 78.00);  -- azul


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 17
-- -------------------------------------------

-- Asumiendo que los colores 'gris', 'negro', 'blanco', y un cuarto color (añadido aquí como 'azul') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Nike Gris', 
 'Elegante polo gris Nike, con diseño moderno y material de alta calidad. Ideal para el día a día o para hacer deporte.', 
 'Elegante y Moderno', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 
 'Fabricado con 80% algodón y 20% poliéster, garantiza comodidad y resistencia a largo plazo.', 
 'Lavado en máquina con agua tibia. No usar cloro. Secar colgado en sombra. No planchar sobre estampado.', 
 'polo-nike-gris', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-durazno-volcom.jpg', 17),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-melange-nike.jpg', 17),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 17),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 17),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 17);

-- Insertar en la tabla stock para el Producto 17 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 7, 1, 18, 49.00); -- gris (ID 7)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 6, 1, 14, 49.00); -- negro (ID 6)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 4, 1, 11, 49.00); -- blanco (ID 4)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 5, 1, 13, 49.00); -- azul (ID 5)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 7, 2, 16, 59.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 6, 2, 12, 59.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 4, 2, 9, 59.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 5, 2, 15, 59.00); -- azul

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 7, 3, 14, 69.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 6, 3, 10, 69.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 4, 3, 7, 69.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 5, 3, 12, 69.00); -- azul

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 7, 4, 12, 79.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 6, 4, 8, 79.00);  -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 4, 4, 5, 79.00);  -- blanco
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (17, 5, 4, 10, 79.00);  -- azul


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 18
-- -------------------------------------------

-- Asumiendo que los colores 'rojo', 'marrón' (maroon), 'rosa' (pink), y un cuarto color (añadido aquí como 'negro') ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Adidas Rojo', 
 'Polo rojo vibrante de Adidas, perfecto para un look llamativo. Confortable y versátil para cualquier ocasión.', 
 'Vibrante y Confortable', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 
 'Tejido suave y resistente, 60% algodón y 40% poliéster, ideal para uso frecuente.', 
 'Lavado suave a máquina en frío. No usar lejía. Secar en plano. Planchar a temperatura media si es necesario.', 
 'polo-adidas-rojo', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 18),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 18),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 18),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 18),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 18);

-- Insertar en la tabla stock para el Producto 18 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 8, 1, 10, 48.00); -- rojo (ID 8)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 9, 1, 12, 48.00); -- marrón (ID 9)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 10, 1, 8, 48.00); -- rosa (ID 10)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 6, 1, 14, 48.00); -- negro (ID 6)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 8, 2, 12, 58.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 9, 2, 10, 58.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 10, 2, 10, 58.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 6, 2, 16, 58.00); -- negro

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 8, 3, 15, 68.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 9, 3, 8, 68.00);  -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 10, 3, 12, 68.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 6, 3, 18, 68.00); -- negro

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 8, 4, 18, 78.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 9, 4, 6, 78.00);  -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 10, 4, 14, 78.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (18, 6, 4, 20, 78.00); -- negro


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 19
-- -------------------------------------------

-- Asumiendo que los colores 'verde', 'azul verdoso' (teal), 'crema', y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Quiksilver Verde Pasto', 
 'Este polo Quiksilver en tono verde pasto combina estilo y sostenibilidad. Ideal para un look casual y relajado.', 
 'Estilo Sustentable', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 
 'Confeccionado en 100% algodón orgánico, ofrece una textura suave y amigable con el ambiente.', 
 'Lavar a mano con agua fría. No usar secadora. No blanquear. Planchar a baja temperatura si es necesario.', 
 'polo-quiksilver-verde-pasto', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 19),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 19),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 19),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-guinda-ripcurl.jpg', 19),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 19);

-- Insertar en la tabla stock para el Producto 19 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 1, 1, 20, 46.00); -- verde (ID 1)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 2, 1, 15, 46.00); -- azul verdoso (ID 2)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 3, 1, 10, 46.00); -- crema (ID 3)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 4, 1, 12, 46.00); -- blanco (ID 4)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 1, 2, 18, 56.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 2, 2, 13, 56.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 3, 2, 12, 56.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 4, 2, 14, 56.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 1, 3, 16, 66.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 2, 3, 11, 66.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 3, 3, 14, 66.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 4, 3, 16, 66.00); -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 1, 4, 14, 76.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 2, 4, 9, 76.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 3, 4, 16, 76.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (19, 4, 4, 18, 76.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 20
-- -------------------------------------------

-- Asumiendo que los colores 'rojo', 'marrón' (maroon), 'rosa' (pink), y 'negro' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Quiksilver Jaspeado Rojo', 
 'El polo Quiksilver jaspeado rojo combina estilo y comodidad. Ideal para un look casual y deportivo.', 
 'Estilo Casual Jaspeado', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 
 'Material resistente, 70% algodón, 30% poliéster, perfecto para el uso diario y actividades al aire libre.', 
 'Lavado a máquina en ciclo suave. No usar cloro. Secado en tendedero. Planchado a temperatura baja.', 
 'polo-quiksilver-jaspeado-rojo', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-quiksilver.jpg', 20),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 20),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 20),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-blanco-quiksilver.jpg', 20),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-amarillo-adidas.jpg', 20);

-- Insertar en la tabla stock para el Producto 20 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 8, 1, 22, 49.00); -- rojo (ID 8)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 9, 1, 18, 49.00); -- marrón (ID 9)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 10, 1, 15, 49.00); -- rosa (ID 10)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 6, 1, 20, 49.00); -- negro (ID 6)

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 8, 2, 20, 59.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 9, 2, 16, 59.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 10, 2, 13, 59.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 6, 2, 18, 59.00); -- negro

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 8, 3, 18, 69.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 9, 3, 14, 69.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 10, 3, 11, 69.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 6, 3, 16, 69.00); -- negro

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 8, 4, 16, 79.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 9, 4, 12, 79.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 10, 4, 9, 79.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (20, 6, 4, 14, 79.00); -- negro


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 21
-- -------------------------------------------

-- Asumiendo que los colores 'verde', 'azul verdoso' (teal), 'crema', y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Ripcurl Verde Suave', 
 'Polo Ripcurl de tono verde suave, perfecto para cualquier ocasión. Cómodo, duradero y fácil de combinar.', 
 'Confort y Estilo Diario', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 
 'Confeccionado con 80% algodón orgánico y 20% poliéster reciclado para mayor comodidad y durabilidad.', 
 'Lavar en agua fría. No usar blanqueador. Secar a la sombra. Planchar a temperatura moderada.', 
 'polo-ripcurl-verde-suave', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 21),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 21),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 21),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-guinda-ripcurl.jpg', 21),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 21);

-- Insertar en la tabla stock para el Producto 21 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 1, 1, 24, 50.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 2, 1, 20, 50.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 3, 1, 16, 50.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 4, 1, 22, 50.00); -- blanco

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 1, 2, 22, 60.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 2, 2, 18, 60.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 3, 2, 14, 60.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 4, 2, 20, 60.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 1, 3, 20, 70.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 2, 3, 16, 70.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 3, 3, 12, 70.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 4, 3, 18, 70.00); -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 1, 4, 18, 80.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 2, 4, 14, 80.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 3, 4, 10, 80.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (21, 4, 4, 16, 80.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 22
-- -------------------------------------------

-- Asumiendo que los colores 'rojo', 'marrón' (maroon), 'rosa' (pink), y 'blanco' ya están insertados

-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya están insertadas

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, product_slug, created_at, updated_at) 
VALUES 
('Polo Billabong Rojo Clásico', 
 'Este polo Billabong en rojo clásico combina estilo y comodidad, perfecto para un look casual.', 
 'Estilo Rojo Billabong', 
 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 
 'Tejido de alta calidad, 85% algodón y 15% poliéster, ideal para comodidad y durabilidad.', 
 'Lavar en ciclo suave con agua fría. No usar secadora. Planchar a baja temperatura si es necesario.', 
 'polo-billabong-rojo-clasico', 
 NOW(), 
 NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 22),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 22),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 22),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-morado-adidas.jpg', 22),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-gris-nike.jpg', 22);

-- Insertar en la tabla stock para el Producto 22 con cuatro colores
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 8, 1, 20, 48.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 9, 1, 15, 48.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 10, 1, 10, 48.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 4, 1, 18, 48.00); -- blanco

-- Repetir para tallas M, L, XL ajustando la cantidad y precio
-- Talla M
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 8, 2, 18, 58.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 9, 2, 13, 58.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 10, 2, 8, 58.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 4, 2, 16, 58.00); -- blanco

-- Talla L
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 8, 3, 15, 68.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 9, 3, 11, 68.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 10, 3, 6, 68.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 4, 3, 14, 68.00); -- blanco

-- Talla XL
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 8, 4, 12, 78.00); -- rojo
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 9, 4, 9, 78.00); -- marrón
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 10, 4, 4, 78.00); -- rosa
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, stock_price) VALUES (22, 4, 4, 12, 78.00); -- blanco
