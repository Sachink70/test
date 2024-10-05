{{ config (
   materialized ="table"
)}}

with payment as (
    select * from raw.shop.payment
),
 payment as(
select id as payment_id,
order_id,
payment_method,
status,
amount,
created 
from raw.shop.payment
)
select * from payment