CREATE DATABASE IF NOT EXISTS product_management;
USE product_management;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  price DOUBLE NOT NULL DEFAULT 0,
  description TEXT,
  manufacturer VARCHAR(100),
  category_id INT,
  CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Demo data
INSERT INTO categories(name) VALUES ('Laptop'), ('Phone'), ('Audio');
INSERT INTO products(name,price,description,manufacturer,category_id) VALUES
('Laptop A',1500,'Laptop cấu hình tốt','Dell',1),
('Điện thoại B',700,'Màn hình lớn','Samsung',2),
('Tai nghe C',50,'Bluetooth','Sony',3);
