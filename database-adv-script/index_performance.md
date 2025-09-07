# Database Index Performance Analysis

This document analyzes the performance impact of adding indexes to the AirBnB database.

## Index Strategy

### High-Usage Columns Identified

**Users Table:**
- `email`: Frequently used in WHERE clauses for authentication
- `role`: Used for filtering users by type (guest/host/admin)
- `created_at`: Used for analytics and reporting

**Properties Table:**
- `host_id`: Used in JOINs with users table
- `location`: Used in search queries
- `price_per_night`: Used in filtering and sorting
- `created_at`: Used for analytics

**Bookings Table:**
- `user_id`: Used in JOINs with users table
- `property_id`: Used in JOINs with properties table
- `status`: Used for filtering bookings
- `start_date/end_date`: Used for availability checks and reporting

## Performance Measurement

### Test Query 1: User Authentication
```sql
-- Before indexing
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'john.doe@email.com';

-- After indexing  
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'john.doe@email.com';