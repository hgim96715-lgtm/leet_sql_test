WITH join_two AS (
    SELECT 
        t.status, 
        t.request_at
    FROM Trips t
    JOIN Users u1 ON t.client_id = u1.users_id AND u1.banned = 'No'
    JOIN Users u2 ON t.driver_id = u2.users_id AND u2.banned = 'No'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT 
    request_at AS Day,
    ROUND(
       SUM(status != 'completed') / COUNT(*),
        2
    ) AS "Cancellation Rate"
FROM join_two
GROUP BY request_at;