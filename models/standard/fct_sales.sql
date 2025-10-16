{{
    config(materialized='incremental',
        unique_id='order_id')
}}

select
    o.order_id,
    o.order_date,
    o.customer_id,
    o.total_amount,   
    pay.payment_method,
    pay.payment_status
from {{ ref('stg_orders') }} o
left join {{ ref('stg_payments') }} pay on pay.order_id = o.order_id
{% if is_incremental() %}
where o.order_date > (select max(order_date) from {{ this}})
{% endif %}