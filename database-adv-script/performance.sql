-- Initial complex query: Retrieves all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    
    -- User details
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    
    -- Property details  
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.price_per_night,
    
    -- Payment details
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    
    -- Additional joins for context
    h.user_id AS host_id,
    h.first_name AS host_first_name,
    h.last_name AS host_last_name
    
FROM bookings b
-- Join with users table for guest information
INNER JOIN users u ON b.user_id = u.user_id
-- Join with properties table for property information  
INNER JOIN properties p ON b.property_id = p.property_id
-- Join with users again for host information
INNER JOIN users h ON p.host_id = h.user_id
-- Left join with payments table (not all bookings may have payments)
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;