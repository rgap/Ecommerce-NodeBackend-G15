USE beautipol;

-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 1
-- -------------------------------------------

-- Insertar colores nuevos si aún no están en la base de datos
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('verde', '#008000', NOW(), NOW());  -- Verde
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('azul verdoso', '#008080', NOW(), NOW());  -- Azul verdoso (Teal)
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('crema', '#FFFDD0', NOW(), NOW()); -- Crema
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('blanco', '#FFFFFF', NOW(), NOW()); -- Blanco

-- Insertar en la tabla `size`
INSERT INTO size (size_name, created_at, updated_at) VALUES ('s', NOW(), NOW());
INSERT INTO size (size_name, created_at, updated_at) VALUES ('m', NOW(), NOW());
INSERT INTO size (size_name, created_at, updated_at) VALUES ('l', NOW(), NOW());
INSERT INTO size (size_name, created_at, updated_at) VALUES ('xl', NOW(), NOW());

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
('Polo Nike Verde Claro', 'Este polo Nike en verde claro combina estilo y comodidad. Ideal para actividades al aire libre o un look casual. Material suave y duradero.', 'Confort Casual y Estilo', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-nike-m-nobg.jpg', 'Tejido de alta calidad, 60% algodón, 40% poliéster, suave al tacto.', 'Lavado a máquina con colores similares, secado en línea, planchar a baja temperatura.', NOW(), NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-nike-m.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verde-claro-quiksilver.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-azul-claro-ripcurl.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-guinda-ripcurl.jpg', 1),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-negro-volcom.jpg', 1);

-- Insertar en la tabla stock para el Producto 1 con cuatro colores
-- Asumiendo que los colores y tallas ya tienen IDs asignados en la base de datos.
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_verde, size_id_s, 20, 55.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_azul_verdoso, size_id_s, 15, 55.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_crema, size_id_s, 10, 55.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_blanco, size_id_s, 12, 55.00); -- blanco

-- Talla M (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_verde, size_id_m, 25, 65.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_azul_verdoso, size_id_m, 20, 65.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_crema, size_id_m, 12, 65.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_blanco, size_id_m, 14, 65.00); -- blanco

-- Talla L (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_verde, size_id_l, 30, 75.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_azul_verdoso, size_id_l, 18, 75.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_crema, size_id_l, 8, 75.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_blanco, size_id_l, 16, 75.00); -- blanco

-- Talla XL (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_verde, size_id_xl, 15, 85.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_azul_verdoso, size_id_xl, 10, 85.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_crema, size_id_xl, 5, 85.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, color_id_blanco, size_id_xl, 7, 85.00); -- blanco


-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 2
-- -------------------------------------------

-- Insertar colores nuevos si aún no están en la base de datos
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('azul', '#0000FF', NOW(), NOW());  -- Azul
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('negro', '#000000', NOW(), NOW());  -- Negro
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES ('gris', '#808080', NOW(), NOW()); -- Gris
-- Nota: 'Blanco' ya fue insertado con Producto 1

-- Insertar en la tabla `size` si aún no están insertados
-- Asumiendo que las tallas 's', 'm', 'l', 'xl' ya fueron insertadas con Producto 1

-- Insertar en la tabla `product`
INSERT INTO product 
(product_title, product_description, product_short_description, product_main_image, product_material, product_care, created_at, updated_at) 
VALUES 
('Polo Quiksilver Turquesa', 'El polo Quiksilver en color turquesa ofrece un look fresco y relajado, perfecto para días soleados. Material resistente y fácil de cuidar.', 'Frescura y Estilo Veraniego', 'https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-turqueza-quiksilver.jpg', 'Tejido transpirable, 70% algodón y 30% poliéster, ideal para el calor.', 'Lavar a mano o máquina con agua fría. No usar cloro. Secar colgado a la sombra.', '2023-10-31 14:15:00', NOW());

-- Insertar imágenes adicionales en la tabla `image`
INSERT INTO image (image_url, image_product_id) VALUES 
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-adidas.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdepasto-quiksilver.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojojaspeado-quiksilver.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-verdesuave-ripcurl.jpg', 2),
('https://raw.githubusercontent.com/rgap/Ecommerce-G15-ImageRepository/main/images/polo-rojo-billabong2.jpg', 2);

-- Insertar en la tabla stock para el Producto 2 con cuatro colores
-- Asumiendo que los colores y tallas ya tienen IDs asignados en la base de datos.
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_azul, size_id_s, 10, 55.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_negro, size_id_s, 12, 55.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_gris, size_id_s, 8, 55.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_blanco, size_id_s, 5, 55.00); -- blanco

-- Talla M (repetir para azul, negro, gris, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_azul, size_id_m, 15, 65.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_negro, size_id_m, 9, 65.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_gris, size_id_m, 10, 65.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_blanco, size_id_m, 7, 65.00); -- blanco

-- Talla L (repetir para azul, negro, gris, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_azul, size_id_l, 12, 75.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_negro, size_id_l, 7, 75.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_gris, size_id_l, 6, 75.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_blanco, size_id_l, 4, 75.00); -- blanco

-- Talla XL (repetir para azul, negro, gris, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_azul, size_id_xl, 8, 85.00); -- azul
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_negro, size_id_xl, 5, 85.00); -- negro
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_gris, size_id_xl, 4, 85.00); -- gris
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (2, color_id_blanco, size_id_xl, 3, 85.00); -- blanco
