# Table Partitioning Performance Report

## Implementation Overview

Partitioned the `bookings` table by `start_date` column using range partitioning. Created yearly partitions for 2023, 2024, and 2025 with a default partition for other dates.

## Performance Testing

### Test Query 1: Fetch bookings for a specific date range
```sql
-- Query to test
EXPLAIN ANALYZE 
SELECT * FROM bookings 
WHERE start_date BETWEEN '2023-07-01' AND '2023-07-31';