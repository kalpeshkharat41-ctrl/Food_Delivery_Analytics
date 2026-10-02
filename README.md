🍔 Food Delivery Analytics — SQL Analysis
📌 Project Overview

This project focuses on analyzing a Food Delivery Analytics dataset using SQL to understand order patterns, customer spending, delivery performance, revenue, cancellations, refunds, and delays.

The SQL analysis is organized into Basic, Moderate, and Advanced levels to demonstrate practical SQL skills and analytical thinking.

📊 Dataset Overview

The dataset contains food delivery order-level information covering customer behavior, order details, delivery performance, payments, discounts, ratings, and order outcomes.

Key Data Attributes
Attribute	Description
Order_ID	Unique identifier for each order
City_Tier	City classification/tier
Customer_Age	Age of the customer
Customer_Loyalty_Score	Customer loyalty score
Order_Hour	Hour at which the order was placed
Order_Day_of_Week	Day of the week of the order
Order_Month	Month of the order
Delivery_Distance_KM	Distance covered for delivery
Preparation_Time_Minutes	Restaurant preparation time
Estimated_Delivery_Time	Estimated delivery time
Delivery_Efficiency_Score	Delivery performance score
Traffic_Level_Score	Traffic severity score
Weather_Severity_Score	Weather severity score
Restaurant_Rating	Restaurant rating
Delivery_Partner_Rating	Delivery partner rating
Customer_Rating	Rating provided by the customer
Order_Value	Original order value
Delivery_Fees	Delivery charges
Discount_Amount	Discount applied to the order
Tip_Amount	Tip provided by the customer
Final_Amount_Paid	Final amount paid by the customer
No_of_Items	Number of items in the order
Cancellation_Flag	Indicates whether the order was cancelled
Delay_Delivery_Flag	Indicates whether the order was delayed
Refund_Flag	Indicates whether a refund was issued
Premium_Customer_Flag	Indicates premium customer status
Promo_Code_Use	Indicates promotional code usage
Festival_or_Holiday	Indicates whether the order occurred during a festival/holiday
🎯 Project Objectives

The analysis aims to answer key business questions related to:

Order volume
Average order value
City-tier performance
Cancellation rates
Customer spending
Premium vs non-premium customers
Delivery delays
Customer ratings
Revenue trends
Refund rates
Delivery efficiency
High-value orders
Customer spending categories
🟢 Basic SQL Analysis

The Basic section focuses on fundamental SQL operations and aggregations.

Questions Covered
Find the total number of orders.
Calculate the average Order Value.
Find orders where Order Value is greater than ₹100.
Find the maximum and minimum delivery distance.
Calculate the number of orders in each City Tier.
SQL Concepts Used
SELECT
WHERE
GROUP BY
COUNT()
AVG()
MAX()
MIN()
🟡 Moderate SQL Analysis

The Moderate section focuses on grouped analysis and conditional calculations.

Questions Covered
1. Average Order Value by City Tier

Identifies City Tiers where the average Order Value exceeds ₹100.

2. Cancellation Rate by City Tier

Calculates the cancellation percentage for each City Tier using the Cancellation_Flag.

3. Premium vs Non-Premium Customers

Compares the average Final Amount Paid between premium and non-premium customers.

4. Customer Rating by Delivery Status

Compares average Customer Rating between delayed and non-delayed orders.

5. Top 3 Order Hours

Identifies the three hours with the highest number of orders.

SQL Concepts Used
GROUP BY
HAVING
ORDER BY
LIMIT
AVG()
COUNT()
CASE WHEN
Conditional Aggregation
🔴 Advanced SQL Analysis

The Advanced section demonstrates more complex SQL techniques used in analytical scenarios.

1. City Tier Performance Using CTE

A Common Table Expression (CTE) is used to calculate:

Total Orders
Total Revenue
Cancellation Rate
Refund Rate
Delayed Delivery Rate

for each City Tier.

Concepts Used
CTE
WITH
SUM()
COUNT()
AVG()
CASE WHEN
GROUP BY
2. Top 3 Highest-Value Orders by City Tier

A window function is used to rank orders within each City Tier based on Final_Amount_Paid.

The analysis identifies the top 3 highest-value orders for each City Tier.

Concepts Used
RANK()
OVER()
PARTITION BY
ORDER BY
CTE
3. Monthly Revenue Analysis Using LAG()

Monthly revenue is calculated and compared with the previous month's revenue.

The analysis provides:

Current Month Revenue
Previous Month Revenue
Revenue Difference
Concepts Used
LAG()
Window Function
CTE
SUM()
GROUP BY
ORDER BY
4. Delivery Efficiency Compared with Overall Average

A subquery is used to compare the average Delivery Efficiency Score of each City Tier against the overall average Delivery Efficiency Score.

This identifies City Tiers whose average delivery efficiency is above the dataset-wide average.

Concepts Used
Subquery
AVG()
GROUP BY
HAVING
5. Customer Spending Categories

Orders are classified into three spending categories based on Final_Amount_Paid:

Final Amount Paid	Category
Below ₹150	Low Spender
₹150–₹200	Medium Spender
Above ₹200	High Spender

For each category, the analysis calculates:

Total Number of Orders
Average Final Amount Paid
Concepts Used
CASE WHEN
CTE
COUNT()
AVG()
GROUP BY
ORDER BY
🧠 SQL Skills Demonstrated

This project demonstrates practical knowledge of:

Basic SQL
SELECT
WHERE
COUNT()
AVG()
MIN()
MAX()
Intermediate SQL
GROUP BY
HAVING
ORDER BY
LIMIT
CASE WHEN
Conditional aggregation
Advanced SQL
CTEs
Window functions
RANK()
LAG()
PARTITION BY
Subqueries
Revenue analysis
Percentage calculations
Customer segmentation
📈 Key Business Metrics
Metric	Purpose
Total Orders	Measures overall order volume
Average Order Value	Measures typical order size
Total Revenue	Measures revenue generated
Cancellation Rate	Measures order cancellations
Refund Rate	Measures refunded orders
Delay Rate	Measures delivery delays
Customer Rating	Measures customer satisfaction
Delivery Efficiency Score	Measures delivery performance
Average Final Amount Paid	Measures customer spending
Monthly Revenue Difference	Tracks revenue changes over time
💼 Business Questions Answered

This project demonstrates how SQL can be used to answer questions such as:

Which City Tier has the highest order volume?
Where is the average Order Value above ₹100?
How does cancellation rate vary by City Tier?
How do premium and non-premium customers differ in spending?
What order hours have the highest demand?
Which City Tier generates the most revenue?
What is the refund and delivery-delay rate by City Tier?
What are the highest-value orders within each City Tier?
How does monthly revenue change over time?
Which City Tiers have above-average delivery efficiency?
How are customers distributed across spending categories?

📂 Project Structure
Food-Delivery-SQL-Analysis/
│
├── schema.sql        # DDL: Food delivery analytics table creation
├── data.sql          # DML: Food delivery dataset insertion
├── queries.sql       # Basic, Moderate, and Advanced SQL analysis
└── README.md         # Project documentation