WITH film_inventoryCount AS(
SELECT film_id , COUNT(inventory_id) as inventory_cnt
FROM inventory 
GROUP BY film_id
)
SELECT AVG(inventory_cnt) as inventory_avg
FROM film_inventoryCount;