WITH film_store_cnt AS(
WITH film_store AS(
SELECT inventory.inventory_id, film_id, store_id 
FROM inventory JOIN rental 
WHERE inventory.inventory_id = rental.inventory_id
)
SELECT store_id, film_id , COUNT(inventory_id) as retent_ct
FROM film_store
GROUP BY store_id, film_id
)
SELECT * 
FROM film_store_cnt;