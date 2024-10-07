{{ config (
   materialized = "table"
)}}
with payments as (
    select 
        id as payment_id,
        order_id,
        payment_method,
        status,
        amount,
        created 
    from {{source("stripe", "payment")}}  
)  
select * from payments
