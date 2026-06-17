-- Write your PostgreSQL query statement below
SELECT
    s.user_id,
    ROUND(
        COALESCE(
            COUNT(*) FILTER (WHERE c.action = 'confirmed')::numeric
            / NULLIF(COUNT(c.user_id), 0),
            0
        ),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;