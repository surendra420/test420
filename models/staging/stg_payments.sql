{{ config(materialized='view') }}

select
    transaction_id,
    order_id,
    upper(payment_method) as payment_method,
    upper(payment_status) as payment_status,
    cast(payment_amount as numeric(12,2)) as payment_amount,
    cast(payment_date as date) as payment_date
from {{ source('raw', 'transaction') }}