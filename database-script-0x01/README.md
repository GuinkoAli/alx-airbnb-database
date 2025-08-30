# AirBnB Database Schema

This directory contains the Database Definition Language (DDL) for the AirBnB clone database.

## Files

- `schema.sql`: Contains all SQL statements to create the database schema

## Database Design

The database consists of 6 main tables:

### 1. Users
Stores information about all users (guests, hosts, and admins) of the platform.

### 2. Properties
Contains details about properties listed on the platform, linked to their host.

### 3. Bookings
Tracks all bookings made by users for properties.

### 4. Payments
Records payment information for each booking.

### 5. Reviews
Stores reviews and ratings left by users for properties.

### 6. Messages
Manages communication between users.

## Key Features

- **UUID Primary Keys**: All tables use UUIDs as primary keys for better scalability and security
- **Data Integrity**: Constraints ensure data validity (e.g., rating between 1-5, end_date after start_date)
- **Performance Optimization**: Indexes on frequently queried columns
- **Automatic Timestamps**: Created_at and updated_at fields are automatically managed
- **ENUM Types**: Used for fields with limited options (user roles, booking statuses, payment methods)

## Usage

To create the database:

1. Create a PostgreSQL database
2. Run the commands in `schema.sql` to create all tables, indexes, and triggers

## Notes

- This schema is designed for PostgreSQL. Minor adjustments may be needed for other database systems
- The UUID generation uses PostgreSQL's `gen_random_uuid()` function
- The trigger automatically updates the `updated_at` timestamp when a property record is modified