SELECT country_id, address_id
FROM city JOIN address 
ON city.city_id = address.city_id;