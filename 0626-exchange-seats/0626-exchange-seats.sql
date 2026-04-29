# Write your MySQL query statement below
WITH change_id AS(
    SELECT id,
CASE
    WHEN  id = (SELECT MAX(id) FROM Seat) AND id%2=1 THEN id
    WHEN id%2=1 THEN id+1
    ELSE  id-1
END AS id_change,
student
FROM Seat
)
SELECT id_change AS id,student
FROM change_id
ORDER BY id_change