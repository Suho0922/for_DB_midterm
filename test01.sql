WITH catName_store_numRent_moreThan500 AS(
WITH cat_store_numRent_moreThan500 AS(
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
WHERE num_of_rental > 500
)
SELECT store_id, name, num_of_rental
FROM category JOIN cat_store_numRent_moreThan500
ON category.category_id = cat_store_numRent_moreThan500.category_id
)
SELECT *
FROM catName_store_numRent_moreThan500
ORDER BY store_id, num_of_rental DESC;