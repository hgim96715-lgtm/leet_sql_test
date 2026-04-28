# Write your MySQL query statement below 
WITH cnt_num AS (
    SELECT num
    FROM MYNumbers
    GROUP BY num
    HAVING COUNT(*)=1
)
SELECT MAX(num) AS num
FROM cnt_num