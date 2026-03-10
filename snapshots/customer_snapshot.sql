{% snapshot customer_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select
    customer_id,
    city,
    updated_at
from {{ source('sales', 'customers') }}

{% endsnapshot %}




-- {% snapshot customer_snapshot %}

-- {{
--     config(
--       target_schema='snapshots',
--       unique_key='customer_id',
--       strategy='check',
--       check_cols=['city']
--     )
-- }}

-- select
--     customer_id,
--     city
-- from {{ source('sales', 'customers') }}

-- {% endsnapshot %}