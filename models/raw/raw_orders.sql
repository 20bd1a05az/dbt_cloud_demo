with source_data as (

    select
        order_id,
        customer_id,
        order_date,
        amount

    from {{ source('raw_source','orders') }}

)

select *
from source_data