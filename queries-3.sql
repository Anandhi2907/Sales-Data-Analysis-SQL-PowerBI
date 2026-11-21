
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT
        CASE WHEN od.order_detail_id IS NOT NULL
        THEN o.order_id END
    ) AS orders_with_details,
    COUNT(DISTINCT
        CASE WHEN od.order_detail_id IS NULL
        THEN o.order_id END
    ) AS orders_without_details,
    COALESCE(
        SUM(od.quantity * od.unit_price), 0
    ) AS monthly_revenue
FROM sales_analysis.orders o
LEFT JOIN sales_analysis.order_details od
    ON o.order_id = od.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;
