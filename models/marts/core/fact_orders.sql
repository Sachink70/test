with orders as(
    select * from {{ ref('stg_ord') }}
),
payment as (
    select * from {{ ref('stg_payment') }}
),
 fact_orders as (
    select order_id,
    p.id as payment_id,
    sum(amount) as total_amount,
    from raw.shop.order_table o
    left join payment p on o.id = p.order_id
    group by order_id, payment_id
)
select * from fact_orders