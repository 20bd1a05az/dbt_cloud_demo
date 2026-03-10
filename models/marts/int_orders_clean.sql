{{ config(materialized='ephemeral') }}

select
order_id,
customer_id,
amount
from {{ ref('raw_orders') }}
where amount > 200

--the ephemeral model becomes a CTE inside another query.
--Ephemeral models are temporary transformation steps that dbt injects as CTEs instead of creating tables in Snowflake.

-- Without ephemeral:

-- raw_orders
-- clean_orders
-- filtered_orders
-- customer_sales

-- 4 tables.

-- With ephemeral:

-- raw_orders
-- customer_sales

-- Only 2 tables, but same logic.