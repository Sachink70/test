{{ config (
   materialized ="table"
)}}
with order_table as (
    select * from raw.shop.order_table
),
 orders AS (
    SELECT 
        id AS order_id,
        user_id AS customer_id,
        order_date,
        status
    FROM order_table
    )
select * from orders