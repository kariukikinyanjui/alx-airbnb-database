-- Total Bookings per User

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    User u
JOIN
    Booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name;

-- Ranking properties by number of bookings

WITH PropertyBookings AS (
	SELECT
	    p.property_id,
	    p.name,
	    COUNT(b.booking_id) AS total_bookings
	FROM
	    Property p
	JOIN
	    Booking b ON p.property_id = b.property_id
	GROUP BY
	    p.property_id, p.name
)
SELECT
    property_id,
    name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank
FROM
    PropertyBookings;
