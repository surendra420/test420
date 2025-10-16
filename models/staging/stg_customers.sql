{{
    config(materialized='view')
}}

select
    customer_id,
    trim(first_name) || ' ' || trim(last_name) as full_name,
    lower(email) as email,
    upper(coutry) as country,
    cast(created_at as date) as created_at
from {{ source('raw','customer')}}