use sakila;

-- Create table statement
CREATE TABLE salesman (
    Salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(10, 2)
);

-- Inserting sample values
INSERT INTO salesman (Salesman_id, name, city, commission) VALUES
(1, 'John Doe', 'New York', 0.15),
(2, 'Jane Smith', 'Los Angeles', 0.12),
(3, 'Michael Johnson', 'Chicago', 0.18),
(4, 'Emily Davis', 'San Francisco', 0.10),
(5, 'David Brown', 'Boston', 0.17),
(6, 'Sarah White', 'Houston', 0.14);

select * from salesman;

select * from customer;
-- From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT s.name AS Salesman, first_name AS cust_name, s.city
FROM salesman s
JOIN customer c ON Salesman_id=customer_id
ORDER BY s.name, first_name;

-- From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT first_name AS Customer_Name,
 s.name AS Salesman, s.commission
FROM customer c
JOIN salesman s ON customer_id = s.Salesman_id
ORDER BY s.name, first_name;

-- Create table statement for orders
CREATE TABLE orders (
    order_no INT PRIMARY KEY,
    purchase_amt DECIMAL(10, 2),
    order_date DATE,
    customer_id INT,
    sales_id INT
);

-- Inserting sample values into orders table (optional)
INSERT INTO orders (order_no, purchase_amt, order_date, customer_id, sales_id) VALUES
(1, 1500.00, '2023-01-15', 1, 1),
(2, 2200.00, '2023-02-20', 2, 2),
(3, 1800.00, '2023-03-10', 3, 3),
(4, 1200.00, '2023-04-05', 1, 4),
(5, 2500.00, '2023-05-12', 2, 1),
(6, 2000.00, '2023-06-18', 3, 2);

select * from orders;

-- From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
SELECT o.order_no AS ord_no,
       o.order_date AS ord_date,
       o.purchase_amt AS purch_amt,
       first_name AS "Customer Name",
       s.name AS Salesman,
       s.commission
FROM orders o
JOIN customer c ON o.customer_id = c.Customer_id
JOIN salesman s ON o.sales_id = s.Salesman_id;

-- Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.
SELECT s.Salesman_id,
       s.name AS Salesman,
       s.city AS Salesman_City,
       s.commission AS Salesman_Commission,
       c.Customer_id,
       first_name AS Customer_Name,
       o.order_no AS Order_No,
       o.order_date AS Order_Date,
       o.purchase_amt AS Purchase_Amount
FROM salesman s
JOIN customer c ON s.Salesman_id = customer_id
JOIN orders o ON c.Customer_id = o.customer_id;

-- From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.
SELECT first_name AS cust_name,
       address_id,
       s.name AS Salesman,
       s.city AS salesmancity
FROM customer c
JOIN salesman s ON customer_id = s.Salesman_id
WHERE address_id < 300
ORDER BY customer_id ASC;

-- SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT first_name AS Customer_Name,
       o.order_no AS Order_Number,
       o.order_date AS Order_Date,
       o.purchase_amt AS Order_Amount,
       s.name AS Salesperson_Name,
       s.commission AS Commission,
       CASE
           WHEN o.order_no IS NULL THEN 'No order placed'
           ELSE 'Order placed'
       END AS Order_Status
FROM customer c
LEFT JOIN orders o ON customer_id = o.customer_id
LEFT JOIN salesman s ON customer_id = s.Salesman_id
ORDER BY customer_id, o.order_date DESC;

 
