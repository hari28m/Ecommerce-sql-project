INSERT INTO categories(category_name) VALUES
('Electronics'),('Clothing'),('Books'),('Home & Kitchen');
INSERT INTO customers(first_name,last_name,email,country,city,signup_date) VALUES
('Aarav',  'Sharma',  'aarav@email.com',  'India','Mumbai', '2023-01-15'),
('Priya',  'Patel',   'priya@email.com',  'India','Delhi', '2023-02-20'),
('John',   'Smith',   'john@email.com',   'USA', 'New York',   '2023-03-05'),
('Emma',   'Johnson', 'emma@email.com',   'UK', 'London',    '2023-03-22'),
('Rahul',  'Verma',   'rahul@email.com',  'India', 'Bangalore', '2023-04-10');
INSERT INTO products(product_name,category_id,price,stock_quantity) VALUES
('Laptop',        1, 75000.00, 20),
('Smartphone',    1, 30000.00, 50),
('T-Shirt',       2,   799.00, 200),
('Jeans',         2,  1999.00, 100),
('SQL Guide Book',3,   499.00, 300),
('Coffee Maker',  4,  3500.00, 40);
INSERT INTO orders(customer_id,order_date,status) VALUES
(1, '2024-01-05 10:30:00', 'delivered'),
(2, '2024-01-12 14:15:00', 'delivered'),
(1, '2024-02-01 09:00:00', 'delivered'),
(3, '2024-02-14 16:45:00', 'shipped'),
(4, '2024-03-02 11:20:00', 'pending'),
(5, '2024-03-15 18:00:00', 'delivered'),
(2, '2024-04-01 13:10:00', 'delivered');
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 75000.00),
(1, 5, 2,   499.00),
(2, 3, 3,   799.00),
(3, 2, 1, 30000.00),
(4, 6, 1,  3500.00),
(5, 4, 2,  1999.00),
(6, 1, 1, 75000.00),
(6, 5, 1,   499.00),
(7, 3, 2,   799.00),
(7, 6, 1,  3500.00);