
WITH inven_film AS (
SELECT inventory.film_id, title, inventory_id 
FROM inventory JOIN film
WHERE inventory.film_id = film.film_id
),
rent_date_between AS (
SELECT * 
FROM rental
WHERE unix_timestamp(rental_date) >= unix_timestamp('2005.06.01')
AND unix_timestamp(rental_date) <= unix_timestamp('2005.08.31')
)
SELECT *
FROM inven_film JOIN rent_date_between
WHERE inven_flim.inventory_id = rent_date_between.inventory_id;