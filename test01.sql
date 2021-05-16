WITH film_satisfied AS (
WITH film_moreThan_avgInv AS(
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
SELECT film_id
FROM film_inventoryCount2, avg_inventory
WHERE inventory_cnt > avg_inventory.inventory_avg
),
film_rent_moreThan AS(
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
WHERE rent_cnt >= 30
) 
SELECT film_moreThan_avgInv.film_id, rent_cnt
FROM film_moreThan_avgInv JOIN film_rent_moreThan
ON film_moreThan_avgInv.film_id = film_rent_moreThan.film_id
)
SELECT *
FROM film_satisfied 
ORDER BY film_id;