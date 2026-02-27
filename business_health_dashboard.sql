CREATE MATERIALIZED VIEW  mv_daily_bussiness_health AS
WITH daily_revenue AS (
       SELECT 
            SUM(CASE WHEN payment_date::date = '2007-05-14'THEN amount ELSE 0 END) as day_14_revenue,
            sum(case when payment_date::date = '2007-05-15' THEN amount ELSE 0 END) as day_15_revenue
            FROM payment
), 
staff_performance AS (
        SELECT s.first_name,s.last_name, SUM(p.amount) AS total_sales,
		DENSE_RANK() OVER(ORDER BY SUM(p.amount) DESC) AS sales_rank
		FROM staff s 
		JOIN payment p ON s.staff_id = p.staff_id 
		WHERE p.payment_date BETWEEN '2007-05-01' AND '2007-05-31'
		GROUP BY s.staff_id, s.first_name, s.last_name
) 
SELECT daily_revenue.* , sp.first_name ,sp.last_name, sp.total_sales AS staff_may_total,sp.sales_rank
FROM daily_revenue 
CROSS JOIN staff_performance sp 
WHERE sp.sales_rank = 1 

