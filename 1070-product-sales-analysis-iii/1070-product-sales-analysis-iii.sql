# Write your MySQL query statement below
WITH sales_cnt AS(
    SELECT product_id,year,
    RANK()OVER(PARTITION BY product_id ORDER BY year) AS year_nct,
    quantity,price
    FROM Sales
)
SELECT product_id,
year AS first_year,
quantity,
price
FROM sales_cnt
WHERE year_nct=1