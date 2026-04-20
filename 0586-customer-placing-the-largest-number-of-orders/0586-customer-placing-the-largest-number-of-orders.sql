# Write your MySQL query statement below
WITH cnt_num AS(
    SELECT COUNT(customer_number) AS cnt,
    customer_number
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM cnt_num
ORDER BY cnt DESC
LIMIT 1