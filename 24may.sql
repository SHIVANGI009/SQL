

use sakila;

select * from address;

select * from payment;
select customer_id,count(*) as total from payment 
group by customer_id order by total desc;

select customer_id,sum(amount) as total from payment 
group by customer_id;

select customer_id,sum(amount) as total from payment 
group by customer_id having total>100;

select customer_id,sum(amount) from payment
where customer_id>5 group by customer_id
having sum(amount)>100;

select * from payment;

select sum(amount) from payment where customer_id=1
and staff_id=1;

select sum(amount) from payment where customer_id=1
and staff_id=2;

select customer_id,staff_id,sum(amount) from payment
group by customer_id,staff_id;

-- get the total number of amount for each month for payment 
-- date for may june and july.

select month(payment_date),sum(amount)
from payment group by month(payment_date); 

-- joins 

create database testing;
use testing;

create table product(pid int, pname varchar(20), oid int);
insert into product values(1,"tv",100),(2,"mobile",300);

create table orders(oid int, city varchar(20));
insert into orders values(100,"jaipur"),(200,"goa"),(300,"hp"); 

select * from product;
select * from orders;

select pid,pname,city,orders.oid from 
product join orders
where (product.oid=orders.oid); 

select pid,pname,city,orders.oid from 
product join orders using (oid); 

select pid,pname,city,orders.oid from 
product inner join orders on(product.oid = orders.oid); 

-- left join

select pid,pname,city,orders.oid from 
product right join orders on(product.oid = orders.oid); 

-- natural join

select pid,pdname,city
from product natural join orders;

-- self join
create table employee(eid int,ename varchar(20),mid int);

insert into employee values(10,"shivangi",null),(20,"shiv",30),
(30,"mayank",10),(40,"ujjwal",20);

select emp.eid,emp.ename,emp.mid,mgr.eid 
from employee as emp join employee as mgr
where emp.mid = mgr.eid; 

-- i need to get the employee id and the emp name and manager name only for those user where the salary of the employee should be greater than 10
use sakila;
select * from actor;
select * from film_actor;
select * from film;
select actor.actor_id,first_name,last_name,
film_actor.film_id
from actor join film_actor join film
where ( actor.actor_id=film_actor.actor_id)and(film_actor.film_id=film_id);

-- agar actor 2 movie ki toh done 2 movie 0r 10 ki toh done 10 movie output like this. 

select a.actor_id,concat("done",count(f.film_id),'movies')
from actor as a join film_actor as f 
on a.actor_id=f.actor_id
group by 1;









