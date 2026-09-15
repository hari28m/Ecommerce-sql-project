-- Count how many customers we have
SELECT COUNT(*) AS customer_total
FROM customers;

-- Average product price 
SELECT AVG(price) AS avg_price
FROM products;

-- Total revenue across all orders
SELECT SUM(quantity * unit_price) AS total_revenue 
FROM order_items;

-- Revenue of each product
SELECT 
    p.product_name,
    SUM(quantity * unit_price) AS revenue 
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

-- Top spenders
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS top_spenders
FROM customers c
JOIN orders o      ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id  = o.order_id
GROUP BY c.customer_id, customer_name
ORDER BY top_spenders DESC
LIMIT 3;

-- Products that generated more than 10,000 in revenue 
SELECT 
    p.product_name,
    SUM(quantity * unit_price) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_name
HAVING revenue > 10000
ORDER BY revenue DESC;

-- Monthly sales trend 
SELECT  
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(quantity * unit_price) AS revenue 
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY month
ORDER BY month;