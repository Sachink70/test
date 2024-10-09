with orders as(
    select * from {{ ref('stg_ord') }}
),
payment as (
    select * from {{ ref('stg_payment') }}
),
fact_orders as (
    select 
        o.id as order_id,               -- Assuming this is the correct column in 'orders'
        p.id as payment_id,             -- If 'p.id' is incorrect, replace with the correct column
        sum(p.amount) as total_amount   -- Ensure 'amount' is in 'payment'
    from raw.shop.order_table o         -- Assuming 'order_table' has 'id' column
    left join raw.stripe.payment p on o.id = p.order_id  -- Join on the correct keys
    group by o.id, p.id
)
select * from fact_orders
