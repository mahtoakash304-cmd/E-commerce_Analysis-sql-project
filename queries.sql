/* ================================
   BASIC QUERIES (SELECT/WHERE)
   ================================ */

-- 1) Delhi customers
SELECT * 
FROM Customers
WHERE city = 'Delhi';

-- 2) Electronics products
SELECT * 
FROM Products
WHERE category = 'Electronics';

-- 3) Latest orders first
SELECT * 
FROM Orders
ORDER BY order_date DESC;

-- 4) Top 5 highest orders
SELECT * 
FROM Orders
ORDER BY total_amount DESC
LIMIT 5;

-- 5) Unique cities
SELECT DISTINCT city 
FROM Customers;


/* ================================
   LIKE / IN / BETWEEN
   ================================ */

-- 6) Names starting with A
SELECT * 
FROM Customers
WHERE name LIKE 'A%';

-- 7) Product name contains "TV"
SELECT * 
FROM Products
WHERE product_name LIKE '%TV%';

-- 8) Orders between dates
SELECT * 
FROM Orders
WHERE order_date BETWEEN '2025-06-10' AND '2025-06-20';

-- 9) Payment Paid or Pending
SELECT * 
FROM Payments
WHERE status IN ('Paid','Pending');


/* ================================
   AGGREGATE FUNCTIONS
   ================================ */

-- 10) Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM Orders;

-- 11) Total orders count
SELECT COUNT(*) AS total_orders
FROM Orders;

-- 12) Average order amount
SELECT AVG(total_amount) AS avg_order_amount
FROM Orders;

-- 13) Highest order amount
SELECT MAX(total_amount) AS max_order
FROM Orders;

-- 14) Lowest order amount
SELECT MIN(total_amount) AS min_order
FROM Orders;


/* ================================
   GROUP BY + HAVING
   ================================ */

-- 15) City wise customer count
SELECT city, COUNT(*) AS customer_count
FROM Customers
GROUP BY city;

-- 16) Category wise product count
SELECT category, COUNT(*) AS total_products
FROM Products
GROUP BY category;

-- 17) Customer wise total spending
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- 18) Category wise total revenue
SELECT p.category, SUM(oi.quantity * oi.price) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- 19) Customers spent > 50000
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) > 50000;

-- 20) Categories with total quantity > 2
SELECT p.category, SUM(oi.quantity) AS total_quantity
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category
HAVING SUM(oi.quantity) > 2;


/* ================================
   JOINS QUERIES
   ================================ */

-- 21) Customer + Orders details
SELECT c.name, o.order_id, o.order_date, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- 22) Order + product + quantity
SELECT o.order_id, p.product_name, oi.quantity, oi.price
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 23) Customer total orders count
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- 24) Customer total spending
SELECT c.name, COALESCE(SUM(o.total_amount),0) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- 25) Failed payment orders
SELECT o.order_id, c.name, o.total_amount, p.status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Payments p ON o.order_id = p.order_id
WHERE p.status = 'Failed';

-- 26) Customers with no orders
SELECT c.customer_id, c.name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 27) Products never sold
SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- 28) Category wise revenue report
SELECT p.category, SUM(oi.quantity * oi.price) AS revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category;


/* ================================
   FINAL REPORTS (DELIVERABLES)
   ================================ */

-- 29) Customer Dashboard Report
SELECT 
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount),0) AS total_spent,
    COALESCE(MAX(o.total_amount),0) AS highest_order
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city;

-- 30) Product Sales Report
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;

-- 31) Payment Summary Report
SELECT 
    pay.status,
    COUNT(pay.payment_id) AS total_payments,
    SUM(o.total_amount) AS total_amount
FROM Payments pay
JOIN Orders o ON pay.order_id = o.order_id
GROUP BY pay.status;

-- 32) Top 10 Customers by Spending
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 10;


/* ================================
   BONUS REPORTS
   ================================ */

-- 33) Month wise total sales
SELECT 
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_sales
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- 34) City wise highest spending customer
SELECT 
    c.city,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city, c.name
ORDER BY total_spent DESC;

-- 35) Category wise best selling product
SELECT 
    p.category,
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category, p.product_name
ORDER BY total_sold DESC;