-- SQL statements to populate the database with sample data

-- USER TABLE
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('2f50e1d1-6c7c-56b5-9b23-e6e8b4dcf552', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '0987654321', 'host', CURRENT_TIMESTAMP),
('3g60f2e2-7d8d-67c6-0c34-f7f9c5edg663', 'Admin', 'User', 'admin@example.com', 'hashed_password3', NULL, 'admin', CURRENT_TIMESTAMP);

-- PROPERTY TABLE
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('101', '2f50e1d1-6c7c-56b5-9b23-e6e8b4dcf552', 'Cozy Apartment', 'A cozy apartment in the city center.', 'New York, NY', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('102', '2f50e1d1-6c7c-56b5-9b23-e6e8b4dcf552', 'Beachfront Villa', 'Luxurious villa with a private beach.', 'Miami, FL', 450.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- BOOKING TABLE
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('201', '101', '1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', '2024-12-01', '2024-12-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
('202', '102', '1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', '2025-01-10', '2025-01-15', 2250.00, 'pending', CURRENT_TIMESTAMP);

-- PAYMENT TABLE
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('301', '201', 480.00, CURRENT_TIMESTAMP, 'credit_card'),
('302', '202', 1125.00, CURRENT_TIMESTAMP, 'paypal');

-- REVIEW TABLE
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('401', '101', '1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', 5, 'Amazing place, very clean and central!', CURRENT_TIMESTAMP),
('402', '102', '1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', 4, 'Great view, but a bit expensive.', CURRENT_TIMESTAMP);

-- MESSAGE TABLE
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('501', '1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', '2f50e1d1-6c7c-56b5-9b23-e6e8b4dcf552', 'Hi, is the property available for next week?', CURRENT_TIMESTAMP),
('502', '2f50e1d1-6c7c-56b5-9b23-e6e8b4dcf552', '1e40d0c0-5b6b-45a4-9a12-d5d7a3cbf441', 'Yes, it is available. Let me know if you have any questions.', CURRENT_TIMESTAMP);


