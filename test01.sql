SELECT inventory_id, category_id, store_id
FROM inventory JOIN film_category
ON inventory.film_id = film_category.film_id;