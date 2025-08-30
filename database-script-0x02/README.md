# Database Seeding Script

This directory contains the script to populate the AirBnB database with sample data.

## Files

- `seed.sql`: Contains SQL INSERT statements to add sample data to all tables

## How to Use

1. First, make sure you have created the database schema by running the `schema.sql` file.

2. Run the seed script to populate the database with sample data:
   ```bash
   psql -d your_database_name -f seed.sql