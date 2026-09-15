-- =========================================================
-- Subquery Version: Customers who spent MORE than the
-- average customer's total spending
-- =========================================================

SELECT customer_id, total_spent
FROM (
    SELECT 
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o 
    JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY o.customer_id
) AS customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent) 
    FROM (
        SELECT SUM(oi.quantity * oi.unit_price) AS total_spent
        FROM orders o 
        JOIN order_items oi ON oi.order_id = o.order_id
        GROUP BY o.customer_id
    ) AS avg_calc
);


-- =========================================================
-- CTE Version: Same logic, but MUCH more readable
-- (Interviewers LOVE this style)
-- =========================================================

WITH customer_totals AS (
    SELECT 
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o 
    JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY o.customer_id
),
average_spending AS (
    SELECT AVG(total_spent) AS avg_total 
    FROM customer_totals
)
SELECT 
    ct.customer_id,
    ct.total_spent,
    a.avg_total
FROM customer_totals ct
CROSS JOIN average_spending a
WHERE ct.total_spent > a.avg_total
ORDER BY ct.total_spent DESC;