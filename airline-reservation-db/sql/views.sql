-- View definitions for booking summary and confirmed bookings

DROP VIEW IF EXISTS confirmed_bookings;
DROP VIEW IF EXISTS booking_summary;

-- Initial booking_summary view
CREATE VIEW booking_summary AS
SELECT 
    p.passenger_name,
    f.flight_number,
    f.origin,
    f.destination
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id;

-- confirmed_bookings view
CREATE VIEW confirmed_bookings AS
SELECT 
    p.passenger_name,
    f.flight_number,
    f.origin,
    f.destination
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id
WHERE b.status = 'Confirmed';
