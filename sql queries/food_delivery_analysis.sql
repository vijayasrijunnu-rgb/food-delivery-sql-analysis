USE food_delivery_analysis;

-- ============================================================
-- FOOD DELIVERY OPERATIONS & CUSTOMER ANALYTICS
-- Database: food_delivery_analysis
-- Tool: MySQL Workbench
-- ============================================================


-- ============================================================
-- 1. ORDER STATUS DISTRIBUTION
-- ============================================================

SELECT status,
       COUNT(*) AS order_count,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM food_delivery_analysis.orders_medium
GROUP BY status
ORDER BY percentage DESC;


-- ============================================================
-- 2. AVERAGE DELIVERY TIME FOR LATE ORDERS
-- ============================================================

SELECT ROUND(
           AVG(TIMESTAMPDIFF(MINUTE, order_time, delivery_time)),
           2
       ) AS avg_delivery_time_minutes
FROM food_delivery_analysis.orders_medium
WHERE status = 'Late';


-- ============================================================
-- 3. CUSTOMERS BY CITY
-- ============================================================

SELECT city,
       COUNT(*) AS customer_count
FROM food_delivery_analysis.customers_medium
GROUP BY city
ORDER BY customer_count DESC;


-- ============================================================
-- 4. AVERAGE RESTAURANT RATING BY CITY
-- ============================================================

SELECT city,
       ROUND(AVG(rating), 2) AS avg_rating
FROM food_delivery_analysis.restaurants
GROUP BY city
ORDER BY avg_rating DESC;


-- ============================================================
-- 5. ORDERS BY CITY
-- ============================================================

SELECT c.city,
       COUNT(o.order_id) AS order_count
FROM food_delivery_analysis.customers_medium c
JOIN food_delivery_analysis.orders_medium o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY order_count DESC;


-- ============================================================
-- 6. ORDERS BY RESTAURANT
-- ============================================================

SELECT r.restaurant_id,
       COUNT(o.order_id) AS order_count
FROM food_delivery_analysis.restaurants r
JOIN food_delivery_analysis.orders_medium o
    ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY order_count DESC;


-- ============================================================
-- 7. REVENUE BY RESTAURANT
-- ============================================================

SELECT o.restaurant_id,
       ROUND(SUM(oi.quantity * oi.price), 2) AS total_revenue
FROM food_delivery_analysis.orders_medium o
JOIN food_delivery_analysis.order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.restaurant_id
ORDER BY total_revenue DESC;


-- ============================================================
-- 8. REVENUE BY CUISINE
-- ============================================================

SELECT r.cuisine,
       ROUND(SUM(oi.quantity * oi.price), 2) AS total_revenue
FROM food_delivery_analysis.restaurants r
JOIN food_delivery_analysis.orders_medium o
    ON r.restaurant_id = o.restaurant_id
JOIN food_delivery_analysis.order_items oi
    ON o.order_id = oi.order_id
GROUP BY r.cuisine
ORDER BY total_revenue DESC;


-- ============================================================
-- 9. CUSTOMER ORDER FREQUENCY
-- ============================================================

SELECT customer_id,
       COUNT(order_id) AS order_count
FROM food_delivery_analysis.orders_medium
GROUP BY customer_id
ORDER BY order_count DESC;


-- ============================================================
-- 10. REPEAT CUSTOMER COUNT
-- ============================================================

SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM food_delivery_analysis.orders_medium
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) AS customer_orders;


-- ============================================================
-- 11. TOTAL REVENUE
-- ============================================================

SELECT ROUND(SUM(quantity * price), 2) AS total_revenue
FROM food_delivery_analysis.order_items;


-- ============================================================
-- 12. LATE ORDER RATE BY CITY
-- ============================================================

SELECT c.city,
       COUNT(CASE WHEN o.status = 'Late' THEN 1 END) AS late_orders,
       COUNT(o.order_id) AS total_orders,
       ROUND(
           COUNT(CASE WHEN o.status = 'Late' THEN 1 END)
           * 100.0 / COUNT(o.order_id),
           2
       ) AS late_percentage
FROM food_delivery_analysis.customers_medium c
JOIN food_delivery_analysis.orders_medium o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY late_percentage DESC;


-- ============================================================
-- 13. CANCELLATION RATE BY CITY
-- ============================================================

SELECT c.city,
       COUNT(CASE WHEN o.status = 'Cancelled' THEN 1 END) AS cancelled_orders,
       COUNT(o.order_id) AS total_orders,
       ROUND(
           COUNT(CASE WHEN o.status = 'Cancelled' THEN 1 END)
           * 100.0 / COUNT(o.order_id),
           2
       ) AS cancellation_percentage
FROM food_delivery_analysis.customers_medium c
JOIN food_delivery_analysis.orders_medium o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY cancellation_percentage DESC;


-- ============================================================
-- 14. AVERAGE RESTAURANT RATING BY CUISINE
-- ============================================================

SELECT cuisine,
       ROUND(AVG(rating), 2) AS avg_rating
FROM food_delivery_analysis.restaurants
GROUP BY cuisine
ORDER BY avg_rating DESC;


-- ============================================================
-- 15. HIGHEST-RATED RESTAURANT IN EACH CITY
-- Using ROW_NUMBER() and PARTITION BY
-- ============================================================

WITH ranked_restaurants AS (
    SELECT restaurant_id,
           city,
           cuisine,
           rating,
           ROW_NUMBER() OVER (
               PARTITION BY city
               ORDER BY rating DESC
           ) AS city_rank
    FROM food_delivery_analysis.restaurants
)
SELECT restaurant_id,
       city,
       cuisine,
       rating
FROM ranked_restaurants
WHERE city_rank = 1;


-- ============================================================
-- 16. TOP CUSTOMERS BY TOTAL SPENDING
-- ============================================================

SELECT o.customer_id,
       ROUND(SUM(oi.quantity * oi.price), 2) AS total_spent
FROM food_delivery_analysis.orders_medium o
JOIN food_delivery_analysis.order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- ============================================================
-- 17. RESTAURANTS WITH HIGHEST AVERAGE ORDER VALUE
-- ============================================================

SELECT o.restaurant_id,
       ROUND(
           SUM(oi.quantity * oi.price)
           / COUNT(DISTINCT o.order_id),
           2
       ) AS avg_order_value
FROM food_delivery_analysis.orders_medium o
JOIN food_delivery_analysis.order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.restaurant_id
ORDER BY avg_order_value DESC
LIMIT 10;