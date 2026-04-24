# Write your MySQL query statement below
WITH three_peo AS(
    SELECT id, visit_date, people,
        id - ROW_NUMBER() OVER(ORDER BY id) AS peo_th
    FROM Stadium
    WHERE people >= 100
),
count_people AS(
    SELECT id, visit_date, people,
        COUNT(*) OVER(PARTITION BY peo_th) AS cnt_people
    FROM three_peo
)
SELECT id, visit_date, people
FROM count_people
WHERE cnt_people >= 3
ORDER BY visit_date; 