WITH film_store_cnt_less5 AS(
WITH film_store_cnt AS(
WITH film_store AS(
SELECT inventory.inventory_id, film_id, store_id 
FROM inventory JOIN rental 
WHERE inventory.inventory_id = rental.inventory_id
)
SELECT store_id, film_id , COUNT(inventory_id) as rent_ct
FROM film_store
GROUP BY store_id, film_id
)
SELECT * 
FROM film_store_cnt
WHERE rent_ct < 5
)
SELECT store_id , COUNT(rent_ct) as num_film
FROM film_store_cnt_less5
GROUP BY store_id

INTO OUTFILE '/var/lib/mysql-files/problem2.csv'
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';