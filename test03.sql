WITH film_rent_cnt AS(
WITH film_rental AS(
SELECT film_id,rental_id
FROM rental JOIN inventory
ON rental.inventory_id = inventory.inventory_id
)
SELECT film_id, COUNT(rental_id) as rent_cnt
FROM film_rental
GROUP BY film_id
)
SELECT film_id, rent_cnt 
FROM film_rent_cnt
WHERE rent_cnt >= 30;
