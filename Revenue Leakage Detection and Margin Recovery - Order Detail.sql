use unit_economics_db;
SELECT 
    o.order_id,
    p.product_name,
    p.category,
    ROUND((o.sale_price - o.discount_amount), 2) AS net_revenue,
    ROUND((p.cogs + o.shipping_cost), 2) AS total_variable_cost,
    -- Calculation for the REAL profit
    ROUND(((o.sale_price - o.discount_amount) - (p.cogs + o.shipping_cost)), 2) AS contribution_margin
FROM orders o
JOIN products p ON o.product_id = p.product_id
ORDER BY contribution_margin ASC;