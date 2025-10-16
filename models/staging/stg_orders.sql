{{
    config(materialized='view')
}}

select
    order_id,
    customer_id,
    cast(order_date as date) as order_date,
    upper(status) as order_status,
    cast(total_amount as numeric(12,2)) as total_amount
from {{ source('raw','orders')}}