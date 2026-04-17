# Write your MySQL query statement below
WITH pre_check AS(
    SELECT player_id,event_date,
    MIN(event_date)OVER(PARTITION BY player_id) AS pre
    FROM Activity
)
SELECT
ROUND((
    COUNT(CASE WHEN event_date = DATE_ADD(pre, INTERVAL 1 DAY) THEN player_id END)*1.0
    /
    COUNT(DISTINCT player_id)
),2) AS fraction
FROM pre_check