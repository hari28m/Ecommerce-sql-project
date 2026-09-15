-- Get all customers 
SELECT * FROM customers;
-- Get only names and cities 
SELECT first_name,last_name,city FROM customers;
-- Filter by countries
SELECT first_name,last_name FROM customers
WHERE country='India';
-- Produts cheaper than 2000
SELECT product_name,price FROM products
WHERE price <2000;
-- Sort products by price,most expensive first
SELECT product_name,price FROM products
ORDER BY price DESC;
-- top 3 most expensive products
SELECT product_name,price FROM products
ORDER BY price DESC
LIMIT 3;
-- Combine condition YEs/No
SELECT product_name,price,stock_quantity FROM products
WHERE price >1000 AND stock_quantity >50;
-- Patern matching
SELECT first_name,email FROM customers
WHERE email LIKE '%@email.com'
ORDER BY first_name DESC ;