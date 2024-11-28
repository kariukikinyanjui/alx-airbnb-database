# Database Specification Schema - AirBnB

This repository contains the SQL script to create a relational database schema for an Airbnb-like platform. The schema supports user management, property listings, bookings, payments, reviews, and messaging functionality.


---

## **Schema Overview**

### **Entities**
1. **User**: Stores information about platform users, including guests, hosts, and admins.
2. **Property**: Represents listings created by hosts for booking.
3. **Booking**: Tracks reservations made by guests for properties.
4. **Payment**: Records payment details for bookings.
5. **Review**: Stores guest reviews and ratings for properties.
6. **Message**: Facilities communication between users.

---

## **File Structure**

- `Schema.sql`: The SQL script to define the datbase schema.

---

## **Database Design**

### **User Table**
Stores user details and roles.
- **Primary Key**: `user_id`
- **Constraints**:
   - Unique email addresses.
   - Role restricted to `guest`, `host`, or `admin`.

## **Property Table**
Represents properties listed by hosts.
- **Primary Key**: `property_id`
- **Foreign Key**: `host_id` references `User(user_id)`.
- **Attributes**:
   - `pricepernight`: Stores nightly rental price.
   - Automatic `created_at` and `updated_at` timestamps.

### **Booking Table**
Tracks reservations made by guests.
- **Primary Key**: `booking_id`
- **Foreign Keys**:
   - `property_id` references `Property(property_id)`.
   - `user_id` references `User(user_id)`.
-**Attributes**:
  - `status`: Booking status (pending, confirmed, canceled).

### **Payment Table**
Records payment associated with bookings.
- **Primary Key**: `payment_id`
- **Foreign Key**: `booking_id` references `Booking(booking_id)`.
- **Attributes**:
   - `payment_method`: Specifies the payment type (credit_card, paypal, stripe).

### **Review Table**
Stores guest feedback on properties.
- **Primary Key**: `review_id`
- **Foreign Keys**:
   - `property_id` references `Property(property_id)`.
   - `user_id` references `User(user_id)`.
- **Constraints**:
   - `rating` must be between 1 and 5.

### **Message Table**
Supports user-to-user messaging.
- **Primary Key**: `message_id`
- **Foreign Keys**:
   - `sender_id` and `recipient_id` reference `User(user_id)`.

---

## **Usage**

### **Setup**
1. Create a database using your preferred relational database management system (e.g., MySQL, PostgreSQL).
2. Run the `schema.sql` script to create the tables and apply constraints.

### **Execution**
- Use the SQL script in your database client or management tool:
  ```bash
  mysql -u <username> -p <database_name> < schema.sql
