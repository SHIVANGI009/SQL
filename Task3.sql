use sakila;

-- String Function

select * from actor;

-- function
-- scaler function (single function : jo har ek row par apply honge and har ek row par aapko result dega) 
-- lower is a scaler function

-- Lower Case & Upper Case
select first_name, lower(first_name) , upper(lower(first_name)) from actor;

-- Length
select first_name, length(first_n) as lengthchar from actor;

select first_name, char_length(first_name) from actor;

-- dummy table
select length('नमस्ते') from dual;
select char_length('नमस्ते') from dual;

select length('😂😂') from dual;
select char_length('😂😂') from dual;

select length('Hello') from dual;
select char_length('Hello') from dual;

select "Shivangi","Vashistha", concat("Shivangi"," ","Vashistha") as fullname from dual;

-- Concat
select * from actor;
select first_name,last_name,concat(first_name," ",last_name) as full_name from actor;
select first_name,last_name,concat_ws(" ",first_name,last_name) as full_name from actor; -- concat with separator

-- Substring (column_name,index,total number of character)
select first_name, substr(first_name,2) , 
substr(first_name,1,3) , 
substr(first_name,-5) 
from actor;

select first_name,instr(first_name,"I") from actor;


-- distinct : extract unique values in a specific column
select distinct(first_name) from actor;

-- count :  find out the number of rows
select count(distinct(first_name)) from actor;


-- trim is used to remove white spaces 
select first_name, trim('     hie  ') from actor;

-- lpad() , rpad()
select first_name, rpad(first_name,6,'#') from actor;
select first_name, lpad(first_name,6,'#') from actor;












