use sakila;

select * from products;

insert into products(productid,productname,categoryid,price)
values
('1','chais','1','18'),
('2','chang','1','19'),
('3','aniseed syrup','2','10');

select distinct * from products;

create table categories(
     categoryid int,
     categoryname varchar(100),
     descriptions varchar(100)
);

insert into categories(categoryid,categoryname,descriptions)
values
('1','bevarages','Soft drinks, coffees, teas'),
('2','Condiments','Sweet and savory sauces and seasonings'),
('3','confections','Desserts, candies, and sweet breads');

select distinct * from categories;

select distinct products.productname,products.productid,categories.categoryname
from products
inner join categories
on products.categoryid=categories.categoryid;