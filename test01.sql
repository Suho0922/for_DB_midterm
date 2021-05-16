SELECT film_category.film_id, category_id, actor_id 
FROM film_category 
JOIN film_actor 
ON film_category.film_id = film_actor.film_id;