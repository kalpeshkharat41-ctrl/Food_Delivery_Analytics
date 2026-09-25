-- =============================================================================
-- BASIC QUESTIONS
-- =============================================================================
1. Find the total number of orders in the dataset.
SELECT COUNT(order_id) AS TOTAL_no_of_Orders
FROM food_delivery_analytics;

2. Find the average Order Value of all orders.
SELECT AVG(order_value)
FROM food_delivery_analytics;

3. Display the Order ID, City Tier, Order Value, and Final Amount Paid for orders where the Order Value is greater than ₹100.
SELECT order_id,city_tier,order_value,final_amount_paid
FROM food_delivery_analytics
WHERE order_value > 100;

4. Find the maximum Delivery Distance and minimum Delivery Distance.
SELECT MAX(delivery_distance_km) AS maximum_Delivery_Distance , MIN(delivery_distance_km) AS minimum_Delivery_Distance
FROM food_delivery_analytics;

5. Find the number of orders in each City Tier.
SELECT city_tier, COUNT(order_id) AS no_of_orders
FROM food_delivery_analytics
GROUP BY city_tier;

-- =============================================================================
-- MODERATE QUESTIONS
-- =============================================================================
1. Find the average Order Value for each City Tier, and display only tiers where the average is greater than ₹100.
SELECT city_tier, AVG(order_value) AS AVG_Order_Value
FROM food_delivery_analytics
GROUP BY city_tier
HAVING AVG(order_value) > 100;

2. Calculate the cancellation rate (%) for each City Tier using Cancellation Flag.
SELECT city_tier,AVG(CASE WHEN cancellation_flag IS TRUE THEN 1 ELSE 0 END) * 100 AS Cancellation_Rate_Percent
FROM food_delivery_analytics
GROUP BY city_tier;

3. Compare the average Final Amount Paid between Premium Customers and Non-Premium Customers.
SELECT AVG(final_amount_paid),CASE WHEN premium_customer_flag IS TRUE THEN 'Premium_Customer' ELSE 'Non_Premium_Customer' END AS Customer_type
FROM food_delivery_analytics
GROUP BY Customer_type;

4. Find the average Customer Rating for delayed and non-delayed orders using Delay Delivery Flag.
SELECT AVG(customer_rating) AS Average_Customer_Rating, CASE WHEN delayed_delivery_flag IS TRUE THEN 'delayed' ELSE 'non-delayed orders' END AS Delivery_status
FROM food_delivery_analytics
GROUP BY Delivery_status

5. Find the top 3 Order Hours with the highest number of orders.
SELECT order_hour,COUNT(order_id) AS No_of_Orders
FROM food_delivery_analytics
GROUP BY order_hour 
ORDER BY No_of_Orders DESC LIMIT 3;

-- =============================================================================
-- ADVANCED QUESTIONS
-- =============================================================================
1. Using a CTE, calculate the total orders, total revenue, cancellation rate, refund rate, and delay rate for each City Tier.
WITH CTE_food_delivery_analytics AS (SELECT city_tier, COUNT(order_id) AS Total_Orders, SUM(final_amount_paid) AS Total_Revenue, AVG(CASE WHEN cancellation_flag IS TRUE THEN 1 ELSE 0 END) * 100 AS Cancellation_Rate, AVG(CASE WHEN refund_flag IS TRUE THEN 1 ELSE 0 END) * 100 AS Refund_Rate, AVG(CASE WHEN delayed_delivery_flag IS TRUE THEN 1 ELSE 0 END) * 100 AS Delayed_Delivery_Rate  
FROM food_delivery_analytics
GROUP BY city_tier)
SELECT city_tier, Total_Orders, Total_Revenue, Cancellation_Rate, Refund_Rate, Delayed_Delivery_Rate
FROM CTE_food_delivery_analytics;

2. Using a window function, find the top 3 highest-value orders within each City Tier based on Final Amount Paid.
WITH ranked_orders AS (SELECT city_tier, final_amount_paid, RANK() OVER (PARTITION BY city_tier ORDER BY final_amount_paid DESC) AS rnk
FROM food_delivery_analytics)
SELECT city_tier, final_amount_paid
FROM ranked_orders
WHERE rnk <= 3;

3. Using LAG(), calculate the monthly revenue and difference in revenue compared with the previous month.
WITH monthly_revenue AS (SELECT order_month,
SUM(final_amount_paid) AS total_revenue
FROM food_delivery_analytics
GROUP BY order_month)
SELECT order_month, total_revenue,LAG(total_revenue, 1) OVER (ORDER BY order_month) AS prev_month_revenue,
total_revenue - LAG(total_revenue, 1) OVER (ORDER BY order_month) AS revenue_difference
FROM monthly_revenue
ORDER BY order_month;

4. Find the City Tier whose average Delivery Efficiency Score is higher than the overall average Delivery Efficiency Score using a subquery.
SELECT city_tier,AVG(delivery_efficiency_score) AS AVG_Delivery_Efficiency_Score
FROM food_delivery_analytics
GROUP BY city_tier
HAVING AVG(delivery_efficiency_score)
>(SELECT AVG(delivery_efficiency_score)
FROM food_delivery_analytics);

5. Create a customer spending category using CASE WHEN:
   - Below ₹150 → Low Spender
   - ₹150–₹200 → Medium Spender
   - Above ₹200 → High Spender
   Then calculate the number of orders and average Final Amount Paid for each category.
WITH categorized_orders AS (SELECT final_amount_paid,
CASE WHEN final_amount_paid < 150 THEN 'Low Spender'
     WHEN final_amount_paid BETWEEN 150 AND 200 THEN 'Medium Spender'
     ELSE 'High Spender' END AS spending_category
FROM food_delivery_analytics)
SELECT spending_category,
COUNT(*) AS total_orders,
AVG(final_amount_paid) AS avg_final_amount_paid
FROM categorized_orders
GROUP BY spending_category
ORDER BY avg_final_amount_paid;