{{ config (
   materialized ="table"
)}}
 with orders AS (
    SELECT 
        id AS order_id,
        user_id AS customer_id,
        order_date,
        status
    FROM {{ source('shop', 'order_table') }}
    )
select * from orders