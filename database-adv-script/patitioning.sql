

-- 1. Create a new partitioned table structure
CREATE TABLE bookings_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for different time periods
-- Partition for 2023 bookings
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Partition for 2024 bookings  
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partition for 2025 bookings
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Default partition for any other dates
CREATE TABLE bookings_default PARTITION OF bookings_partitioned
    DEFAULT;

-- 3. Create indexes on the partitioned table
CREATE INDEX idx_bookings_partitioned_start_date ON bookings_partitioned(start_date);
CREATE INDEX idx_bookings_partitioned_user_id ON bookings_partitioned(user_id);
CREATE INDEX idx_bookings_partitioned_property_id ON bookings_partitioned(property_id);
CREATE INDEX idx_bookings_partitioned_status ON bookings_partitioned(status);

-- 4. Copy data from original table to partitioned table
INSERT INTO bookings_partitioned 
SELECT * FROM bookings;

-- 5. Optional: Replace the original table
-- First, rename the original table as backup
ALTER TABLE bookings RENAME TO bookings_old;

-- Then rename the partitioned table to take its place
ALTER TABLE bookings_partitioned RENAME TO bookings;

-- 6. Create a function to automatically create new partitions
CREATE OR REPLACE FUNCTION create_booking_partition()
RETURNS TRIGGER AS $$
DECLARE
    partition_name TEXT;
    partition_start DATE;
    partition_end DATE;
BEGIN
    partition_start := DATE_TRUNC('year', NEW.start_date);
    partition_end := partition_start + INTERVAL '1 year';
    partition_name := 'bookings_' || EXTRACT(YEAR FROM NEW.start_date);
    
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables 
        WHERE tablename = partition_name
    ) THEN
        EXECUTE format(
            'CREATE TABLE %I PARTITION OF bookings FOR VALUES FROM (%L) TO (%L)',
            partition_name,
            partition_start,
            partition_end
        );
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 7. Create trigger to auto-create partitions if needed
CREATE TRIGGER trigger_create_booking_partition
    BEFORE INSERT ON bookings
    FOR EACH ROW
    EXECUTE FUNCTION create_booking_partition();