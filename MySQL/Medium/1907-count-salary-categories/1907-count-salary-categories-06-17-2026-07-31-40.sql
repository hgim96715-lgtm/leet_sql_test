# Write your MySQL query statement below
-- Write your PostgreSQL query statement below
WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
account_cate AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income > 50000 THEN 'High Salary'
            ELSE 'Average Salary'
        END AS category
    FROM Accounts
),
account_count AS (
    SELECT category, COUNT(*) AS accounts_count
    FROM account_cate
    GROUP BY category
)

SELECT 
    c.category,
    COALESCE(ac.accounts_count, 0) AS accounts_count
FROM categories c
LEFT JOIN account_count ac
    ON c.category = ac.category;