SELECT 
    order_id,
    customer_id,
    amount
FROM {{ ref('stg_jaffle_shop__orders') }}
INNER JOIN {{ ref('stg_stripe__payments') }} USING(order_id)