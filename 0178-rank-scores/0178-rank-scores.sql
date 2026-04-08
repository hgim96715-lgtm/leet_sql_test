# Write your MySQL query statement below
SELECT  CAST(score AS FLOAT) AS score,
DENSE_RANK()OVER(ORDER BY score DESC) AS `rank`
FROM Scores