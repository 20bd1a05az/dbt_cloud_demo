{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
    order_id,
    customer_id,
    amount,
    order_date
from {{ ref('raw_orders') }}

{% if is_incremental() %}
where order_date > (select max(order_date) from {{ this }})
{% endif %}

-- The common incremental types are:

-- Append -> dbt only adds new rows. It does not update existing rows.

-- Merge -> This strategy updates existing rows and inserts new rows. faster than delete+insert

-- MERGE INTO orders t
-- USING new_data s
-- ON t.order_id = s.order_id
-- WHEN MATCHED THEN UPDATE SET amount = s.amount
-- WHEN NOT MATCHED THEN INSERT (order_id, amount)
-- VALUES (s.order_id, s.amount);

-- Delete + Insert -> Delete matching rows, Insert new rows - when merge is not supported

-- Insert Overwrite (mainly for partitioned tables) Instead of updating individual rows, the database replaces an entire partition with new data.


--dbt run full-refresh

