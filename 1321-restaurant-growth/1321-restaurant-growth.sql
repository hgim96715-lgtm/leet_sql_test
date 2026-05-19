# Write your MySQL query statement below
WITH cu_visit AS(
SELECT visited_on,SUM(amount) AS amount
FROM Customer
GROUP BY visited_on
),
 move_visit AS(
    SELECT 
visited_on,
SUM(amount) OVER(ORDER BY visited_on
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
LAG(visited_on,6)OVER(ORDER BY visited_on) AS start_date
FROM cu_visit
)
SELECT visited_on,amount,ROUND(amount/7.0,2)AS average_amount
FROM move_visit
WHERE start_date IS NOT NULL