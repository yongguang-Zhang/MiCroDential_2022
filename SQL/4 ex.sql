-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Grouping by multiple columns]: 
SELECT state, zipcode, COUNT(user_id) FROM purchases GROUP BY state, zipcode;
-- 2. [Group by using a HAVING filter]:
SELECT state, COUNT(user_id) FROM purchases
GROUP BY state
HAVING COUNT(user_id) > 100;
-- 3. [Multiple-value subquery]: 
SELECT * 
FROM purchases 
WHERE user_id IN (SELECT user_id FROM users WHERE email LIKE '%@gmail.com');
-- 4. [Using alias in filter]: 
SELECT name, email FROM users AS u
JOIN purchases AS p 
ON p.user_id=u.user_id
WHERE u.email LIKE '%@gmail.com';
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Find the most recent purchase made by each user.
SELECT * FROM purchases;

SELECT name,MAX(created_at) 
FROM purchases
GROUP BY name;
-- 2. Which Jeopardy shows had a question worth more than $4000?
SELECT product_id,COUNT(product_id),SUM(price*quantity) 
FROM purchase_items
GROUP BY product_id
HAVING SUM(price*quantity)  > 4000;

-- 3. Find the oldest purchase made by a user with a yahoo email
--    address.
SELECT * FROM users;

SELECT min(p.created_at), p.user_id, email
FROM purchases as p
JOIN users as u
ON p.user_id = u.user_id
WHERE u.email like '%@verizon.com'
GROUP BY p.user_id, email
LIMIT 1;


-- 4. Find all the users' emails who made at least one purchase from the
--    state of NY.
SELECT email,COUNT(u.user_id)
FROM users as u 
JOIN purchases as p 
ON p.user_id = u.user_id
WHERE p.state LIKE 'NY'
GROUP BY email;

SELECT email 
FROM users 
WHERE user_id IN
(SELECT user_id FROM purchases WHERE state LIKE 'NY');

----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Use the DATEPART() function to find the number of users created
--    during each day of the week.
--    Hint: Use DW as the first input
SELECT user_id,DATE_PART('dow',created_at)+1
FROM users;
-- 2. How about each day of the month?
SELECT user_id,DATE_PART('day',created_at)+1
FROM users;


-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Single-value subquery]: 
select * 
from purchase_items 
where price = (select max(price) from products);
-- 2. [Multiple-value subquery]: 
select * 
from purchases 
where user_id in (select user_id from users where email like '%@yahoo.com') 
or user_id in (select user_id from users where email like '%@gmail.com');
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Select the products that cost more than average.
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);
-- 2. Find all the purchase_items that represent orders for the lowest-priced product.
SELECT * 
FROM purchase_items
WHERE price = (SELECT MIN(price) FROM purchase_items);
-- 3. Find the most recent purchase made by a user with a Gmail email address.
SELECT user_id,email
FROM users 
WHERE email like '%gmail.com' AND user_id in (SELECT user_id FROM purchases order BY created_at);

-- Correct
SELECT * FROM purchases WHERE
user_id IN
(SELECT user_id FROM users WHERE email LIKE '%@gmail.com')
order by created_at desc
limit 5;

-- 4. List the titles of the products that were ever returned in quantities greater than 4.
SELECT title
FROM products
WHERE product_id in (SELECT product_id FROM purchase_items WHERE status = 'Returned' AND quantity > 4);


-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Join]: 
select name, email from purchases join users on purchases.user_id = users.user_id;
-- 2. [Same join using aliases]: 
select name, email from users as u join purchases as p on p.user_id=u.user_id;
-- 3. [Using alias in filter]: 
select name, email from users as u join purchases as p on p.user_id=u.user_id where u.email like '%gmail.com';
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Join the purchases and purchase_items tables, on purchases.id and purchase_items.purchase_id
SELECT * 
FROM purchases 
JOIN purchase_items 
ON purchases.purchase_id = purchase_items.purchase_id;
-- 2. Modify the last query, aliasing purchases as p and purchase_items as pi.
SELECT * 
FROM purchases as p
JOIN purchase_items as pi 
ON p.purchase_id = pi.purchase_id;
-- 3. Using the same join, perform a group by to sum the total quantity of items purchased under each user_id.
SELECT user_id,SUM(quantity)
FROM purchases as p
JOIN purchase_items as pi
ON p.purchase_id = pi.purchase_id
GROUP BY user_id
ORDER BY user_id;


-- 4. Using the same join, find the average purchase amount from each state.
SELECT state,AVG(price*quantity)
FROM purchases as p
JOIN purchase_items as pi
ON p.purchase_id = pi.purchase_id
GROUP BY state
ORDER BY state;
-- 5. Join the purchases and users tables, using an alias for each table.
SELECT * 
FROM purchases as p
JOIN users as u
ON p.user_id = u.user_id;
-- 6. Using the above join, filter to just the orders with an Gmail email address OR a buyer named 'Clay'
SELECT * 
FROM purchases as p
JOIN users as u
ON p.user_id = u.user_id
WHERE email like '%gmail%' OR name like 'Clay%';


----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Joins can combine more than two tables. Join the users table,  purchases table, and purchase items table. 
-- Remember to use aliases.
SELECT * 
FROM users as u
JOIN purchases as p
ON u.user_id = p.user_id
JOIN purchase_items as pi
ON p.purchase_id = pi.purchase_id;
