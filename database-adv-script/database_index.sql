-- Indexes for Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Indexes for Properties table  
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price_per_night ON properties(price_per_night);
CREATE INDEX idx_properties_created_at ON properties(created_at);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);

-- Indexes for Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);
CREATE INDEX idx_reviews_created_at ON reviews(created_at);

-- Indexes for Payments table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_payments_payment_date ON payments(payment_date);

-- Composite indexes for common query patterns
CREATE INDEX idx_properties_search ON properties(location, price_per_night, created_at);
CREATE INDEX idx_bookings_user_dates ON bookings(user_id, start_date, end_date);
CREATE INDEX idx_user_bookings_status ON bookings(user_id, status);
