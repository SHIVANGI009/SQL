use sakila;

create table employees(
	id int primary key auto_increment,
    dept varchar(50),
    salary int
);

insert into employees(dept,salary) 
values ("hr",200),
("hr",100), ("marketing",70),
("marketing",50),("marketing",200),
("marketing",400),("dsa",150);

select * from employees;

select id,dept,salary,
(select avg(salary) from employees) 
from employees;

-- windows function is an way in which you use aggregate function over a particular 
-- it is also called analytical function
select id,dept,salary,avg(salary)
over() from employees;

select id,dept,salary,max(salary)
over() from employees;

select id,dept,salary,avg(salary) over(),
avg(salary) over(partition by dept) from employees;

select id,dept,salary,sum(salary) over(),
sum(salary) over(partition by dept) from employees;

-- rolling sum 
select id,dept,salary,sum(salary) over(),
sum(salary) over(order by salary) from employees;

select id,dept,salary,sum(salary) 
over(partition by dept order by salary)
from employees;

-- rank, dense_rank()
select id,dept,salary,
rank() over(order by salary) from employees;

select id,dept,salary,
dense_rank() over(order by salary) from employees;

select id,dept,salary,
rank() over(partition by dept order by salary) from employees;

-- using the windows function find out the nth highest salary from employee.
select id,dept,max(salary) 
from employees; 