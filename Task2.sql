select database();

show databases;

show tables;

use sakila;

-- between operator is used to define the range of values.
-- select * from table_name where id in (2,5);
-- select * from table_name where id=2 or id=5;

-- like operator is like that value jo ek pattern par kaam karega.
-- these are wild card character -> like -> % [Zero or more chraracter ] , -> _ [only 1 character].
-- if we want first character s and last t then its like 's%t'
-- if we want second character a then its like '_A%'.

select * from actor;

-- i need to get all details from actor table where actor id is 3 or 5 or 7.
select * from actor where actor_id=3 or actor_id=5 or actor_id=7;

-- i need to get where actor id from 7 to 3
select * from actor where actor_id between 3 and 7;

-- i need to get those first name where actor id do not belong to 3 to 100
select * from actor where actor_id not between 3 and 100;

-- get the first name for those users second char is E and last char is R
select first_name from actor where first_name like '_E%R';

-- get the first name where nn can be present at any place
select first_name from actor where first_name like '%NN%';

-- get the first name and last name where the minimum character is two and the last third character is S in last name column
select first_name, last_name from actor where last_name like '__S___';

-- get me the first name where the first name should be of five characters
select first_name from actor where first_name like '_____';

-- i want those data where second character is A and last third char is H and in middle is T anywhere
select first_name from actor where first_name like '_A%T%H__';

 

