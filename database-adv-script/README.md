# SQL Joins  - AirBnB Database

## Queries Overview

### 1. INNER JOIN Query
**Objective**: Retrieve all bookings and the respective users who made those bookings.

**Purpose**: This query shows only the bookings that have associated users, demonstrating a many-to-one relationship where multiple bookings can belong to a single user.

**Expected Results**: Shows booking details along with user information for all bookings that have a valid user association.

### 2. LEFT JOIN Query  
**Objective**: Retrieve all properties and their reviews, including properties that have no reviews.

**Purpose**: This query ensures we get all properties from the database, regardless of whether they have reviews or not. Properties without reviews will show NULL values in the review-related columns.

**Expected Results**: A complete list of all properties with their review information (if available), demonstrating how to include all records from the left table (properties) while optionally joining records from the right table (reviews).

### 3. FULL OUTER JOIN Query
**Objective**: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

**Purpose**: This comprehensive query shows the complete picture of both users and bookings, including:
- Users who have made bookings
- Users who haven't made any bookings  
- Bookings that are linked to users
- Bookings that might not be linked to any user (though this shouldn't happen with proper foreign key constraints)

**Database Note**: Some database systems (like MySQL) don't natively support FULL OUTER JOIN. The solution includes an alternative approach using UNION of LEFT and RIGHT JOINs.

## Key Learning Points

- **INNER JOIN**: Returns only matching records from both tables
- **LEFT JOIN**: Returns all records from the left table and matched records from the right table (NULL if no match)
- **FULL OUTER JOIN**: Returns all records when there's a match in either left or right table (NULL where no match exists)
- **Relationship Understanding**: Demonstrates how different entities in the AirBnB schema relate to each other

## How to Use

1. Ensure your database has the AirBnB schema and sample data
2. Run each query individually to see the results
3. Observe how each JOIN type affects the result set
4. Note the differences in the number of rows returned by each query

## Expected Outcomes

- The INNER JOIN will return only bookings that have valid user associations
- The LEFT JOIN will return all properties, with NULL values for properties without reviews
- The FULL OUTER JOIN will return all users and all bookings, showing the complete relationship picture

# SQL Subqueries - AirBnB Database

## Queries Overview

### 1. Non-Correlated Subquery: High-Rated Properties
**Objective**: Find all properties where the average rating is greater than 4.0.

**Concept**: A non-correlated subquery executes independently of the outer query. It runs once, and its result is used in the main query.

**How it works**:
1. The subquery `(SELECT AVG(rating) FROM reviews WHERE property_id = p.property_id)` calculates the average rating for each property
2. The main query filters properties where this average is greater than 4.0
3. The result is ordered by average rating in descending order

**Use case**: When you need to filter based on aggregated data from another table.

### 2. Correlated Subquery: Frequent Bookers
**Objective**: Find users who have made more than 3 bookings.

**Concept**: A correlated subquery references columns from the outer query and executes once for each row processed by the outer query.

**How it works**:
1. For each user in the outer query, the subquery `(SELECT COUNT(*) FROM bookings WHERE user_id = u.user_id)` counts their bookings
2. The main query filters users where this count is greater than 3
3. The result shows users along with their total booking count

**Use case**: When you need to check a condition that depends on each individual row of the outer query.

## Key Differences

### Non-Correlated Subqueries
- Execute independently
- Run once before the main query
- Can be used in WHERE, SELECT, or FROM clauses
- Generally faster for small result sets

### Correlated Subqueries  
- Reference outer query columns
- Execute once for each row in the outer query
- Can impact performance with large datasets
- Often can be rewritten with JOINs for better efficiency

## Performance Considerations

While subqueries are powerful, they can sometimes be less efficient than JOIN operations:
- The first query (properties with high ratings) might be more efficient using a JOIN with GROUP BY
- The second query (users with many bookings) demonstrates the correlated subquery concept but could also use a JOIN

## Learning Outcomes

- Understand when to use subqueries vs. JOIN operations
- Recognize the difference between correlated and non-correlated subqueries
- Learn to use subqueries in WHERE clauses for filtering
- Understand performance implications of different query approaches

# SQL Aggregations and Window Functions - AirBnB Database


## Queries Overview

### 1. Aggregation with GROUP BY: Bookings per User
**Objective**: Find the total number of bookings made by each user using COUNT and GROUP BY.

**Key Concepts**:
- `COUNT()`: Counts the number of bookings per user
- `SUM()`: Calculates total amount spent by each user
- `AVG()`: Finds average booking value per user
- `GROUP BY`: Groups results by user attributes
- `LEFT JOIN`: Ensures all users are included, even those with no bookings

**Use Case**: User behavior analysis, identifying frequent customers, revenue analysis.

### 2. Window Functions: Property Ranking by Bookings
**Objective**: Rank properties based on the total number of bookings using window functions.

**Key Concepts**:
- `RANK()`: Assigns rank with gaps (1, 2, 2, 4)
- `ROW_NUMBER()`: Assigns unique sequential numbers (1, 2, 3, 4)
- `DENSE_RANK()`: Assigns rank without gaps (1, 2, 2, 3)
- `OVER()`: Defines the window for the calculation
- `ORDER BY`: Specifies the sorting within the window

**Use Case**: Property performance analysis, identifying popular listings, competitive analysis.

### 3. Advanced: Partitioned Ranking
**Objective**: Rank properties within each location by number of bookings.

**Key Concepts**:
- `PARTITION BY`: Divides data into groups before applying window functions
- Location-based analysis within partitions

**Use Case**: Regional performance comparison, local market analysis.

### 4. Advanced: Analytical Window Functions
**Objective**: Demonstrate running totals and comparative analysis.

**Key Concepts**:
- `RUNNING TOTAL`: Cumulative sum over ordered data
- `OVERALL AVERAGE`: Comparison to dataset average
- `DIFFERENCE CALCULATION`: Analytical insights

**Use Case**: Time series analysis, performance benchmarking.

## Key Differences

### Aggregation with GROUP BY
- Collapses multiple rows into single summary rows
- Loses individual row details
- Requires all non-aggregated columns in GROUP BY
- Best for summary statistics

### Window Functions
- Preserves individual row details
- Adds calculated columns to each row
- No need to group all non-aggregated columns
- Best for rankings, running totals, and comparative analysis

## Performance Considerations

- Window functions can be resource-intensive on large datasets
- Proper indexing on columns used in ORDER BY and PARTITION BY improves performance
- Aggregations with GROUP BY are generally faster for simple summaries
