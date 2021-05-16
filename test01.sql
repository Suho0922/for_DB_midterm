WITH f_c_count AS(
WITH f_c AS(
SELECT film_category.film_id, category_id, actor_id 
FROM film_category 
JOIN film_actor 
ON film_category.film_id = film_actor.film_id
)
SELECT f_c.actor_id, f_c.category_id, COUNT(film_id)
FROM f_c
GROUP BY f_c.actor_id, f_c.category_id
)
SELECT *
FROM f_c_count
WHERE COUNT(film_id)>5;