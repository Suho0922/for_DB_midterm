WITH avg_inventory AS(
WITH film_inventoryCount AS(
SELECT film_id , COUNT(inventory_id) as inventory_cnt
FROM inventory 
GROUP BY film_id
)
SELECT AVG(inventory_cnt) as inventory_avg
FROM film_inventoryCount
),
film_inventoryCount2 AS(
SELECT film_id , COUNT(inventory_id) as inventory_cnt
FROM inventory 
GROUP BY film_id
)
SELECT film_id, inventory_cnt
FROM film_inventoryCount2, avg_inventory
WHERE inventory_cnt > avg_inventory.inventory_avg;
