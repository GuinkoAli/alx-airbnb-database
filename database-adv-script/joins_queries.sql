-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
ORDER BY b.start_date DESC;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date,
    u.user_id AS reviewer_id,
    u.first_name AS reviewer_first_name,
    u.last_name AS reviewer_last_name
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
LEFT JOIN users u ON r.user_id = u.user_id
ORDER BY p.name, r.created_at DESC;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id
ORDER BY u.user_id, b.start_date;
