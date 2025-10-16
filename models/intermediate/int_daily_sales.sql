{{ config(materialized='ephemeral') }}

select
    o.order_date,
    sum(o.total_amount) as total_sales,
    count(distinct o.order_id) as total_orders
from {{ ref('stg_orders') }} o
where o.order_status = 'COMPLETED'
group by o.order_date