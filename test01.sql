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
WHERE customer_1.customer_id = overdued_rental.customer_id;