{{
    config(materialized='ephemeral')
}}
select
cust.customer_id,
count(odr.order_id) as total_order,
sum(odr.total_amount) as total_sale,
avg(odr.total_amount) as avg_order_value,
max(odr.order_date) as last_order_date
from {{ ref('stg_customers') }} cust
join {{ ref('stg_orders') }} odr 
 on cust.customer_id = odr.customer_id
 group by cust.customer_id


