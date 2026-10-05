-- Schema creation for Airline Passenger Reservation Database

DROP TABLE IF EXISTS Bookings CASCADE;
DROP TABLE IF EXISTS Flights CASCADE;
DROP TABLE IF EXISTS Passengers CASCADE;

-- Passengers Table
CREATE TABLE Passengers (
    passenger_id INTEGER PRIMARY KEY,
    passenger_name VARCHAR(50) NOT NULL
);

-- Flights Table
CREATE TABLE Flights (
    flight_id INTEGER PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL,
    origin VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL
);

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INTEGER PRIMARY KEY,
    passenger_id INTEGER REFERENCES Passengers(passenger_id),
    flight_id INTEGER REFERENCES Flights(flight_id),
    status VARCHAR(20),
    booking_amount DECIMAL(10, 2)
);
