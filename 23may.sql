
-- date time functions

select curtime() from dual;

select current_timestamp() from dual;
select now() from dual;

select adddate(now(),interval 2 month) from dual;

select dayname(now() ) from dual;


select date_format(now(), "%M--%Y") from dual;

-- date function
-- numerical
-- round,truncate,mod
select round(10.6) from dual;

select round(10.4614,1) from dual;

select truncate(10.498,2) from dual;

select mod(11,2) from dual;

# conditional
-- if

use sakila;

select * from actor;

select if(True,10,20) from dual;

select actor_id,first_name,
if(actor_id=1, actor_id+10, actor_id) from actor;

-- if(actor_id=2, actor_id+10, 
   -- if(actor_id=4, actor_id+20,actor_id))
   -- from actor; 
   
-- case statement

select actor_id,first_name,
     case 
          when actor_id=2 then actor_id+10
          when actor_id=3 then actor_id+20
     else actor_id     
     end "newcol" from actor; 
     
-- if a person have a actorid more than 5=10add,15=25,30=50,otherwise increase by 5

select actor_id,first_name,
	case 
		  when actor_id>5 then actor_id+10 
          when actor_id>15 then actor_id+25
          when actor_id>30 then actor_id+50 
     else actor_id+5 
     end "newcol" from actor; 
     
-- groupby , difference between distinct and groupby,where and having clause difference between
     