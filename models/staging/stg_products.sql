{{ config(materialized='view') }}

select
    product_id,
    upper(product_name) as product_name,
    upper(category) as category,
    supplier_id,
    cast(price as numeric(10,2)) as price
from {{ source('raw', 'products') }}
