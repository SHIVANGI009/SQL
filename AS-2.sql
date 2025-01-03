use sakila;

create database sv;
use sv;
create table emp(
     emp_id int,
     emp_name varchar(50),
     emp_salary int
);

insert into emp values(1,'sam',21000),
(2,'max',22000),(3,'joe',23000),(4,'phoebe',24000),
(5,'ross',25000),(6,'monica',22000),(7,'chandler',45000),
(8,'rachael',30000),(9,'john',24000),(10,'samantha',33000);

-- Retrieve all columns from a table named emp.
select * from emp;

-- Find all employees whose salary is greater than 50,000 from the emp table.
select * from emp
where emp_salary > 40000;

-- Display the names of employees from the emp table, sorted alphabetically.
select emp_name from emp
order by emp_name;

-- Calculate the average salary of employees in the emp table.
select avg(emp_salary) as average_salary from emp;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

INSERT INTO department (department_id, department_name, location) VALUES
(1, 'Human Resources', 'New York'),
(2, 'Finance', 'London'),
(3, 'Engineering', 'San Francisco'),
(4, 'Marketing', 'Boston'),
(5, 'Sales', 'Chicago'),
(6, 'IT Support', 'Seattle'),
(7, 'Research and Development', 'Austin'),
(8, 'Legal', 'Washington D.C.'),
(9, 'Customer Service', 'Los Angeles'),
(10, 'Operations', 'Atlanta'),
(11, 'Training', 'Denver');

select * from department;

ALTER TABLE emp ADD department_id INT;

UPDATE emp
SET department_id = 1 
WHERE emp_id BETWEEN 1 AND 5;

UPDATE emp
SET department_id = 2
WHERE emp_id BETWEEN 6 AND 10;

select * from emp;
select * from department;

-- Retrieve a list of employee names and their department names. 
-- The employees table has department_id, and the departments table has department_id and department_name.

select emp.emp_name,department.department_name from emp
join department where emp.department_id = department.department_id;

-- Find the total number of employees in each department but only include departments with more than 1 employees.

SELECT department_id, COUNT(*) AS employee_count
FROM emp
GROUP BY department_id
HAVING employee_count > 1;

-- Find employees whose salary is above the average salary.

select emp_name,emp_salary from emp
where emp_salary > (select avg(emp_salary) from emp);

-- For each employee, display their name, salary, and the rank of their salary within the company.

select emp_name,emp_salary ,rank() over(order by emp_salary) as salary_rank from emp; 

-- Using a CTE, calculate the total salary for each department and display departments with a total salary exceeding 10000.

with department_salary as (
    select department_id,sum(emp_salary) as total_salary
    from emp
    group by department_id
)
SELECT department_id, total_salary
FROM department_salary
WHERE total_salary > 10000;
