-- =============================================================================
-- DATA LOADING INSTRUCTION (PostgreSQL)
-- =============================================================================
-- Replace 'path/to/food_delivery_analytics.csv' with the absolute path to your CSV file.

COPY food_delivery_analytics(
    order_id,
    city_tier,
    customer_age,
    customer_loyalty_score,
    order_hour,
    order_day_of_week,
    order_month,
    delivery_distance_km,
    preparation_time_minutes,
    delivery_time_minutes,
    estimated_delivery_time,
    traffic_level_score,
    weather_severity_score,
    restaurant_rating,
    delivery_partner_rating,
    customer_rating,
    order_value,
    delivery_fee,
    discount_amount,
    tip_amount,
    final_amount_paid,
    number_of_items,
    cancellation_flag,
    delayed_delivery_flag,
    refund_flag,
    promo_code_used,
    premium_customer_flag,
    festival_or_weekend_flag,
    delivery_partner_experience_years,
    delivery_efficiency_score
)
FROM 'C:\Users\Lenovo\Downloads\DATASET'
DELIMITER ','
CSV HEADER;