SELECT inventory.inventory_id, film_id, store_id 
FROM inventory JOIN rental 
WHERE invetory.inventory_id = rental.inventory_id;