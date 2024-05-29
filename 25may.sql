use sakila;

select distinct * from products;

select distinct * from categories;

-- inner join
select distinct products.productname,products.productid,categories.categoryid
from products
inner join categories
on products.categoryid=categories.categoryid;

-- left join
select * from payment;

select * from address;

select payment.payment_id,address.district
from payment
left join address
on payment.last_update=address.last_update
order by payment.payment_id;

-- right join
select * from payment;

select * from customer;

select distinct customer.first_name,customer.last_name,payment.payment_id
from payment
right join customer
on payment.customer_id=customer.customer_id;
