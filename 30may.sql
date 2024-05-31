use sakila;

show tables;
select * from abc;

-- dml operation
-- we can recover the data after apply delete command
-- it delete data only otherwise it delete all
delete from abc where id=1;

-- update dml
select * from abc;

update abc set id=10;
select * from abc;

-- ddl(create,drop,truncate,alter)
show tables;
drop table actor_info;

select * from actor_info;
-- the data never back in drop and truncate
truncate actor_info;

use sakila;

select * from actor;

create table o3
as select actor_id as id,first_name as name from actor;
select * from o3;

-- alter command and group concat and what is transaction , why it is mandatory to maintain .

