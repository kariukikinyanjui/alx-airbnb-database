# Task: Identifying and Creating Indexes to Improve Query Performance

## Objective
The goal is to identify high-usage colums in the `User`, `Booking`, and `Property` tables, create appropriate indexes for those columns, and measure query performance before and after adding the indexes using `EXPLAIN` or `ANALYZE`.

## Instructions

### 1. Indentify High-Usage Columns
High-usage columns are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses. Based on typical usage patterns, the high-usage columns in the `User`, `Booking`, and `Property` tables are:

- **User Table:**
  - `email`: Frequently used in `WHERE` clauses for user identification.
  - `user_id`: Used in joins with `Booking` and `Message` tables.

- **Property Table:**
  - `property_id`: Used in joins with `Review` and `Booking` tables.
  - `location`: Often used in search queries.

- **Booking Table:**
  - `booking_id`: Used in specific booking retrieval and joins with `Payment`.
  - `user_id`: Used in joins to link bookings to users.
  - `property_id`: Used in joins to link bookings to properties.
  - `start_date` and `end_date`: Used in date-based searches.

### 2. Create Indexes
Create indexes on the identified high-usage columns to improve query performance. Here are the SQL `CREATE INDEX` commands:

```sql
-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(user_id);

-- Property Table
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_property_location ON Property(location);

-- Booking Table
CREATE INDEX idx_booking_id ON Booking(booking_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

**Example of measuring performance before adding indexes**

`EXPLAIN ANALYZE
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
   Booking
GROUP BY
    user_id;
`
**Example of measuring performance before adding indexes**

`EXPLAIN ANALYZE
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    Booking
GROUP BY
    user_id;
`
The `EXPLAIN ANALYZE` command provides detailed execution plans for the queries, including the time taken to execute them. By comparing the execution plans and the time taken before and after adding indexes,  you can gauge the performance improvement.
