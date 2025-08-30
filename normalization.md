# Database Normalization Report

## Introduction
This document outlines the process of normalizing the AirBnB database schema to Third Normal Form (3NF) to minimize redundancy and ensure data integrity.

## Normalization Steps

### 1. First Normal Form (1NF)
- **Goal:** Ensure all attributes contain atomic values.
- **Analysis:** The initial schema was already in 1NF. All columns held single, indivisible values with no repeating groups.
- **Result:** ✅ 1NF achieved.

### 2. Second Normal Form (2NF)
- **Goal:** Remove partial dependencies (ensure all non-key attributes depend on the entire primary key).
- **Analysis:** All tables use a single-column primary key. This means all non-key attributes, by definition, depend on the whole key. There are no partial dependencies.
- **Result:** ✅ 2NF achieved.

### 3. Third Normal Form (3NF)
- **Goal:** Remove transitive dependencies (ensure no non-key attribute depends on another non-key attribute).
- **Analysis:** The schema was examined for transitive dependencies. The most common example is storing host details in the `PROPERTY` table. This was avoided by using a `USER` table and linking via a `host_id` foreign key. The `total_price` in the `BOOKING` table is a calculated value but is stored for historical and performance reasons, which is a valid design choice and not a violation of 3NF.
- **Result:** ✅ 3NF achieved.

## Conclusion
The database schema is well-designed and conforms to the principles of Third Normal Form. Data is organized logically into separate tables, linked by foreign keys, which eliminates redundancy and protects against data anomalies.