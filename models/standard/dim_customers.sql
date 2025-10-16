{{ config(materialized='table') }}

select
    c.customer_id,
    c.full_name,
    c.country,
    m.total_order,
    m.total_sale,
    m.avg_order_value,
    m.last_order_date
from {{ ref('stg_customers') }} c
left join {{ ref('int_customer_metrics') }} m
 on c.customer_id = m.customer_id