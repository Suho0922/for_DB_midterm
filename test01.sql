WITH inv_cat_store AS(
SELECT inventory_id, category_id, store_id
FROM inventory JOIN film_category
ON inventory.film_id = film_category.film_id
)
SELECT category_id, store_id, rental_id
FROM rental JOIN inv_cat_store
ON rental.inventory_id = inv_cat_store.inventory_id;