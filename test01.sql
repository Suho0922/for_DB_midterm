SELECT film_id , COUNT(inventory_id)
FROM inventory 
GROUP BY film_id;