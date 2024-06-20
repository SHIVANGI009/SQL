use sakila;

select * from orders;
ALTER TABLE orders
DROP COLUMN new_column;

ALTER TABLE orders
DROP COLUMN full_name;

ALTER TABLE orders
DROP COLUMN orderid;

ALTER TABLE orders
DROP COLUMN order_id;

ALTER TABLE orders
RENAME COLUMN order_no TO order_id;


select * from customer;

ALTER TABLE customer
ADD COLUMN full_name VARCHAR(255); -- Adjust the datatype and size as per your needs

SET SQL_SAFE_UPDATES = 0;

UPDATE customer
SET full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE customer
DROP COLUMN first_name;

alter table customer
rename column full_name to customer_name;

-- Write a query to retrieve the order_id, customer_name, and order_date from two tables: orders and customers. The orders table has a foreign key customer_id which references id in the customers table.
SELECT o.order_id, c.customer_name, o.order_date
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id;

-- Write a query to retrieve all customers and their orders. Include customers who may not have placed any orders. The orders table has a foreign key customer_id which references id in the customers table.
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM 
    customer c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id;
    
-- Write a query to retrieve all orders and their customers. Include orders that have no matching customers. The orders table has a foreign key customer_id which references id in the customers table.
SELECT 
    o.order_id,
    o.order_date,
    c.customer_id,
    c.customer_name
FROM 
    orders o
LEFT JOIN 
    customer c ON o.customer_id = c.customer_id;
    
-- Write a query to retrieve all customers and all orders, regardless of whether the orders have matching customers. The orders table has a foreign key customer_id which references id in the customers table.
SELECT *
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Write a query to find all pairs of employees who work in the same department. Use the employees table which has id, name, and department_id columns.
select * from employees;

-- Write a query to find the names of customers who have placed an order with a total amount greater than $1000. The orders table has customer_id and amount columns.
select * from orders; 

SELECT c.customer_name
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.purchase_amt > 1000;

-- Write a query to find the average order amount for each customer. Use a subquery to calculate the total amount per customer and then calculate the average from that result.
    
SELECT
    c.customer_id,
    c.customer_name,
    AVG(o.total_amount) AS avg_order_amount
FROM
    customer c
JOIN
    (
        SELECT
            customer_id,
            SUM(purchase_amt) AS total_amount
        FROM
            orders
        GROUP BY
            customer_id
    ) o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name;

-- Write a query to find the names of customers who have placed at least one order in the last 30 days. Use a subquery to find recent orders.    
SELECT DISTINCT c.customer_name
FROM customer c
JOIN (
    SELECT customer_id
    FROM orders
    WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
) recent_orders ON c.customer_id = recent_orders.customer_id;

select * from employees;

-- Write a query to increase the salary of employees by 10% whose salary is below the average salary. The employees table has id and salary columns.

-- Calculate the average salary first
SET @avg_salary := (SELECT AVG(salary) FROM employees);

-- Update employees whose salary is below the average
UPDATE employees
SET salary = salary * 1.1  -- Increase salary by 10%
WHERE salary < @avg_salary;

SELECT department_id, salary
FROM employees
WHERE salary >= @avg_salary;

-- Write a query to delete all orders from customers who have not placed any orders in the last year. The orders table has order_date and customer_id columns.
DELETE FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING MAX(order_date) < DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

DELETE orders
FROM orders
LEFT JOIN (
    SELECT customer_id
    FROM orders
    WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY customer_id
) recent_orders ON orders.customer_id = recent_orders.customer_id
WHERE recent_orders.customer_id IS NULL;
select * from orders