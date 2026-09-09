-- ============================================================
-- Olist E-commerce Analysis
-- SQL Analysis Queries
-- ============================================================


-- ============================================================
-- Query 1 — Top 10 categories by total revenue
-- ============================================================

SELECT category,
       CAST(ROUND(SUM(price), 0) AS INTEGER) AS total_revenue,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- Query 2 — Average ticket by category
-- ============================================================

SELECT category,
       CAST(ROUND(AVG(price), 0) AS INTEGER) AS avg_ticket,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY category
ORDER BY avg_ticket DESC
LIMIT 10;


-- ============================================================
-- Query 3 — Monthly revenue trend
-- ============================================================

SELECT strftime('%Y-%m',
                substr(purchase_date, 7, 4) || '-' ||
                substr(purchase_date, 4, 2) || '-' ||
                substr(purchase_date, 1, 2)) AS year_month,
       CAST(ROUND(SUM(price), 0) AS INTEGER) AS monthly_revenue,
       COUNT(order_id) AS monthly_orders
FROM orders
GROUP BY year_month
ORDER BY year_month;


-- ============================================================
-- Query 4 — Revenue growth: 2017 vs 2018 by category
-- ============================================================

SELECT category,
       CAST(ROUND(SUM(CASE
           WHEN year = '2017' THEN price ELSE 0
       END), 0) AS INTEGER) AS revenue_2017,

       CAST(ROUND(SUM(CASE
           WHEN year = '2018' THEN price ELSE 0
       END), 0) AS INTEGER) AS revenue_2018,

       CAST(ROUND(
           SUM(CASE WHEN year = '2018' THEN price ELSE 0 END) -
           SUM(CASE WHEN year = '2017' THEN price ELSE 0 END),
       0) AS INTEGER) AS growth

FROM (
    SELECT category,
           price,
           strftime('%Y',
               substr(purchase_date, 7, 4) || '-' ||
               substr(purchase_date, 4, 2) || '-' ||
               substr(purchase_date, 1, 2)
           ) AS year
    FROM orders
)
GROUP BY category
ORDER BY growth DESC;


-- ============================================================
-- Query 5 — Anomaly detection
-- Identifies orders with prices significantly above
-- the overall average.
-- ============================================================

SELECT order_id,
       category,
       price,
       CAST(ROUND(
           AVG(price) OVER (PARTITION BY category), 0
       ) AS INTEGER) AS avg_category_price,

       CAST(ROUND(
           price - AVG(price) OVER (PARTITION BY category), 0
       ) AS INTEGER) AS deviation

FROM orders
WHERE price > (SELECT AVG(price) * 3 FROM orders)
ORDER BY deviation DESC
LIMIT 20;
