with source as (select * from {{ source("staging", "sale") }})

select cast(sale_id as int) as sale_id, sale_date, amount
from source
where sale_id is not null
