SELECT 
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount,
    created AS created_at,
    _batched_at AS batched_at
FROM `dbt-tutorial`.stripe.payment