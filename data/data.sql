-- ------------------------------------------- 
-- ------------------------------------------- PRODUCT 1
-- -------------------------------------------

-- Insertar colores nuevos en la base de datos
INSERT INTO color (color_name, hex_color, created_at, updated_at) VALUES 
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
-- Talla S
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 1, 20, 55.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 1, 15, 55.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 1, 10, 55.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 4, 1, 12, 55.00); -- blanco

-- Talla M (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 2, 25, 65.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 2, 20, 65.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 2, 12, 65.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 4, 2, 14, 65.00); -- blanco

-- Talla L (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 3, 30, 75.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 3, 18, 75.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 3, 8, 75.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 4, 3, 16, 75.00); -- blanco

-- Talla XL (repetir para verde, azul verdoso, crema, blanco)
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 1, 4, 15, 85.00); -- verde
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 2, 4, 10, 85.00); -- azul verdoso
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 3, 4, 5, 85.00); -- crema
INSERT INTO stock (stock_product_id, stock_color_id, stock_size_id, stock_quantity, price) VALUES (1, 4, 4, 7, 85.00); -- blanco
