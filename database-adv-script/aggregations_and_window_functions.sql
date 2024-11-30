-- Total number of bookings made by each user using the COUNT function and GROUP BY clause

SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    Booking
GROUP BY
    user_id;

-- Rank properties based on the total number of bookings they have received using a window function

SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM
    Booking
GROUP BY
    property_id
ORDER BY
    propert_rank;
