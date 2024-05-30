
use sakila;

-- finding the second highest salary
create table ut1(id int);
insert into ut1 values(10),(20),(30),(30),(40),(40);
select * from ut1;

select min(id) from ut1 
where id > (select min(id) from ut1
where id > (select min(id) from ut1) );

-- ddl command ()
create database isha;
use isha;
-- int 4 byte (2^32)
create table abc(id int);
insert into abc values(2147483647);
select * from abc;

-- bigint
-- 18,446,744,073,709,551,615 unsigned big int
-- 8 byte

-- tinyint 1byte=> boolean => 256 (unsigned) => 
-- -128 to 127, smallint 2byte,mediumint 3byte,int 4byte,bigint 8byte

-- string data
-- varchar (variable character) and char(fixed size character)
create table s1(name varchar(3));
insert into s1 values("sam");
select * from s1;

-- 



















