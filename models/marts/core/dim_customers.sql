with customers as(
    select *  from {{ ref('stg_cust') }}
),
orders as(
    select * from {{ ref('stg_ord') }}
),
 customer_orders AS (
   SELECT 
       o.customer_id,  
       MIN(o.order_date) AS first_order_date,
       MAX(o.order_date) AS most_recent_order_date,
       COUNT(o.order_id) AS number_of_orders
   FROM orders o
   JOIN customers c ON o.customer_id = c.customer_id
   GROUP BY o.customer_id
),
final AS (
   SELECT 
       c.customer_id,
       c.first_name,
       c.last_name,
       co.first_order_date,
       co.most_recent_order_date,
       COALESCE(co.number_of_orders, 0) AS number_of_orders
   FROM customers c
   LEFT JOIN customer_orders co ON c.customer_id = co.customer_id
)

SELECT 
   customer_id,
   first_name,
   last_name,
   first_order_date,
   most_recent_order_date,
   number_of_orders
FROM final
ORDER BY customer_id
