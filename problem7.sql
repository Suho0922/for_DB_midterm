WITH country_statisfied AS(
WITH country_totalPayment AS(
WITH country_payment_amount AS(
WITH country_rental AS(
WITH country_inventory AS(
WITH country_store AS(
WITH country_address AS(
SELECT country_id, address_id
FROM city JOIN address 
ON city.city_id = address.city_id
)
SELECT country_id, store_id 
FROM store JOIN country_address
ON store.address_id = country_address.address_id
)
SELECT country_id, inventory_id
FROM inventory JOIN country_store
ON inventory.store_id = country_store.store_id
)
SELECT rental_id, country_id
FROM rental JOIN country_inventory
ON rental.inventory_id = country_inventory.inventory_id
)
SELECT country_id, amount
FROM payment JOIN country_rental 
ON payment.rental_id = country_rental.rental_id
)
SELECT country_id, SUM(amount) as total_payment
FROM country_payment_amount
GROUP BY country_id
),
country_storeNum AS(
WITH country_store AS(
WITH country_address AS(
SELECT country_id, address_id
FROM city JOIN address 
ON city.city_id = address.city_id
)
SELECT country_id, store_id 
FROM store JOIN country_address
ON store.address_id = country_address.address_id
)
SELECT country_id, COUNT(store_id) as num_of_store
FROM country_store
GROUP BY country_id
)
SELECT country_totalPayment.country_id, num_of_store, total_payment 
FROM country_totalPayment JOIN country_storeNum
ON country_totalPayment.country_id = country_storeNum.country_id
)
SELECT country, num_of_store, total_payment
FROM country_statisfied JOIN country
ON country_statisfied.country_id = country.country_id

INTO OUTFILE '/var/lib/mysql-files/problem7.csv'
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';




