CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
country VARCHAR(50),
city VARCHAR(50),
signup_date DATE NOT NULL
);
CREATE TABLE categories(
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(50)
);
CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100) NOT NULL,
category_id INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
stock_quantity INT DEFAULT 0,
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATETIME NOT NULL,
status VARCHAR(20) DEFAULT 'Pending',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);
CREATE TABLE order_items(
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(prduct_id)
);