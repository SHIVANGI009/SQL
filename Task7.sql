use sakila;

select * from actor;
select * from film_actor;

create database regex;
use regex;

create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);

select * from orders1;
-- common condition
select o.oid,o.city,o.pid,p.pname from orders1 as o
join product as p where o.pid=p.pid;

-- agar hum koi bhi join condition nhi dete toh pehli table ka row second row ke har ek element se join kregi (A*B)
-- it is a type of a join where first table ki har ek row second table ki har ek row se match karegi called as cross or cartesian join
select o.oid,o.city,o.pid,p.pname,p.pid from orders1 as o
join product as p;

-- inner join : where we will be collecting a common value
select o.oid,o.city,o.pid,p.pname from orders1 as o
inner join product as p where o.pid=p.pid;

-- left join
select o.oid,o.city,o.pid,p.pname from orders1 as o
left join product as p on o.pid=p.pid;

select o.oid,o.city,o.pid,p.pname,p.pid from product as p
right join orders1 as o on o.pid=p.pid;

-- mysql main full outer join work nhi karta , oracle main work karta hai

use sakila;

-- you have to combine film_actor and film table to find out actor_id,film_id and movie name done by each actor.
select f.actor_id,f2.film_id,f2.title from film_actor as f
join film as f2 on f.film_id=f2.film_id;

-- find out the actor id , the movie name only for those movies which has a length of more than hundred.
select f.actor_id,f2.title,f2.length from film_actor as f
join film as f2 on f.film_id=f2.film_id
where f2.length > 100;

-- get the actor id and the number of movies he has done in his career.
select f.actor_id,count(f2.title) as total_movies from film_actor as f
join film as f2 where f.film_id=f2.film_id
group by f.actor_id;

-- get the title and the film id for the movies whose rating NC-17 and sort all these movie based on descending order of film id.
select film_id,title from film
where rating = 'NC-17'
order by title desc;

select * from actor;
select * from film_actor;
select * from film;

