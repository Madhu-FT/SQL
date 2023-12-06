# SQL DAY-2 (CREATE DATABASE & TABLES)***********************************************************************

#show databses
show databases;

#create database
create schema fashionworld;

#use database_name
use fashionworld;

#create table products
CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  size VARCHAR(10),
  color VARCHAR(20),
  description VARCHAR(250)
);

#create table customers
CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  address VARCHAR(255)
);

#create table orders
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

#Have a look at tables before inserting values!
#select * from table
select * from products;
select * from customers;
select * from orders;

#insert values into products
INSERT INTO products (id, name, price, size, color, description)
VALUES 
(1, 'T-shirt', 19.99, 'M', 'Blue', 'A comfortable and stylish t-shirt'),
(2, 'Jeans', 49.99, '32x34', 'Black', 'A classic pair of black jeans'),
(3, 'Sneakers', 79.99, '10.5', 'White', 'A pair of comfortable and stylish sneakers'),
(4, 'Sweater', 34.99, 'L', 'Gray', 'A cozy and warm sweater'),
(5, 'Dress', 59.99, 'S', 'Red', 'A beautiful and elegant dress'),
(6, 'Jacket', 99.99, 'XL', 'Green', 'A warm and stylish jacket'),
(7, 'Skirt', 29.99, 'M', 'Yellow', 'A cute and flirty skirt'),
(8, 'Blouse', 39.99, 'L', 'Pink', 'A flowy and feminine blouse'),
(9, 'Shorts', 24.99, 'S', 'Orange', 'A comfortable pair of shorts for summer'),
(10, 'Hoodie', 49.99, 'L', 'Black', 'A cozy and casual hoodie'),
(11, 'Boots', 89.99, '9.5', 'Brown', 'A stylish pair of boots for any occasion'),
(12, 'Sweatpants', 29.99, 'M', 'Gray', 'A comfortable and casual pair of sweatpants'),
(13, 'Sunglasses', 19.99, NULL, 'Black', 'A cool and trendy pair of sunglasses'),
(14, 'Scarf', 14.99, NULL, 'Purple', 'A warm and cozy scarf for the winter'),
(15, 'Hat', 9.99, 'One size', 'Navy', 'A stylish and versatile hat for any outfit'),
(16, 'Jumpsuit', 69.99, 'M', 'Black', 'A chic and trendy jumpsuit for any occasion'),
(17, 'Blazer', 79.99, 'L', 'White', 'A sophisticated and stylish blazer for work or events'),
(18, 'Sweatshirt', 39.99, 'XL', 'Pink', 'A comfortable and cozy sweatshirt for lounging'),
(19, 'Leggings', 24.99, 'S', 'Black', 'A versatile and comfortable pair of leggings'),
(20, 'Pants', 54.99, '32x30', 'Khaki', 'A classic and stylish pair of khaki pants');


#insert values into customers
INSERT INTO customers (id, name, email, phone, address)
VALUES 
(1, 'John Smith', 'john.smith@gmail.com', '+1 555-123-4567', '123 Main St, Anytown, USA'),
(2, 'Jane Doe', 'jane.doe@yahoo.com', '+1 555-987-6543', '456 Maple Ave, Anytown, USA'),
(3, 'Bob Johnson', 'bob.johnson@yahoo.com', NULL, '789 Oak St, Anytown, USA'),
(4, 'Emily Williams', 'emily.williams@gmail.com', '+1 555-555-1212', '321 Elm St, Anytown, USA'),
(5, 'David Lee', 'david.lee@yahoo.com', '+1 555-555-5555', '567 Pine St, Anytown, USA'),
(6, 'Sarah Kim', 'sarah.kim@gmail.com', '+1 555-123-7890', '890 Cedar Ave, Anytown, USA'),
(7, 'Michael Chen', 'michael.chen@yahoo.com', '+1 555-999-8888', '246 Birch Blvd, Anytown, USA'),
(8, 'Jessica Brown', 'jessica.brown@yahoo.com', '+1 555-777-6666', '369 Spruce St, Anytown, USA'),
(9, 'Kevin Garcia', 'kevin.garcia@gmail.com', '+1 555-111-2222', '802 Maplewood Dr, Anytown, USA'),
(10, 'Ashley Davis', 'ashley.davis@gmail.com', NULL, '135 Walnut St, Anytown, USA');

#insert values into orders
INSERT INTO orders (id, customer_id, product_id, quantity, order_date)
VALUES 
(1, 1, 1, 2, '2022-03-08 14:25:00'),
(2, 2, 1, 1, '2022-03-07 09:32:00'),
(3, 3, 3, 4, '2022-03-06 18:05:00'),
(4, 4, 5, 3, '2022-03-05 10:12:00'),
(5, 5, 2, 2, '2022-03-04 15:22:00'),
(6, 1, 3, 1, '2022-03-03 12:48:00'),
(7, 2, 4, 2, '2022-03-02 17:09:00'),
(8, 3, 1, 3, '2022-03-01 11:35:00'),
(9, 4, 2, 1, '2022-02-28 16:02:00'),
(10, 5, 5, 2, '2022-02-27 13:24:00'),
(11, 1, 2, 3, '2022-02-26 10:49:00'),
(12, 2, 3, 2, '2022-02-25 14:56:00'),
(13, 3, 4, 1, '2022-02-24 09:17:00'),
(14, 4, 1, 2, '2022-02-23 12:40:00'),
(15, 5, 3, 3, '2022-02-22 16:58:00');

#Have a look at tables after we are done with inserting values!
#select * from table
select * from products;
select * from customers;
select * from orders;

# SQL DAY-3 (DQL, DDL, DML, DCL, TCL)*********************************************************************************

#DQL (SELECT)
#SELECT
select name, email from customers;

#DDL (CREATE, ALTER, TRUNCATE, DROP)
#CREATE
create table trial
(id int primary key,
column1 varchar(20) not null
);

#ALTER
alter table trial 
add column2 int;

#TRUNCATE
truncate table trial;
#how the table looks like?-->All the elements will be deleted, only schema remains
Select * from trial;

#DROP
drop table trial;
#schema is deleted
select * from trial;

#DML (INSERT, UPDATE, DELLETE)
#INSERT-->alerady done

#UPDATE (pants-->shirt)
update products 
set name='shirt' 
where id=20;

select * from products;

#DELETE
delete from products 
where id=20;

select * from products;

#TCL (ROLLBACK, COMMIT)
set autocommit =0;
delete from products 
where id=19;
select * from products;
rollback;
select * from products;

delete from products 
where id=19;
select * from products;
commit;
select * from products;
rollback;
select * from products;

#DCL (GRANT, REVOKE)-->theoritical

# SQL DAY-4 (Conditionals, Operators, Clauses & RegEx in SQL)********************************************************
#IF Statement-->Q. Create a column which gives result as 'MORE' if price>50 else 'LESS'
SELECT *, IF(price>50, "MORE", "LESS")
FROM products;

#CASE Statement-->Q. Make a new column attire_type and add values 'cheap' for price<30, 'moderate' for price between 30 and 60 and 'expensive' for price>60
SELECT *,
CASE
    WHEN price <30 THEN 'cheap'
    WHEN price between 30 and 60 THEN 'moderate'
    ELSE 'expensive'
END AS attire_type
FROM products;

# Filter (where)-->Q. find details of 'Michael Chen' from csutomers table
select * from customers 
where name='Michael Chen';

# Comparison Operators (<, >, =, !=, <=, >=)
# >=   Q. find names of products where price is greater than or equal to 60
select name from products 
where price>=60;

# =    Q. find product details for size 'L'
select * 
from products 
where size = 'L';

#Arithmetic Operators (Avg, count, min, max, sum)
#COUNT-->How many products of black color are available
select color, count(*) 
from products 
where color='Black';

#SUM-->Number of quantity ordered by customer with id 1
select customer_id, sum(quantity) 
from orders 
where customer_id=1;

#MIN-->What is minimum price of product available 
select min(price)
from products;

#MAX-->What is maximum price of product available
select max(price)
from products;

#AVG-->What is the average price od products ordered
select avg(price)
from products;

# Logical Operators (or, and, not)
#OR-->Details of Jeans or Pants
select * from products
where name='Jeans' or  name='Pants'; 

#AND-->Is Yellow color Skirt available in products, if so what's the price?
select * from products
where name='Skirt' and color='Yellow';

# Special Operators (Between, Like, Is null, In, Not In, Distinct)
#Between-->Details of all the products available in price range from 45 to 60
Select * from products
where price between 45 and 60;

#like-->Details of warm clothes available 
select * from products
where description like '%warm%';

#Is null-->Details of all thsoe customers who haven't provided their phone numbers
select * from customers
where phone is null;

#IN-->Details of all the products available in size 'M', 'L' or 'XL'
select * from products 
where size In ('M', 'L', 'XL');

#NOT IN-->Deatils of all the products except Black color
select * from products 
where color Not In ('Black', 'Brown');

#distinct-->What all size products are available?
select distinct(size) from products;

# Group by clause, having clause and Order by clause
#Group By-->What is the count and average price of all size products available
select size, count(*), avg(price) from products
group by size;

#Having-->What is the count and average price of all size products having average price > 60
select size, count(*), avg(price) from products
group by size
having avg(price)>60;

#Order By-->What is the count and average price of all size products and arrange in ascending order of price
select size, count(*), avg(price) from products
group by size
order by avg(price);

#Order By-->What is the count and average price of all size products and arrange in descending order of price
select size, count(*), avg(price) from products
group by size
order by avg(price) desc;

# Aliases, limit and offset
#AS-->What is the count of all size products, use total as name of resulting column
select size, count(*) as total
from products
group by size
order by count(*);

#Limit-->details of highest price product available
select * from products
order by price desc
limit 1;

#Offset-->Details of 2nd to 5th highest price product details
select * from products
order by price desc
limit 1,3;
#OR...
select * from products
order by price desc
limit 3 offset 1;

# RegEx (Regular Expressions)     
select * from customers;
select * from products;

#Q1. Match beginning of string(^): Give names of customers whose name starts with ‘J’.
SELECT name FROM customers WHERE name regexp '^J';

#Q2. Match the end of a string($): Give names of customers having email id with extension '@gmail.com'.
SELECT email FROM customers WHERE email regexp '@gmail.com$';

#Q3.Matches any of the patterns p1, p2, or p3(p1|p2|p3): Give names containing 'Jo' or 'ee' or 'lli'.
SELECT name FROM customers WHERE name regexp 'Jo|ee|lli';

#Q4. Matches any character listed between the square brackets([abc]): Give names of colors containing vowels [aeiou]
SELECT color FROM products WHERE color regexp '[aeiou]';

# SQL DAY-5 (SQL Joins)*************************************************************************************************************
select * from customers;
select * from products;
select * from orders;

#Inner join-->Q. How many quantities in total were ordered by customers?
select c.name, sum(o.quantity)
from customers c inner join orders o
on c.id=o.customer_id
group by c.id;
#Conclusion: As we can see there are 10 customers, but we got details of only 5 customers as details of only 5 customers is present in orders table and we have applied inner join.
#inner join or we can also write join.

#Left join-->Q. How many quantities of each sized product are ordered?
select p.size, sum(o.quantity) from 
products p left join orders o
on p.id=o.product_id
group by p.size;

#Right join-->Q. Name the products which were ordered and number of quantities ordered.
select distinct(p.name)  
from products p right join orders o 
on o.product_id=p.id;

#Full Outer join/Outer join-->Q. What are the total number of products and average amount spent on each product?
#We can emulate FULL OUTER JOIN using UNION of left join & right join.
select p.id, count(p.id), avg(p.price) 
from products p left join orders o
on p.id=o.product_id
group by p.id
union
select p.id, count(p.id), avg(p.price) 
from products p right join orders o
on p.id=o.product_id
group by p.id;

#Cross or Cartesian join-->Join every row of a table to every row of some other table.
select *
from products p cross join orders o;
#Point to be noted here is, first id column is for products table, while other is for orders table.

#OR, we can also specify a condition on columns.
select *
from products p cross join orders o
where p.id=o.product_id;

#Self join-->Q. Name the products that are having same price.
SELECT A.name as product1, B.name AS product2, A.price
FROM products A, products B
WHERE A.id<> B.id
AND A.price = B.price
ORDER BY A.color;

#Equi join-->Q. Details of all those customers who have ordered something.
#1.	Inner join can have equality (=) and other operators (like <,>,<>) in the join condition.
#2.	Equi join only have an equality (=) operator in the join condition.
#3.	Equi join can be an Inner join, Left Outer join, Right Outer join

select *
from customers c join orders o
on c.id=o.customer_id;

#Natural join-->Q. Join products & orderes table without applying ON condition, check results & make conclusions out of that.
select *
from customers c natural join orders o;
#Check result-->and that's the drawback of using natural join as it joins tables based on same column names. But we know 'id' in customers table represents customer's id while in orders table it represents order's id.

#Multiple join-->Combine all the 3 tables
#Q. Name the customers who have ordered atleast 6 quantities and for price>140.
select c.name, sum(quantity), sum(price)
from (customers c join orders o on c.id=o.customer_id)
join products p on p.id=o.product_id
group by c.id
having sum(quantity)>=6 and sum(price)>140;

#**********************************************************************************************************************************
