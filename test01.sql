WITH film_prolific_actor AS(
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
ON film_actor.actor_id = prolific_actor.actor_id
),
film_betweenID_overRate AS(
SELECT film_id
FROM film 
WHERE film_id >= 10 AND film_id < 20 AND rental_rate > 4
)
SELECT film_betweenID_overRate.film_id
FROM film_betweenID_overRate JOIN film_prolific_actor
ON film_betweenID_overRate.film_id = film_prolific_actor.film_id;
