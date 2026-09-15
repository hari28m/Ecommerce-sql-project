-- =========================================================
-- Rank products by revenue
-- =========================================================
SELECT
    p.product_name,
    SUM(quantity * unit_price) AS revenue, 
    RANK() OVER (ORDER BY SUM(quantity * unit_price) DESC) AS rank_revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;


-- =========================================================
-- Each customer's orders with running total
-- =========================================================
SELECT 
    o.customer_id,
    o.order_date,
    oi.quantity * oi.unit_price AS line_total,
    SUM(oi.quantity * oi.unit_price) OVER (
        PARTITION BY o.customer_id 
        ORDER BY o.order_date
    ) AS running_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
ORDER BY o.customer_id, o.order_date;


-- =========================================================
-- Top product per category (ROW_NUMBER + PARTITION BY)
-- =========================================================
WITH product_revenue AS (
    SELECT
        c.category_name,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY c.category_id
            ORDER BY SUM(oi.quantity * oi.unit_price) DESC
        ) AS rn
    FROM order_items oi
    JOIN products p   ON oi.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
    GROUP BY c.category_id, c.category_name, p.product_id, p.product_name
)
SELECT category_name, product_name, revenue
FROM product_revenue
WHERE rn = 1
ORDER BY revenue DESC;