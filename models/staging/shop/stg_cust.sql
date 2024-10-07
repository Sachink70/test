{{ config (
   materialized ="table"
)}}
 with customers AS (
    SELECT 
        id AS customer_id,
        first_name,
        last_name 
    FROM {{ source('shop', 'customer') }}
)
select * from customers