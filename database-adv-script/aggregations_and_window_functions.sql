-- 1. Aggregation with GROUP BY: Bookings per user
-- "Count total bookings made by each user"
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    COUNT(b.booking_id) AS total_bookings,
    SUM(b.total_price) AS total_spent,
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email, u.role
ORDER BY total_bookings DESC;

-- 2. Window Function: Rank properties by number of bookings
-- "Rank properties based on total bookings received"
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number_rank,
    DENSE_RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS dense_rank_position
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location, p.price_per_night
ORDER BY total_bookings DESC;