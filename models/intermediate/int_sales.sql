select sale_id, sale_date, sum(amount) over (order by sale_date) as date_wise_total
from {{ ref("src_sale") }}
