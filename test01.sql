WITH cat_store_numRent AS(
WITH cat_store_rental AS(
WITH inv_cat_store AS(
SELECT inventory_id, category_id, store_id
FROM inventory JOIN film_category
ON inventory.film_id = film_category.film_id
)
SELECT category_id, store_id, rental_id
FROM rental JOIN inv_cat_store
ON rental.inventory_id = inv_cat_store.inventory_id
)
SELECT category_id, store_id, COUNT(rental_id) as num_of_rental 
FROM cat_store_rental
GROUP BY category_id, store_id
)
SELECT *
FROM cat_store_numRent
WHERE num_of_rental > 500;
