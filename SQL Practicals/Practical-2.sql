#Day-6 (Ranking & Analytical Functions)*********************************************************************************

#Create a database swiggy
use swiggy;

#view all tables
select * from users1;
select * from restaurants_1;
select* from food;
select* from menu_1;
select * from orders1;
select * from orderdetails;

#Ranking Functions (Row number, rank, dense rank)
#Q. What are the delivery ratings given by each user, arrange them in descending order?
#Row number-->
select u.name, o.delivery_rating,
row_number() over(partition by u.name order by o.delivery_rating desc) as rank_rating
from users1 u join orders1 o
on u.user_id=o.user_id;

#Rank-->
select u.name, o.delivery_rating,
rank() over(partition by u.name order by o.delivery_rating desc) as rank_rating
from users1 u join orders1 o
on u.user_id=o.user_id;
#Note: Here after two same ranks, and then rank is jumping to next like 1,1,1,4...

#Dense rank-->
select u.name, o.delivery_rating,
dense_rank() over(partition by u.name order by o.delivery_rating desc) as rank_rating
from users1 u join orders1 o
on u.user_id=o.user_id;
#Note: Now we have continuous ranks 1,2,3... as we have used dense rank

#Q. What is the amount of food ordered by each user, arrange in decending order with respect to amount?
#Row number-->
select u.name, o.amount,
row_number() over(partition by u.name order by o.amount desc) as rank_amount
from users1 u join orders1 o
on u.user_id=o.user_id;

#Rank-->
select u.name, o.amount,
rank() over(partition by u.name order by o.amount desc) as rank_amount
from users1 u join orders1 o
on u.user_id=o.user_id;

#Dense Rank-->
select u.name, o.amount,
dense_rank() over(partition by u.name order by o.amount desc) as rank_amount
from users1 u join orders1 o
on u.user_id=o.user_id;

#Q. Which cuisine is sold for highest price?
#Row number-->
select r.cuisine, m.price,
row_number() over(partition by  r.cuisine order by r.cuisine, m.price desc) as rank_price
from restaurants_1 r join menu_1 m
on r.r_id=m.r_id;

#Rank-->
select r.cuisine, m.price,
rank() over(partition by  r.cuisine order by r.cuisine, m.price desc) as rank_price
from restaurants_1 r join menu_1 m
on r.r_id=m.r_id;

#Dense rank-->
select r.cuisine, m.price,
dense_rank() over(partition by  r.cuisine order by r.cuisine, m.price desc) as rank_price
from restaurants_1 r join menu_1 m
on r.r_id=m.r_id;

#Note: Observe the difference in all the 3 queries (rank, dense rank & row number) carefully.

#Analytic Functions (Lead, lag)
#Q. For each person find whether he has spent more/less on food than previous day.
#Lag
select u.name, o.date, o.amount,
lag(amount) over(partition by u.name order by o.date) as previous_amount
from orders1 o join users1 u
on o.user_id=u.user_id;

#Q. For each person find whether he has spent more/less on food than next day.
#Lead
select u.name, o.date, o.amount,
lead(amount) over(partition by u.name order by o.date) as previous_amount
from orders1 o join users1 u
on o.user_id=u.user_id;

#Note: So, uisng lag an dlead functions we compare things happened previously or next time

#Day-7 (Subqueries in SQL)*********************************************************************************
#Q1. Find name and email of all those users who have yahoo.com id and are customers of Swiggy but have never ordered anything from it.
select name, email
from users1 
where user_id not in (select user_id from orders1)
and email regexp ('@yahoo.com');

#Q2. Find details of user who have spent maximum amount on food on some particular day.
select * 
from users1 
where user_id=(select user_id from orders1 where amount=(Select max(amount) from orders1));

#Q3. Find name & email id of gmail user who haven gaven rating 1 on Swiggy.
select email 
from users1
where user_id in (select user_id from orders1 where restaurant_rating = 1) 
and email regexp ('@yahoo.com');

#Q4. Find details of highest price food ordering restaurant
select * 
from restaurants_1 
where r_id=(select r_id from menu_1 where price=(Select max(price) from menu_1));

#Q5. Name of food offered with minimum price
select f_name
from food
where f_id=(select f_id from menu_1 where price=(Select min(price) from menu_1));

#Q6. Menu id of lowest price food offered.
select menu_id
from menu_1 
where price=(Select min(price) from menu_1);

#Q7. Which cuisine is offering food with lowest price?
select cuisine
from restaurants_1 
where r_id=(select r_id from menu_1 where price=(Select min(price) from menu_1));

#Q8. Menu id of highest price food offered.
select menu_id
from menu_1 where price=(Select max(price) from menu_1);

#Q9. Details of food offered with maximum price
select *
from food
where f_id=(select f_id from menu_1 where price=(Select max(price) from menu_1));

#Q10. Find address, city, state, phone of restarant where food with minimum price is being offered.
select address, city, state, phone
from restaurants_1
where r_id=(select r_id from menu_1 where price=(Select min(price) from menu_1));

#Day-8 (Common Table Expressions)*********************************************************************************
#Q1. What are the least delivery ratings given by each user?
with least_del as
(select u.name, o.delivery_rating,
row_number() over(partition by u.name order by o.delivery_rating) as row_
from users1 u join orders1 o
on u.user_id=o.user_id)
select * from least_del
where row_=1;

#Q2. What is the maximum amount food ordered by each user?
with max_amount as
(select u.name, o.amount,
row_number() over(partition by u.name order by o.amount desc) as row_
from users1 u join orders1 o
on u.user_id=o.user_id)
select * from max_amount
where row_=1;

#Q3. What are the highest restaurant ratings given by each user?
with highest_res as
(select u.name, o.delivery_rating,
row_number() over(partition by u.name order by o.restaurant_rating desc) as row_
from users1 u join orders1 o
on u.user_id=o.user_id)
select * from highest_res
where row_=1;

#Q4. What is the minimum amount food ordered by each user?
with min_amount as
(select u.name, o.amount,
row_number() over(partition by u.name order by o.amount) as row_
from users1 u join orders1 o
on u.user_id=o.user_id)
select * from min_amount
where row_=1;

#Day-9 (Views)*****************************************************************************************************
# Q1. Create a view containing details of users and the number of times they were delivered food in less than 30 minutes
select u.*, count(*)
from orders1 o join users1 u
on o.user_id=u.user_id
where o.delivery_time<30
group by user_id;

create view delivery_30 as
select u.*, count(*)
from orders1 o join users1 u
on o.user_id=u.user_id
where o.delivery_time<30
group by user_id;
#Note: It can be used by Swiggy to analyze delivery timings and improve the number of counts of deliveries done in less than 30 minutes.

select * from delivery_30;

#Q2. Create a view containing details of all those users who ordered food atleast once for rupees 500 or more
select * from users1 where user_id in
(select o.user_id
from orders1 o join users1 u
on o.user_id=u.user_id
where o.amount>=500);

create view amount_500 as
select * from users1 where user_id in
(select o.user_id
from orders1 o join users1 u
on o.user_id=u.user_id
where o.amount>=500);

select * from amount_500;

#Q3. Create a view containing details of all those restaurants offering food for less than 120
select * from restaurants_1 where r_id in
(select m.r_id
from menu_1 m join restaurants_1 r
on m.r_id=r.r_id
where m.price<120);

Create view price_120 as
select * from restaurants_1 where r_id in
(select m.r_id
from menu_1 m join restaurants_1 r
on m.r_id=r.r_id
where m.price<120);

select * from price_120;

#Drop a view
drop view price_120;

#Day-10 (Indexes)*****************************************************************************************************
#Q1. Create index on menu_id
CREATE INDEX idx_menu_id ON menu_1 (menu_id);

SELECT f_id, price
FROM menu_1
WHERE menu_id = 39;

#Q2. Create an index on the combination of columns "menu_id", "r_id", and "f_id"
CREATE INDEX idx_menu_restro_food ON menu_1 (menu_id, r_id, f_id);

SELECT menu_id, r_id, f_id, price
FROM menu_1
WHERE r_id = 3
AND f_id = 7
ORDER BY price DESC;

#Day-11 (Stored Procedures)****************************************************************************************************
select * from orders1;

CREATE PROCEDURE `orders_info`()
select * from orders1;

call orders_info;

#IN: Q1. Create stored procedure showing details of all those orders in which restaurants got rating 5/any other.
select * 
from orders1
where restaurant_rating=5;

Create procedure rating_5 ()
select * 
from orders1
where restaurant_rating=5;

call rating_5;

#Now let's say we want to make a parameter
Create procedure rating_ (IN rate int)
select * 
from orders1
where orders1.restaurant_rating=rate;

call rating_(4);
call rating_(2);

#OUT: Q2. Create stored procedure showing count of orders in which restaurants got rating 5.
select count(*)
from orders1
where restaurant_rating=5;

Create procedure total_ratings (out records int)
select count(*) into records
from orders1
where orders1.restaurant_rating=5;

call total_ratings(@records);
select @records as Total_Ratings;

#INOUT: Q3. Create stored procedure showing count of all those orders in which restaurants got rating 4/any other.
select count(*)
from orders1
where restaurant_rating=4;

Create procedure total_rate (inout records int, in rate int)
select count(*) into records
from orders1
where orders1.restaurant_rating=rate;

call total_rate(@records, 4);
select @records as Total_rate;

#Day-12 (Triggers)*****************************************************************************************************
#Before insert triggers in SQL
create trigger menu_trigger
before insert on menu_1
for each row 
set new.price = new.price+100;

#Insert a record in the table and see if price is being updateed or not
insert into menu_1(menu_id, r_id, f_id, price) values (101,20,11,150);

#check table after inserting value
select * from menu_1;

#Note: We have inserted a new record in table menu, price=150 but since we have set a trigger so we can see new price is updated by 100 and now we have price=250.

#After insert triggers in SQL
#we have to create a new table which stores updated price
create table final_price 
(total_price int);

#Insert a record in the table and see if price is being updated or not 
insert into menu_1(menu_id, r_id, f_id, price) values (103,19,10,180);

#Note: We have inserted a new record in table menu, price=180 but since we have set a trigger so we can see new price is updated by 100 and now we have price=280.

create trigger price_trigger
after insert on menu_1
for each row 
insert into final_price values(total_price);

#check table after inserting value
select * from menu_1;

#Show trigger
show triggers;

#Drop trigger in SQL
drop trigger price_trigger;

#*******************************************************************************************************************
