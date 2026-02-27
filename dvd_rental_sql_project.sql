WITH dead_stock AS(

SELECT DISTINCT f.title, f.rental_rate, f.replacement_cost
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id 
WHERE r.rental_id IS NULL
)
SELECT SUM(replacement_cost) AS total_lost_capital
FROM dead_stock