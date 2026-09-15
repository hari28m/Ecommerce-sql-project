-- =========================================================
-- View: full order details — reusable for dashboards
-- =========================================================
DROP VIEW IF EXISTS vw_order_details;

CREATE VIEW vw_order_details AS
SELECT
    o.order_id,
    o.order_date,
    o.status,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.country,
    p.product_name,
    cat.category_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS line_total
FROM orders o
JOIN customers c    ON o.customer_id  = c.customer_id
JOIN order_items oi ON oi.order_id    = o.order_id
JOIN products p     ON oi.product_id  = p.product_id
JOIN categories cat ON p.category_id  = cat.category_id;


-- =========================================================
-- Use the view
-- =========================================================
SELECT * FROM vw_order_details WHERE country = 'India';