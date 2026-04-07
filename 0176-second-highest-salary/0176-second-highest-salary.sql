# Write your MySQL query statement below
-- Write your PostgreSQL query statement below
WITH rnk_emp AS(
    SELECT salary,
    DENSE_RANK()OVER(ORDER BY salary DESC) AS rnk
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM rnk_emp
WHERE rnk=2