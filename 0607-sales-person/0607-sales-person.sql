# Write your MySQL query statement below
WITH c_o AS(
    SELECT o.com_id,o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id=c.com_id
    WHERE c.name = 'RED'
)
SELECT s.name AS name
FROM SalesPerson s
LEFT JOIN c_o o1 ON s.sales_id=o1.sales_id
WHERE o1.sales_id IS NULL