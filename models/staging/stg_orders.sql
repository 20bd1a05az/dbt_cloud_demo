select
    o.order_id,
    o.customer_name,
    o.country_code,
    c.country_name
from {{ ref('orders') }} o
left join {{ ref('country_codes') }} c
on o.country_code = c.country_code