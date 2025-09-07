-- 1. Non-correlated subquery: Properties with average rating > 4.0
-- "Find all properties where the average rating is greater than 4.0"
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    (SELECT AVG(rating) FROM reviews WHERE property_id = p.property_id) AS average_rating
FROM properties p
WHERE (SELECT AVG(rating) FROM reviews WHERE property_id = p.property_id) > 4.0
ORDER BY average_rating DESC;

-- Alternative using HAVING with a subquery (shows only properties with reviews)
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    AVG(r.rating) AS average_rating
FROM properties p
INNER JOIN reviews r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location, p.price_per_night
HAVING AVG(r.rating) > 4.0
ORDER BY average_rating DESC;

-- 2. Correlated subquery: Users with more than 3 bookings
-- "Find users who have made more than 3 bookings"
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    (SELECT COUNT(*) FROM bookings WHERE user_id = u.user_id) AS total_bookings
FROM users u
WHERE (SELECT COUNT(*) FROM bookings WHERE user_id = u.user_id) > 3
ORDER BY total_bookings DESC;

-- Alternative using JOIN and GROUP BY 
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    COUNT(b.booking_id) AS total_bookings
FROM users u
INNER JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email, u.role
HAVING COUNT(b.booking_id) > 3
ORDER BY total_bookings DESC;