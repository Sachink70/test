{{ config (
   materialized ="table"
)}}

with customer as(
  select * from raw.shop.customer
),
 customers AS (
    SELECT 
        id AS customer_id,
        first_name,
        last_name 
    FROM customer
)
select * from customers