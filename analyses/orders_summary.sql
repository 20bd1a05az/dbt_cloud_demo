SELECT * 
FROM DBT_CLOUD.RAW_SCHEMA.ORDERS;SELECT
    status,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM DBT_CLOUD.RAW_SCHEMA.ORDERS
GROUP BY status
ORDER BY total_orders DESC;