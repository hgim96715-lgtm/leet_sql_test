CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    WITH rnk_salary AS (
    SELECT DISTINCT salary,
    DENSE_RANK()OVER(ORDER BY salary DESC) AS rnk
    FROM Employee 
    )
    SELECT salary
    FROM rnk_salary
    WHERE rnk=N
  );
END