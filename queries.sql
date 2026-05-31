-- Restaurant Sales Analysis
-- Independent Operations & Supply Chain Analysis
-- All queries run in Google BigQuery

-- ============================================
-- STEP 1: Create clean table (remove extra columns)
-- ============================================
CREATE TABLE restaurant_data.sales_clean AS
SELECT
  order_id,
  date,
  season,
  day_of_week,
  seat_type,
  meal_period,
  item_name,
  category,
  price,
  quantity,
  revenue,
  year_period
FROM restaurant_data.sales_data;

-- ============================================
-- STEP 2: Fix duplicate category names
-- ============================================
UPDATE restaurant_data.sales_clean
SET category = 'Appetizers'
WHERE category = 'Appetizer';

-- ============================================
-- STEP 3: Verify total rows and revenue
-- ============================================
SELECT 
  COUNT(*) as total_rows,
  ROUND(SUM(revenue), 2) as total_revenue
FROM restaurant_data.sales_clean;

-- ============================================
-- STEP 4: Revenue by year period
-- ============================================
SELECT
  year_period,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders
FROM restaurant_data.sales_clean
GROUP BY year_period
ORDER BY year_period;

-- ============================================
-- STEP 5: Revenue by year period and seat type
-- ============================================
SELECT
  year_period,
  seat_type,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders
FROM restaurant_data.sales_clean
GROUP BY year_period, seat_type
ORDER BY year_period, seat_type;

-- ============================================
-- STEP 6: Revenue by category
-- ============================================
SELECT
  category,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders,
  ROUND(AVG(revenue), 2) as avg_order_value
FROM restaurant_data.sales_clean
GROUP BY category
ORDER BY total_revenue DESC;

-- ============================================
-- STEP 7: Revenue by season
-- ============================================
SELECT
  season,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders,
  ROUND(AVG(revenue), 2) as avg_order_value
FROM restaurant_data.sales_clean
GROUP BY season
ORDER BY total_revenue DESC;

-- ============================================
-- STEP 8: Revenue by day of week
-- ============================================
SELECT
  day_of_week,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders,
  ROUND(AVG(revenue), 2) as avg_order_value
FROM restaurant_data.sales_clean
GROUP BY day_of_week
ORDER BY total_revenue DESC;

-- ============================================
-- STEP 9: Seasonal item performance
-- ============================================
SELECT
  season,
  category,
  item_name,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders
FROM restaurant_data.sales_clean
GROUP BY season, category, item_name
ORDER BY season, total_revenue DESC;

-- ============================================
-- STEP 10: Monthly revenue trend
-- ============================================
SELECT
  FORMAT_DATE('%Y-%m', date) as year_month,
  year_period,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders
FROM restaurant_data.sales_clean
GROUP BY year_month, year_period
ORDER BY year_month;

-- ============================================
-- STEP 11: Top 10 items by revenue
-- ============================================
SELECT
  item_name,
  category,
  ROUND(SUM(revenue), 2) as total_revenue,
  COUNT(DISTINCT order_id) as total_orders
FROM restaurant_data.sales_clean
GROUP BY item_name, category
ORDER BY total_revenue DESC
LIMIT 10;
