
-- ==========================================
-- PROJECT: SALES DATA ANALYSIS
-- DATABASE: sales_analysis
-- MYSQL VERSION: 8.0
-- ==========================================


-- STEP 1: CREATE DATABASE

CREATE DATABASE IF NOT EXISTS sales_analysis;


-- STEP 2: SELECT DATABASE

USE sales_analysis;


-- STEP 3: CREATE CUSTOMERS TABLE

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);


-- STEP 4: CREATE PRODUCTS TABLE

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


-- STEP 5: CREATE ORDERS TABLE

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


-- STEP 6: CREATE ORDER DETAILS TABLE

CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);


-- STEP 7: VERIFY DATABASE

SELECT DATABASE();


-- STEP 8: DISPLAY ALL TABLES

SHOW TABLES;


-- STEP 9: CHECK TABLE STRUCTURES

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_details;


-- ==========================================
-- END OF DATABASE CREATION
-- ==========================================

USE sales_analysis;

INSERT INTO customers
(customer_id, customer_name, city, state, signup_date)
VALUES
(1, 'Arun Kumar', 'Chennai', 'Tamil Nadu', '2025-01-10'),
(2, 'Priya Sharma', 'Bengaluru', 'Karnataka', '2025-01-15'),
(3, 'Rahul Verma', 'Mumbai', 'Maharashtra', '2025-02-01'),
(4, 'Sneha Reddy', 'Hyderabad', 'Telangana', '2025-02-12'),
(5, 'Karthik Raj', 'Coimbatore', 'Tamil Nadu', '2025-02-20'),
(6, 'Anjali Nair', 'Kochi', 'Kerala', '2025-03-05'),
(7, 'Vijay Kumar', 'Madurai', 'Tamil Nadu', '2025-03-15'),
(8, 'Meera Patel', 'Ahmedabad', 'Gujarat', '2025-03-22'),
(9, 'Suresh Babu', 'Pune', 'Maharashtra', '2025-04-01'),
(10, 'Divya Menon', 'Chennai', 'Tamil Nadu', '2025-04-10'),
(11, 'Ajay Singh', 'Delhi', 'Delhi', '2025-04-18'),
(12, 'Lakshmi Devi', 'Mysuru', 'Karnataka', '2025-05-02'),
(13, 'Naveen Kumar', 'Trichy', 'Tamil Nadu', '2025-05-12'),
(14, 'Pooja Shah', 'Surat', 'Gujarat', '2025-05-20'),
(15, 'Manoj Das', 'Kolkata', 'West Bengal', '2025-06-01'),
(16, 'Swathi Rao', 'Bengaluru', 'Karnataka', '2025-06-10'),
(17, 'Ramesh Kumar', 'Salem', 'Tamil Nadu', '2025-06-18'),
(18, 'Neha Gupta', 'Jaipur', 'Rajasthan', '2025-07-01'),
(19, 'Prakash S', 'Chennai', 'Tamil Nadu', '2025-07-12'),
(20, 'Aishwarya N', 'Coimbatore', 'Tamil Nadu', '2025-07-20');

SELECT * FROM customers;

DESCRIBE products;
-- STEP 3: INSERT PRODUCT DATA

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(1, 'Laptop', 'Electronics', 55000.00),
(2, 'Smartphone', 'Electronics', 25000.00),
(3, 'Headphones', 'Accessories', 2500.00),
(4, 'Keyboard', 'Accessories', 1500.00),
(5, 'Mouse', 'Accessories', 800.00),
(6, 'Monitor', 'Electronics', 12000.00),
(7, 'Office Chair', 'Furniture', 7500.00),
(8, 'Desk', 'Furniture', 9500.00),
(9, 'Printer', 'Electronics', 8500.00),
(10, 'Tablet', 'Electronics', 18000.00),
(11, 'Smart Watch', 'Electronics', 6000.00),
(12, 'USB Drive', 'Accessories', 700.00),
(13, 'External Hard Drive', 'Storage', 4500.00),
(14, 'Webcam', 'Accessories', 3200.00),
(15, 'Speakers', 'Electronics', 4000.00),
(16, 'Power Bank', 'Accessories', 1800.00),
(17, 'Router', 'Networking', 2800.00),
(18, 'Microphone', 'Accessories', 3500.00),
(19, 'Projector', 'Electronics', 22000.00),
(20, 'Laptop Stand', 'Accessories', 1200.00);

-- VERIFY PRODUCTS

SELECT * FROM products;
SELECT COUNT(*) AS total_products
FROM products;
DESCRIBE orders;
-- STEP 5: INSERT ORDERS DATA

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1, 1, '2025-01-15', 'Delivered'),
(2, 2, '2025-01-18', 'Delivered'),
(3, 3, '2025-01-22', 'Delivered'),
(4, 4, '2025-02-05', 'Shipped'),
(5, 5, '2025-02-10', 'Delivered'),
(6, 6, '2025-02-15', 'Cancelled'),
(7, 7, '2025-02-20', 'Delivered'),
(8, 8, '2025-03-02', 'Delivered'),
(9, 9, '2025-03-10', 'Shipped'),
(10, 10, '2025-03-15', 'Delivered'),
(11, 11, '2025-03-20', 'Delivered'),
(12, 12, '2025-04-05', 'Pending'),
(13, 13, '2025-04-12', 'Delivered'),
(14, 14, '2025-04-18', 'Delivered'),
(15, 15, '2025-04-25', 'Shipped'),
(16, 16, '2025-05-02', 'Delivered'),
(17, 17, '2025-05-10', 'Cancelled'),
(18, 18, '2025-05-15', 'Delivered'),
(19, 19, '2025-05-20', 'Delivered'),
(20, 20, '2025-06-01', 'Pending'),
(21, 1, '2025-06-10', 'Delivered'),
(22, 3, '2025-06-15', 'Delivered'),
(23, 5, '2025-06-20', 'Shipped'),
(24, 7, '2025-07-05', 'Delivered'),
(25, 9, '2025-07-12', 'Delivered'),
(26, 11, '2025-07-18', 'Pending'),
(27, 13, '2025-07-22', 'Delivered'),
(28, 15, '2025-08-02', 'Delivered'),
(29, 17, '2025-08-10', 'Shipped'),
(30, 19, '2025-08-15', 'Delivered');

-- VERIFY ORDERS

SELECT * FROM orders;

SELECT COUNT(*) AS total_orders
FROM orders;
DESCRIBE order_details;
-- STEP 6: INSERT ORDER DETAILS DATA

USE sales_analysis;

INSERT INTO order_details
(order_detail_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 2, 55000.00),
(2, 1, 2, 1, 25000.00),
(3, 2, 3, 2, 45000.00),
(4, 2, 4, 1, 35000.00),
(5, 3, 5, 1, 65000.00),
(6, 3, 6, 2, 15000.00),
(7, 4, 7, 1, 12000.00),
(8, 4, 8, 2, 8000.00),
(9, 5, 9, 1, 18000.00),
(10, 5, 10, 2, 12000.00);

-- VERIFY DATA
SELECT * FROM order_details;

-- COUNT TOTAL RECORDS
SELECT COUNT(*) AS total_order_details
FROM order_details;
-- STEP 7: VERIFY ALL TABLES

USE sales_analysis;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_details
FROM order_details;
USE sales_analysis;

-- 1. Display all customers
SELECT * FROM customers;

-- 2. Display all products
SELECT * FROM products;

-- 3. Display all orders
SELECT * FROM orders;

-- 4. Display all order details
SELECT * FROM order_details;

-- 5. Find total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 6. Find total products
SELECT COUNT(*) AS total_products
FROM products;

-- 7. Find total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 8. Find total order details
SELECT COUNT(*) AS total_order_details
FROM order_details;

USE sales_analysis;

-- 1. Find customers from Chennai
SELECT *
FROM customers
WHERE city = 'Chennai';

-- 2. Find products costing more than 10000
SELECT *
FROM products
WHERE price > 10000;

-- 3. Find delivered orders
SELECT *
FROM orders
WHERE order_status = 'Delivered';

-- 4. Find customers from Tamil Nadu
SELECT *
FROM customers
WHERE state = 'Tamil Nadu';

-- 5. Find products between 10000 and 30000
SELECT *
FROM products
WHERE price BETWEEN 10000 AND 30000;

-- 6. Find orders placed after February 2025
SELECT *
FROM orders
WHERE order_date > '2025-02-01';

USE sales_analysis;

-- 1. Sort products by price (Low to High)
SELECT *
FROM products
ORDER BY price ASC;

-- 2. Sort products by price (High to Low)
SELECT *
FROM products
ORDER BY price DESC;

-- 3. Display top 5 expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- 4. Display top 5 cheapest products
SELECT *
FROM products
ORDER BY price ASC
LIMIT 5;

-- 5. Display latest 10 orders
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 10;

-- 6. Display first 5 customers
SELECT *
FROM customers
ORDER BY customer_id ASC
LIMIT 5;

USE sales_analysis;

-- STEP 11: AGGREGATE FUNCTIONS

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Total number of products
SELECT COUNT(*) AS total_products
FROM products;

-- 3. Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 4. Total order details
SELECT COUNT(*) AS total_order_details
FROM order_details;

-- 5. Total value of all products
SELECT SUM(price) AS total_product_value
FROM products;

-- 6. Average product price
SELECT AVG(price) AS average_product_price
FROM products;

-- 7. Highest product price
SELECT MAX(price) AS highest_product_price
FROM products;

-- 8. Lowest product price
SELECT MIN(price) AS lowest_product_price
FROM products;
SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;
SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;
SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;
SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;
SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 5000;
-- STEP 13: SQL JOINS

-- 1. INNER JOIN
SELECT
    customers.customer_id,
    customers.customer_name,
    customers.city,
    orders.order_id,
    orders.order_date,
    orders.order_status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT
    customers.customer_id,
    customers.customer_name,
    orders.order_id,
    orders.order_status
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT
    customers.customer_name,
    orders.order_id,
    orders.order_date,
    orders.order_status
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT
    customers.customer_name,
    orders.order_id,
    orders.order_date,
    order_details.product_id,
    order_details.quantity,
    order_details.unit_price
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id;
SELECT
    customers.customer_name,
    customers.city,
    orders.order_id,
    products.product_name,
    order_details.quantity,
    order_details.unit_price,
    (order_details.quantity * order_details.unit_price) AS total_amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.product_id;
-- STEP 14: SALES ANALYSIS

SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM order_details;
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(od.quantity * od.unit_price) AS monthly_revenue
FROM orders o
INNER JOIN order_details od
ON o.order_id = od.order_id
GROUP BY sales_month
ORDER BY sales_month;
SELECT
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_details od
ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
SELECT
    c.customer_name,
    SUM(od.quantity * od.unit_price) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_details od
ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;
SELECT
    p.category,
    SUM(od.quantity * od.unit_price) AS category_revenue
FROM products p
INNER JOIN order_details od
ON p.product_id = od.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
-- STEP 15: CASE WHEN

SELECT
    product_name,
    price,
    CASE
        WHEN price >= 20000 THEN 'Expensive'
        WHEN price >= 5000 THEN 'Medium'
        ELSE 'Affordable'
    END AS price_category
FROM products;
SELECT
    order_id,
    order_status,
    CASE
        WHEN order_status = 'Delivered' THEN 'Completed'
        WHEN order_status = 'Shipped' THEN 'In Progress'
        WHEN order_status = 'Pending' THEN 'Waiting'
        WHEN order_status = 'Cancelled' THEN 'Not Completed'
        ELSE 'Unknown'
    END AS order_category
FROM orders;
SELECT
    p.category,
    SUM(od.quantity * od.unit_price) AS revenue,
    CASE
        WHEN SUM(od.quantity * od.unit_price) >= 200000
            THEN 'High Revenue'
        WHEN SUM(od.quantity * od.unit_price) >= 100000
            THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category
FROM products p
INNER JOIN order_details od
ON p.product_id = od.product_id
GROUP BY p.category;
SELECT
    COUNT(*) AS total_orders,

    SUM(CASE
        WHEN order_status = 'Delivered' THEN 1
        ELSE 0
    END) AS delivered_orders,

    SUM(CASE
        WHEN order_status = 'Cancelled' THEN 1
        ELSE 0
    END) AS cancelled_orders

FROM orders;
-- STEP 16: SUBQUERIES

SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
SELECT
    product_name,
    price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);
SELECT
    customer_id,
    customer_name,
    city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
SELECT
    customer_id,
    customer_name,
    city
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE customer_id IS NOT NULL
    
);
SELECT
    customer_name,
    total_spending
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(od.quantity * od.unit_price) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY c.customer_id, c.customer_name
) AS customer_sales
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM (
        SELECT
            o.customer_id,
            SUM(od.quantity * od.unit_price) AS total_spending
        FROM orders o
        INNER JOIN order_details od
            ON o.order_id = od.order_id
        GROUP BY o.customer_id
    ) AS average_sales
);
-- STEP 17: CTE

WITH customer_spending AS (
    SELECT
        c.customer_name,
        SUM(od.quantity * od.unit_price) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY c.customer_id, c.customer_name
)

SELECT *
FROM customer_spending
ORDER BY total_spending DESC;
WITH customer_spending AS (
    SELECT
        c.customer_name,
        SUM(od.quantity * od.unit_price) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY c.customer_id, c.customer_name
)

SELECT *
FROM customer_spending
WHERE total_spending > 100000;
WITH category_revenue AS (
    SELECT
        p.category,
        SUM(od.quantity * od.unit_price) AS revenue
    FROM products p
    INNER JOIN order_details od
        ON p.product_id = od.product_id
    GROUP BY p.category
)

SELECT *
FROM category_revenue
ORDER BY revenue DESC;
SELECT
    product_name,
    category,
    price,
    RANK() OVER (
        ORDER BY price DESC
    ) AS product_rank
FROM products;
SELECT
    c.customer_name,
    SUM(od.quantity * od.unit_price) AS total_spending,
    RANK() OVER (
        ORDER BY SUM(od.quantity * od.unit_price) DESC
    ) AS spending_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name;
SELECT *
FROM (
    SELECT
        product_name,
        category,
        price,
        DENSE_RANK() OVER (
            ORDER BY price DESC
        ) AS product_rank
    FROM products
) ranked_products
WHERE product_rank <= 3;
SELECT
    order_date,
    MONTH(order_date) AS order_month,
    YEAR(order_date) AS order_year
FROM orders;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY sales_month
ORDER BY sales_month;
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(od.quantity * od.unit_price) AS monthly_revenue
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY sales_month
ORDER BY sales_month;
SELECT *
FROM orders
WHERE order_date >= DATE_SUB(
    CURDATE(), INTERVAL 30 DAY
);
SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM order_details;
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity) AS total_quantity,
    SUM(od.quantity * od.unit_price) AS revenue
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY sales_month
ORDER BY sales_month;
SELECT
    c.customer_name,
    c.city,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_revenue DESC
LIMIT 5;
SELECT
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS percentage
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
-- QUERY 87: Assign row numbers to orders

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,

    ROW_NUMBER() OVER (
        ORDER BY order_date ASC
    ) AS order_sequence

FROM orders;
-- QUERY 88: Number orders customer-wise

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,

    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date ASC
    ) AS customer_order_number

FROM orders;
-- QUERY 89: Find latest order per customer

WITH customer_orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        order_status,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS order_rank

    FROM orders
)

SELECT *
FROM customer_orders
WHERE order_rank = 1;
-- QUERY 90: Find second order per customer

WITH customer_orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        order_status,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date ASC
        ) AS order_rank

    FROM orders
)

SELECT *
FROM customer_orders
WHERE order_rank = 2;
-- QUERY 91: Customers with more than 2 orders

WITH customer_orders AS (
    SELECT
        customer_id,
        order_id,

        COUNT(*) OVER (
            PARTITION BY customer_id
        ) AS total_customer_orders

    FROM orders
)

-- QUERY 92: Customers with exactly 2 orders

SELECT
    customer_id,
    COUNT(order_id) AS total_orders

FROM orders

GROUP BY customer_id

HAVING COUNT(order_id) = 2

ORDER BY customer_id ASC;
-- QUERY 92: Customers with exactly 2 orders

SELECT
    customer_id,
    COUNT(order_id) AS total_orders

FROM orders

GROUP BY customer_id

HAVING COUNT(order_id) = 1

ORDER BY customer_id ASC;
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 
2;
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
SELECT
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity * od.unit_price) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY total_spending DESC
LIMIT 5;
SELECT
    o.order_id,
    o.order_date,
    o.order_status
FROM sales_analysis.orders o
LEFT JOIN sales_analysis.order_details od
    ON o.order_id = od.order_id
WHERE od.order_id IS NULL
ORDER BY o.order_date;
USE sales_analysis;

SELECT
    'customers' AS table_name,
    COUNT(*) AS total_records
FROM customers

UNION ALL

SELECT
    'orders',
    COUNT(*)
FROM orders

UNION ALL

SELECT
    'order_details',
    COUNT(*)
FROM order_details

UNION ALL

SELECT
    'products',
    COUNT(*)
FROM products;
SELECT
    o.order_id,
    o.order_date,
    o.order_status
FROM orders o
LEFT JOIN order_details od
    ON o.order_id = od.order_id
WHERE od.order_id IS NULL

ORDER BY o.order_id;