WITH customer_stats AS(
SELECT c.customer_id, c.first_name,c.last_name,
       MAX(r.rental_date) AS last_rental_date,
	   AVG(p.amount) AS avg_spend
	FROM customer c 
	JOIN rental r ON c.customer_id = r.customer_id 
	JOIN payment p ON r.rental_id = p.rental_id
	GROUP BY c.customer_id, c.first_name, c.last_name
) 
SELECT * , ('2007-06-01'::date - last_rental_date::date) AS days_since_rental
FROM customer_stats 
WHERE('2007-06-01'::date - last_rental_date::date) > 30 
AND avg_spend > 4;