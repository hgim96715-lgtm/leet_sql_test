# Write your MySQL query statement below
WITH row_id AS(
SELECT num,
ROW_NUMBER()OVER(ORDER BY id)-
ROW_NUMBER()OVER(PARTITION BY num ORDER BY id) AS row_num
FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM row_id
GROUP BY num,row_num
HAVING COUNT(*)>=3