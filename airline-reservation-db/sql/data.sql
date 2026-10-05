-- Sample data insertion for Passengers, Flights, and Bookings

INSERT INTO Passengers (passenger_id, passenger_name) VALUES
(1, 'Rao'),
(2, 'Singh'),
(3, 'Joshi');

INSERT INTO Flights (flight_id, flight_number, origin, destination) VALUES
(1, 'AI101', 'Mumbai', 'Delhi'),
(2, 'AI202', 'Pune', 'Bengaluru'),
(3, 'AI303', 'Delhi', 'Kolkata');

INSERT INTO Bookings (booking_id, passenger_id, flight_id, status, booking_amount) VALUES
(1, 1, 1, 'Confirmed', 5500.00),
(2, 2, 2, 'Confirmed', 6200.00),
(3, 3, 3, 'Pending', 4800.00);
