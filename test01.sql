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
ON payment.rental_id = country_rental.rental_id;

