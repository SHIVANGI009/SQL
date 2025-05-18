use sakila;

-- CURDATE FUNCTION AND CURRENT_DATE FUNCTION : SHOWS CURRENT DATE
select curdate() , current_date() from dual;

-- NOW FUNCTION : SHOWS CURRENT DATE + TIME
select now() from dual;

-- ADD DATE FUNCTION
select adddate(now(),2) from dual;
select adddate(now(),interval 2 month) from dual;

-- DATE DIFF FUNCTION
select datediff(now(),'2025-05-18') from dual;
select datediff(now(),'2025-05-14') from dual;
select datediff('2025-05-18','2025-05-14') from dual;


-- NOW WE EXTRACT CURRENT YEAR
select year(now()) from dual;
select last_day(now()) from dual;


-- DATE FORMAT FUNCTION ('%Y IS ACCESS MODIFIER')
select date_format(now(),"%M") from dual;
select date_format(now(),"current month is %M") from dual;
select date_format(now(),"current year is %Y") from dual;
select date_format(now(),"current month is %m") from dual;
select date_format(now(),"current month is %y") from dual;



-- sysdate function
select sysdate() from dual;
select current_timestamp() from dual;

-- Extract function
select extract(year from now()) from dual;
select extract(minute from now()) from dual;

-- NUMBER FUNCTION
-- round() , truncate() , pow , floor() , ceil
select 24.325, round(24.625), round(24.685,1) from dual;
select round(364.37,1), truncate(364.37,1) from dual;
select mod(11,2),pow(2,3),floor(10.99999),ceil(19.0001) from dual;


-- conditional statement
select first_name,actor_id,if(first_name='Nick','Yes',if(first_name='ED','Hello','No' ) ) from actor;

-- if actor id is even then first and last name concat , if it is odd concat it but with the $ symbol
select first_name ,last_name ,actor_id ,if(actor_id%2=0 , concat(first_name, last_name), concat_ws('$',first_name,last_name)) from actor;

select actor_id,first_name,
case
   when mod(actor_id,2)=0 then 'yes'
   when actor_id=5 then '####yes####'
   else 'no'
end
from actor;

select round(366.37,-1) from dual;
