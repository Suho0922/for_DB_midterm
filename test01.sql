WITH country_category_actor_totalPayment AS(
WITH country_category_film_totalPayment
WITH country_category_film_totalPayment AS(
WITH country_category_film_amount AS(
WITH country_category_film_rental AS(
WITH country_category_film_inv AS(
WITH country_store AS(
WITH country_address AS(
SELECT country_id, address_id
FROM city JOIN address 
ON city.city_id = address.city_id
)
SELECT country_id, store_id 
FROM store JOIN country_address
ON store.address_id = country_address.address_id
),
inv_cat_store_film AS(
SELECT inventory_id, category_id, store_id, inventory.film_id
FROM inventory JOIN film_category
ON inventory.film_id = film_category.film_id
)
SELECT country_id, category_id, film_id, inventory_id
FROM country_store JOIN inv_cat_store_film 
ON country_store.store_id = inv_cat_store_film.store_id
)
SELECT country_id, category_id, film_id, rental_id
FROM rental JOIN country_category_film_inv 
ON rental.inventory_id = country_category_film_inv.inventory_id
)
SELECT country_id, category_id, film_id, amount
FROM payment JOIN country_category_film_rental
ON payment.rental_id = country_category_film_rental.rental_id
)
SELECT country_id, category_id, film_id , SUM(amount) as total_payment_of_film
FROM country_category_film_amount
GROUP BY country_id, category_id, film_id
)
SELECT country_id, category_id, actor_id, total_payment_of_film
FROM film_actor JOIN country_category_film_totalPayment
ON film_actor.film_id = country_category_film_totalPayment.film_id 
)
SELECT category_id, country_id, actor_id, SUM(total_payment_of_film) as total_payment_of_actor
FROM country_category_actor_totalPayment
GROUP BY category_id, country_id, actor_id;
