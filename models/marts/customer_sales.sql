select
customer_id,
sum(amount) as total_sales
from {{ ref('int_orders_clean') }}
group by customer_id