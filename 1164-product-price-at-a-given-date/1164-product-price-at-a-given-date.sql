WITH ranked AS(
    SELECT product_id,
    new_price,
    ROW_NUMBER()OVER(
        PARTITION BY product_id
        ORDER BY change_date DESC
    ) AS rn
    FROM Products
    WHERE change_date <='2019-08-16'
),
all_products AS(
    SELECT DISTINCT product_id
    FROM Products
)

SELECT a.product_id,
IFNULL(r.new_price,10) AS price
FROM all_products a 
LEFT JOIN ranked r
ON a.product_id=r.product_id
AND r.rn=1;