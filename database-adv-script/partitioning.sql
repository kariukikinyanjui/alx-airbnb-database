-- Create a partitioning function
CREATE FUNCTION partition_by_month(TIMESTAMP) RETURNS INTEGER
LANGUAGE SQL
IMMUTABLE
STRICT
AS $$
  SELECT EXTRACT(YEAR FROM $1) * 12 + EXTRACT(MONTH FROM $1);
$$;

-- Create a partition table
CREATE TABLE booking_partition_template
(
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (partition_by_month(start_date));

-- Create partitions for the past year
DO $$
DECLARE
  year INT := EXTRACT(YEAR FROM CURRENT_DATE);
  month INT := EXTRACT(MONTH FROM CURRENT_DATE);
BEGIN
  FOR i IN GENERATE_SERIES(year * 12 + 1, year * 12 + month) LOOP
    EXECUTE format('CREATE TABLE booking_partition_%s PARTITION OF booking_partition_template
      FOR VALUES FROM (%s) TO (%s)', i, i, i + 1);
  END LOOP;
END $$;

-- Switch existing data to partitions (if applicable)
INSERT INTO booking_partition_template SELECT * FROM Booking;
DROP TABLE Booking;
ALTER TABLE booking_partition_template RENAME TO Booking;
