-- Delete data from tables
DELETE FROM "user";
DELETE FROM color;
DELETE FROM size;
DELETE FROM product;
DELETE FROM image;
DELETE FROM stock;

-- Reset sequences
ALTER SEQUENCE user_user_id_seq RESTART WITH 1;
ALTER SEQUENCE color_color_id_seq RESTART WITH 1;
ALTER SEQUENCE size_size_id_seq RESTART WITH 1;
ALTER SEQUENCE product_product_id_seq RESTART WITH 1;
ALTER SEQUENCE image_image_id_seq RESTART WITH 1;
