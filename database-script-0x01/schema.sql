-- DDL script to create the tables for the Database Specification - AirBnB  schema

-- USER TABLE
CREATE TABLE User (
	user_id UUID PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	password_hash VARCHAR(255) NOT NULL,
	phone_number VARCHAR(20),
	role ENUM('guest', 'host', 'admin') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	INDEX (email)
);

-- PROPERTY TABLE
CREATE TABLE Property (
	property_id UUID PRIMARY KEY,
	host_id UUID NOT NULL,
	name VARCHAR(255) NOT NULL,
	description TEXT NOT NULL,
	location VARCHAR(255) NOT NULL,
	pricepernight DECIMAL(10, 2) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE,
	INDEX (host_id)
);

-- BOOKING TABLE
CREATE TABLE Booking (
	booking_id UUID PRIMARY KEY,
	property_id UUID NOT NULL,
	user_id UUID NOT NULL, 
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	total_price DECIMAL(10, 2) NOT NULL,
	status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
	FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
	INDEX (property_id),
);

-- PAYMENT TABLE
CREATE TABLE Payment(
	payment_id UUID PRIMARY KEY,
	booking_id UUID NOT NULL,
	amount DECIMAL(10, 2) NOT NULL, 
	payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	payment_method ENUM('credit_cart', 'paypal', 'stripe') NOT NULL,
	FOREIGN KEY (booking_id) REFEREANCES Booking(booking_id) ON DELETE CASCADE,
	INDEX (booking_id)
);

-- REVIEW TABLE
CREATE TABLE Review (
	review_id UUID PRIMARY KEY,
	property_id UUID NOT NULL,
	user_id UUID NOT NULL, 
	rating INTEGER CHECK (rating >= 1 AND rating <= 5),
	comment TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
	FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
	INDEX (property_id),
	INDEX (user_id)
);

-- MESSAGE TABLE
CREATE TABLE Message (
	message_id UUID PRIMARY KEY,
	sender_id UUID NOT NULL,
	recipient_id UUID NOT NULL,
	message_body TEXT NOT NULL,
	sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
	FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE,
	INDEX (sender_id),
	INDEX (recipient_id)
);