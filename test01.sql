WITH customer_overdued_count AS(
WITH customer_overdued AS(
WITH customer_1 AS(
SELECT * 
FROM customer 
WHERE store_id = 1
),
overdued_rental AS(
SELECT * 
FROM rental 
WHERE rental_date + interval 30 day < CURRENT_DATE() AND return_date is NULL
)
SELECT customer_1.customer_id, rental_id 
FROM customer_1, overdued_rental
WHERE customer_1.customer_id = overdued_rental.customer_id
)
SELECT customer_id, COUNT(rental_id) as overdued_count 
FROM customer_overdued
GROUP BY customer_id
),
customer_1_id AS(
SELECT *
FROM customer
WHERE store_id = 1
)
SELECT customer_1_id.customer_id, overdued_count
FROM customer_1_id LEFT JOIN customer_overdued_count
ON customer_1_id.customer_id = customer_overdued_count.customer_id
WHERE customer_1_id.customer_id < 100;