WITH prolific_actor AS(
WITH actor_film_cnt AS(
SELECT actor_id, COUNT(film_id) as film_cnt
FROM film_actor
GROUP BY actor_id
)
SELECT actor_id
FROM actor_film_cnt
WHERE film_cnt > 30 
)
SELECT DISTINCT(film_id)
FROM film_actor JOIN prolific_actor
ON film_actor.actor_id = prolific_actor.actor_id;