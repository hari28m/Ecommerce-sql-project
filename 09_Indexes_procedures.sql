-- =========================================================
-- Indexes on frequently queried columns
-- =========================================================
CREATE INDEX idx_customer_email ON customers(email);
CREATE INDEX idx_order_date     ON orders(order_date);


-- =========================================================
-- Stored Procedure: Get all orders for a given customer
-- =========================================================
DROP PROCEDURE IF EXISTS GetCustomerOrders;

DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT 
        o.order_id,
        o.order_date,
        o.status,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.customer_id = cust_id
    GROUP BY o.order_id, o.order_date, o.status;
END //
DELIMITER ;


-- =========================================================
-- Test the procedure
-- =========================================================
CALL GetCustomerOrders(1);
CALL GetCustomerOrders(2);