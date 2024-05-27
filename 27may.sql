use sakila;

select * from payment;

-- sub query: a query within a query , single row subquery

select amount from payment where payment_id=1;

select * from payment where amount=2.99;

select * from payment
where amount=(select amount from payment where payment_id=1); 

-- amount=0.99
select * from payment
where amount=(select amount from payment where payment_id=4); 

select amount from payment where rental_id=573;

select * from payment
where amount=(select amount from payment where rental_id=573);

-- i need to get those user whose staff id is equal to the staff id of payment id 10

select staff_id from payment where payment_id=10;

select * from payment where staff_id=2;

select * from payment
where staff_id=(select staff_id from payment where payment_id=10);  

-- i need to get the payment and staff id amount and payment date where the month of payment date should be equal to payment id 5 month

select month(payment_date) from payment where payment_id=5;

select * from payment
where month(payment_date)=(select month(payment_date) from payment where payment_id=5);

-- subquery has more than one row
-- in any all operators

select * from payment
where amount in(select amount from payment where payment_id in (2,3) );

select * from payment
where amount not in(select amount from payment where payment_id in (2,3) ); 

-- greater than the minimum value of subquery

select * from payment
where amount not in(select amount from payment where payment_id in (2,3) ); 

select * from payment
where amount >= any(select amount from payment where payment_id in (2,3) );

select * from payment
where amount < any(select amount from payment where payment_id in (2,3) ); 

select * from payment
where amount <= any(select amount from payment where payment_id in (2,3) );

-- all (-all) not available

select * from payment
where amount < all(select amount from payment where payment_id in (2,3) );  

select * from payment
where amount > all(select amount from payment where payment_id in (2,3) );   
