{{ config(materialized='table') }}
with orders as (

    select *
    from {{ ref('raw_orders') }}

),

customer_sales as (

    select
        customer_id,
        count(order_id) as total_orders,
        sum(amount) as total_sales,
        avg(amount) as avg_order_value

    from orders
    group by customer_id

)

select *
from customer_sales