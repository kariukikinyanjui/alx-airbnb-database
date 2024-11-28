# Database Specification - AirBnB

This repository contains SQL scripts to populate an Airbnb-like relational database schema with sample data. The data reflects real-world usage scenarios, including multiple users, properties, bookings, payments, reviews, and messaging.

---

## **About**

The sample data provides a foundation for testing and development of the platform. It includes:
- Users with various roles (guest, host, admin).
- Properties listed by hosts.
- Bookings made by guests.
- Payments processed for bookings.
- Reviews submitted by guests.
- Messages exchanged between users.

---

## **File Structure**

- `populate_data.sql`: Contains SQL `INSERT` statements to populate the database.

---

## **Sample Data Overview**

### **1. Users**
- **Guest**: John Doe (a typical guest who books properties).
- **Host**: Jane Smith (a property owner and manager).
- **Admin**: Admin User (a platform administrator for managing operations).

### **2. Properties**
- **Cozy Apartment**: A centrally located apartment in New York.
- **Beachfront Villa**: A luxurious villa in Miami with a private beach.

### **3. Bookings**
- **Confirmed Booking**: A reservation by the guest for the Cozy Apartment.
- **Pending Booking**: A reservation for the Beachfront Villa awaiting confirmation.

### **4. Payments**
- Full payment for the confirmed booking.
- Partial payment for the pending booking.

### **5. Reviews**
- Positive feedback for the Cozy Apartment.
- Constructive feedback for the Beachfront Villa.

### **6. Messages**
- Communication between the guest and the host regarding property availability.

---

## **Setup**

### **Prerequisites**
1. Ensure the database schema is created using the `schema.sql` file from the previous step.
2. A relational database management system (e.g., MySQL, PostgreSQL) must be installed and running.

### **Execution**
1. Load the SQL script into your database:
   ```bash
   mysql -u <username> -p <database_name> < populate_data.sql

