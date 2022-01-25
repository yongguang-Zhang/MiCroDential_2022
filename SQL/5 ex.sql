-- SELECT AVG(amount) FROM payment;

-- SELECT ROUND(AVG(amount),2) FROM payment;

SELECT MIN(amount) FROM payment;

-- SELECT amount FROM payment ORDER BY amount;

-- SELECT COUNT(amount) FROM payment WHERE amount = 0.00;

SELECT * FROM payment;

SELECT COUNT(customer_id),last_name
FROM customer
GROUP BY customer_id;

-- A company is looking to give two employees a bonus based on performance.  
-- The company decides that the employee who handled the most payments will receive the bonus.  
-- Which employee handled the most payments, and how much was the total of those payments they handled? 
SELECT staff_id,SUM(amount) AS Amount
FROM payment
GROUP BY staff_id;


-- A company is looking to send coupons to customers who spend the least amount of money in their store – 
-- they’re hoping to have them come in and spend more.  
-- They need a list of those 5 customers who spend the least.
SELECT customer_id,SUM(amount) AS Least_payment
FROM payment
GROUP BY customer_id
ORDER BY Least_payment 
LIMIT 5;



