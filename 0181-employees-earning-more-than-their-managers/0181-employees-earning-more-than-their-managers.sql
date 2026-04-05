# Write your MySQL query statement below
SELECT e.name AS Employee
FROM Employee e
JOIN Employee c ON e.managerId = c.id
WHERE e.salary>c.salary