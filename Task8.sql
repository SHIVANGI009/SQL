use sakila;

show tables;

-- Find the total number of actors in the database.
select count(actor_id) from actor;

-- Count how many films each actor has acted in.
select fa.actor_id,count(f.title) as total_movie from film_actor as fa
join film as f where fa.film_id=f.film_id
group by fa.actor_id;

-- Find the actor(s) who have acted in the most films.

-- List all actors whose last name starts with "S".
SELECT * FROM ACTOR
WHERE LAST_NAME LIKE 'S%';

-- Display all actors' full names in the format "LASTNAME, Firstname".
SELECT * , CONCAT_WS(' ',LAST_NAME,FIRST_NAME) AS FULL_NAME FROM ACTOR;

-- Find actors whose first or last name contains exactly 5 characters.
SELECT * FROM ACTOR
WHERE FIRST_NAME LIKE '_____'
AND LAST_NAME LIKE '_____';

-- Convert all actor last names to lowercase.
SELECT ACTOR_ID,FIRST_NAME,LOWER(LAST_NAME) AS NAME1 FROM ACTOR;

-- Show the most recently updated actor record.
SELECT * FROM ACTOR;

-- Find out how many actor records were last updated in the year 2006.
SELECT COUNT(ACTOR_ID) FROM ACTOR
WHERE YEAR(LAST_UPDATE) = 2006;

-- Extract and display the month from the last update date of the film records.
SELECT MONTH(LAST_UPDATE) , TITLE FROM FILM;

-- List all films whose last update occurred on a weekend (Saturday or Sunday).


create table employee1(eid int, ename varchar(20) , manager_id int);
insert into employee1 values(10,'Tushar',Null),(11,'Sakshi',12),(12,'Aman',13),(13,'Adi',14);

select * from employee1; 
drop table employee1;


create table employee1(eid int, ename varchar(20) , manager_id int);
insert into employee1 values(10,'Tushar',Null),(11,'Sakshi',12),(12,'Aman',13),(13,'Adi',14);

select * from employee1;

select emp.eid,emp.ename,emp.manager_id,manager.eid,manager.ename from employee1 as emp
join employee1 as manager where emp.manager_id=manager.eid;

-- Natural Join : it is one of the worst or waste join
-- agar common column hai toh inner join ki tarah work karega and agar common column nhi hai cartessian join

-- having clause
select customer_id,count(payment_id)
from payment group by customer_id having  count(payment_id) > 30;

select customer_id,count(payment_id)
from payment where customer_id not in (2,3)
group by customer_id having count(payment_id) > 35;

-- get the number of payment for each amount.
select amount,count(payment_id)
from payment
group by amount;

-- count the total number of customers who has done the payment for each amount except amount 2.99 and 0.99.
select amount,count(customer_id) 
from payment
where amount not in (2.99,0.99)
group by amount;

-- get the sum rental id and the total amount of payment only for 2.99 and 0.99 and 5.99 and the sum of rental id > 1000.

select amount,sum(rental_id)
from payment
where amount in (2.99,0.99,5.99)
group by amount
having sum(rental_id)>1000;

select * from actor;
select * from film_actor;

select a.actor_id,a.first_name,fa.film_id 
from actor as a 
join film_actor as fa where a.actor_id = fa.actor_id; 

select a.actor_id,count(fa.film_id) 
from actor as a 
join film_actor as fa where a.actor_id = fa.actor_id
group by a.actor_id;



use sakila;
select * from payment where 
amount = (select amount from payment where payment_id = 6);

-- i need to get all the columns for the actor whose actor id is greater than the actor id of a person whose first name is ed and last name is chase.
select * from actor
where actor_id > (select actor_id from actor where first_name = 'ED' and last_name = 'CHASE');

select * from payment;

-- get all the payment details for those payment where the month should be equal to the payment month of payment id 5.

select * from payment 
where month(payment_date) = (select month(payment_date) from payment where payment_id = 5);

select * from payment;

-- get the customer id the payment id and the amount for the payments where the rental id is less than the rental id of payment id 7 and amount less than 5.

select customer_id,payment_id,amount from payment
where rental_id < (select rental_id from payment where payment_id = 7 and amount < 5); 

-- get the amount and the total number of payments done where the total number of payment is greater than the total number of payment done by amount 5.99.

select amount,count(payment_id) 
from payment
group by amount 
having count(payment_id) > (select count(payment_id) from payment where amount = 5.99);

-- Multi row subquery

select * from payment
where amount in (select amount from payment where payment_id in (3,1) );

select * from payment
where amount =any (select amount from payment where payment_id in (3,1) );

select * from payment
where amount >any (select amount from payment where payment_id in (3,1) );

select * from payment
where amount <any (select amount from payment where payment_id in (3,1) );

select * from payment
where amount >all (select amount from payment where payment_id in (3,1) );

select * from payment
where amount <all (select amount from payment where payment_id in (3,1) );


