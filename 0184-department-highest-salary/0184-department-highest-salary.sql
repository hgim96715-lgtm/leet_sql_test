# Write your MySQL query statement below
WITH join_to AS(
    SELECT d.name AS Department,e.name AS Employee,e.salary AS Salary,
    RANK()OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS rnk
    FROM Department d
    JOIN Employee e ON d.id=e.departmentId
)
SELECT Department,Employee,Salary
FROM join_to
WHERE rnk=1;