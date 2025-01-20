WITH grouped_payments AS (
    SELECT
        order_id,
        SUM(CASE WHEN status = 'success' THEN amount ELSE NULL END) AS amount,
    FROM {{ ref('stg_stripe__payments') }}
    GROUP BY order_id
)

SELECT 
    order_id,
    customer_id,
    amount
FROM {{ ref('stg_jaffle_shop__orders') }}
INNER JOIN grouped_payments USING(order_id)