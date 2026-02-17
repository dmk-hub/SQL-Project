-- 1. Basic Queries and Data Filtering

-- discontinued product
select id, product_name
from products
where discontinued = 1;

-- 4 cheapest products
select product_name, list_price
from products
order by list_price asc
limit 4;

-- Products priced from 15 to 25
select product_name, id, list_price
from products
where list_price between 15 and 25;

-- Employee with id and full_name 
select id, concat(first_name, ' ', last_name) as FullName
from employees;

-- Employees whose names start with 'A'
select id, first_name, last_name
from employees
where first_name like 'A%';

-- Number of different cities where employees live
select count(distinct city) as TotalCities
from employees;

-- First shipName from orders
select distinct ship_name
from orders;


-- 2. Aggregation and Subqueries

-- Lowest and highest price
select min(list_price) as MinPrice,
       max(list_price) as MaxPrice
from products;

-- Number of products in sale (discontinued = 0)
select count(*) as ActiveProducts
from products
where discontinued = 0;

-- The average and standard deviation
select avg(list_price) as AvgPrice,
       stddev_pop(list_price) as StdDevPrice
from products;

-- Products with higher than average prices
select product_name, list_price
from products
where list_price > (select avg(list_price) from products);


-- 3: Data Manipulation (DML)

-- Add Habeco supplier
insert into suppliers(company, first_name, last_name, city, country_region)
values ('Habeco', 'Nguyen', 'Hong Linh', 'Hanoi', 'Vietnam');

-- Add TBTruc Bach product
insert into products(product_name, supplier_ids, list_price, discontinued, category)
values (
    'TBTruc Bach',
    (select id from suppliers where company = 'Habeco'),
    22,
    0,
    'Beverages'
);

-- Update price for Truc Bach 
update products
set list_price = 18
where product_name = 'TBTruc Bach';

-- Delete the product first, avoid error foreign key
delete from products
where product_name = 'TBTruc Bach';

-- Then delete the supplier
delete from suppliers
where company = 'Habeco';

