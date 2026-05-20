# Write your MySQL query statement below
WITH sum_po AS(
SELECT p.product_name,o.unit,
SUM(o.unit)OVER(PARTITION BY p.product_name) AS SUM_unit
FROM Products p
JOIN Orders o ON p.product_id=o.product_id AND o.order_date<'2020-03-01' AND o.order_date>='2020-02-01'
)
SELECT DISTINCT product_name,SUM_unit AS unit
FROM sum_po
WHERE SUM_unit >= 100