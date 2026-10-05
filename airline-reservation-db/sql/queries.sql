-- Demonstration of the five required case-study tasks

-- 1. Create a booking summary view
CREATE OR REPLACE VIEW booking_summary AS
SELECT 
    p.passenger_name,
    f.flight_number,
    f.origin,
    f.destination
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id;

-- 2. Display passenger name, flight number, origin and destination
SELECT * FROM booking_summary;

-- 3. Create a view for confirmed bookings
CREATE OR REPLACE VIEW confirmed_bookings AS
SELECT 
    p.passenger_name,
    f.flight_number,
    f.origin,
    f.destination
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id
WHERE b.status = 'Confirmed';

SELECT * FROM confirmed_bookings;

-- 4. Query the view for a selected destination
SELECT * 
FROM booking_summary 
WHERE destination = 'Delhi';

-- 5. Drop the view and recreate it with booking amount
DROP VIEW booking_summary;

-- Verify underlying base tables remain intact
SELECT * FROM Passengers;
SELECT * FROM Flights;
SELECT * FROM Bookings;

-- Recreate booking_summary view with booking_amount column
CREATE VIEW booking_summary AS
SELECT 
    p.passenger_name,
    f.flight_number,
    f.origin,
    f.destination,
    b.booking_amount
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id;

SELECT * FROM booking_summary;
