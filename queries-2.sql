
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    COUNT(od.order_detail_id) AS detail_records,
    COALESCE(
        SUM(od.quantity * od.unit_price), 0
    ) AS order_revenue
FROM sales_analysis.orders o
LEFT JOIN sales_analysis.order_details od
    ON o.order_id = od.order_id
GROUP BY
    o.order_id,
    o.order_date,
    o.order_status
ORDER BY o.order_id;
