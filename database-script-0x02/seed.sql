-- seed.sql
-- Insert sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- Password hashes are just examples - in real life, these would be bcrypt hashes
('11111111-1111-1111-1111-111111111111', 'John', 'Doe', 'john.doe@email.com', '$2a$10$fakehashforjohn', '+1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Jane', 'Smith', 'jane.smith@email.com', '$2a$10$fakehashforjane', '+1987654321', 'host'),
('33333333-3333-3333-3333-333333333333', 'Bob', 'Johnson', 'bob.johnson@email.com', '$2a$10$fakehashforbob', '+1122334455', 'host'),
('44444444-4444-4444-4444-444444444444', 'Admin', 'User', 'admin@airbnb.com', '$2a$10$fakehashforadmin', '+1555666777', 'admin');

-- Insert sample properties
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 
 'Cozy Beach House', 'A beautiful beachfront property with amazing ocean views', 'Miami Beach, FL', 150.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', 
 'Mountain Cabin', 'A quiet retreat in the mountains with hiking trails', 'Aspen, CO', 200.00),
('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 
 'City Apartment', 'Modern apartment in the heart of the city', 'New York, NY', 120.00);

 -- Insert sample bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('dddddddd-dddd-dddd-dddd-dddddddddddd', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 
 '11111111-1111-1111-1111-111111111111', '2023-07-01', '2023-07-05', 600.00, 'confirmed'),
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 
 '11111111-1111-1111-1111-111111111111', '2023-08-10', '2023-08-15', 1000.00, 'pending');

 -- Insert sample payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
('ffffffff-ffff-ffff-ffff-ffffffffffff', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 
 600.00, 'credit_card');

 -- Insert sample reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
('gggggggg-gggg-gggg-gggg-gggggggggggg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 
 '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! The view was even better than in the photos.');

 -- Insert sample messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
('hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', '11111111-1111-1111-1111-111111111111', 
 '22222222-2222-2222-2222-222222222222', 'Hi Jane, is the beach house available in July?'),
('iiiiiiii-iiii-iiii-iiii-iiiiiiiiiiii', '22222222-2222-2222-2222-222222222222', 
 '11111111-1111-1111-1111-111111111111', 'Yes, it is available! Would you like to book it?');

 