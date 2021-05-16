SELECT * 
FROM inventory JOIN film
WHERE inventory.film_id = film.film_id;