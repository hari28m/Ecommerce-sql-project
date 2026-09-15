USE ecommerce_db;

-- Show each product with its category name 
SELECT p.product_id, p.product_name, c.category_name
FROM products p
JOIN categories c 
ON p.category_id = c.category_id;

-- Show all customers even if they have no orders
SELECT c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o 
ON o.customer_id = c.customer_id;

-- Find customers who never ordered
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL; 

-- Full order details
SELECT 
    o.order_id,
    o.order_date,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS total
FROM orders o
JOIN customers c    ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id   = o.order_id
JOIN products p     ON p.product_id  = oi.product_id
ORDER BY o.order_id;