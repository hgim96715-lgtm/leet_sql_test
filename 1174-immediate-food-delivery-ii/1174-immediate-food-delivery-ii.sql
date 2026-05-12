# Write your MySQL query statement below
WITH ranked AS (
    SELECT
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS rn
    FROM Delivery
)
SELECT
    ROUND(
        SUM(order_date = customer_pref_delivery_date) * 100.0 / COUNT(*),
        2
    ) AS immediate_percentage
FROM ranked
WHERE rn = 1;