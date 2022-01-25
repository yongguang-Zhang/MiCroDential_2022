-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Grouping by one column]: 
select state, count(user_id) from purchases group by state;
-- 2. [Grouping by multiple columns]: 
select state, zipcode, count(user_id) from purchases group by state, zipcode;
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Find the most recent purchase made within each state.
SELECT state,MAX(created_at) FROM purchases
GROUP BY state;

-- 2. Use the purchase_items table to find the total number of each product_id sold.
SELECT product_id,COUNT(product_id)
FROM purchase_items
GROUP BY product_id;
-- 3. Use the purchase_items table to see the total dollar amount of items in each state: Delivered, Returned, Pending
SELECT status, SUM(price*quantity) AS Amount
FROM purchase_items
GROUP BY status;
-- 4. In the products table, find how many products are under each set of tags.
SELECT * FROM products;

SELECT tags,COUNT(product_id)
FROM products
GROUP BY tags
ORDER BY COUNT(product_id);
-- 5. Modify the previous query to find how many products over $10 are under each set of tags.
SELECT tags,COUNT(product_id)
FROM products
WHERE price > 10.00
GROUP BY tags
ORDER BY COUNT(product_id);

-- 6. Use the user table to find out how many purchases each user made.
SELECT user_id,COUNT(user_id) 
FROM purchases
GROUP BY user_id
ORDER BY user_id;



-- 7. What is the first purchase that was made in each state, in each zipcode? (No, zipcodes do not repeat between states, but write your query as though they did.)
SELECT state,zipcode,MIN(created_at)
FROM purchases
GROUP BY state,zipcode;
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. The DATEPART() function extracts whichever part of the
--  timestamp you want. E.g. DATEPART(year FROM '2001-02-16 20:38:40')
--  returns 2001. Use DATEPART() to extract which calendar month
--  each user was created in.
SELECT * FROM users;

SELECT user_id,DATE_PART('month' ,created_at)
FROM users;
-- 2. Use DATEPART() and a group by statement to count how many
--    users were created in each calendar month.
SELECT DATE_PART('month',created_at),COUNT(user_id)
FROM users
GROUP BY DATE_PART('month',created_at)
ORDER BY DATE_PART('month',created_at);
-- 3. Use the DATEPART() function to find the number of users
--    created during each day of the week.
--    Hint: Use DAY as the first input
SELECT DATE_PART('dow',created_at),COUNT(user_id)
FROM users
GROUP BY DATE_PART('dow',created_at)
ORDER BY DATE_PART('dow',created_at);

