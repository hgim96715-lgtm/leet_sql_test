# Write your MySQL query statement below
WITH last_temp AS(
    SELECT id,temperature,recordDate,
    LAG(temperature,1) OVER(ORDER BY recordDate) AS lag_temp,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
)

SELECT id
FROM last_temp
WHERE temperature>lag_temp AND DATEDIFF(recordDate,prev_date) = 1