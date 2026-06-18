# Write your MySQL query statement below
WITH cnt AS (
SELECT employee_id, department_id,
COUNT(department_id)OVER(PARTITION BY employee_id) AS department_id_cnt,
primary_flag
FROM Employee
)
SELECT employee_id,department_id
FROM cnt
WHERE primary_flag='Y' OR department_id_cnt=1;