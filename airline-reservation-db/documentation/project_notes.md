# Airline Passenger Reservation Database Using SQL Views

## Project Notes & Documentation

---

## 1. Project Title & Objective

- **Project Title:** Airline Passenger Reservation Database Using SQL Views
- **Objective:** Implement a relational database in PostgreSQL for an airline reservation case study in VS Code, demonstrating the five required case-study tasks:
  1. Create a booking summary view.
  2. Display passenger name, flight number, origin and destination.
  3. Create a view for confirmed bookings.
  4. Query the view for a selected destination.
  5. Drop the view and recreate it with booking amount.

---

## 2. Database & Tooling

- **Database Engine:** PostgreSQL
- **Development Tool:** VS Code
- **Execution Method:** PostgreSQL CLI (`psql`)
- **Database Name:** `airline_reservation`

---

## 3. Database Schema & Data

### Tables

1. **`Passengers`**
   - `passenger_id` (INTEGER) — Primary Key
   - `passenger_name` (VARCHAR(50), NOT NULL)

2. **`Flights`**
   - `flight_id` (INTEGER) — Primary Key
   - `flight_number` (VARCHAR(10), NOT NULL)
   - `origin` (VARCHAR(50), NOT NULL)
   - `destination` (VARCHAR(50), NOT NULL)

3. **`Bookings`**
   - `booking_id` (INTEGER) — Primary Key
   - `passenger_id` (INTEGER) — Foreign Key referencing `Passengers(passenger_id)`
   - `flight_id` (INTEGER) — Foreign Key referencing `Flights(flight_id)`
   - `status` (VARCHAR(20))
   - `booking_amount` (DECIMAL(10,2))

### Sample Data
- **Passengers:** `(1, 'Rao')`, `(2, 'Singh')`, `(3, 'Joshi')`
- **Flights:** `(1, 'AI101', 'Mumbai', 'Delhi')`, `(2, 'AI202', 'Pune', 'Bengaluru')`, `(3, 'AI303', 'Delhi', 'Kolkata')`
- **Bookings:** `(1, 1, 1, 'Confirmed', 5500.00)`, `(2, 2, 2, 'Confirmed', 6200.00)`, `(3, 3, 3, 'Pending', 4800.00)`

---

## 4. Implementation of the Five Tasks

### Task 1: Create a Booking Summary View (`views.sql`)
Combines `Passengers`, `Flights`, and `Bookings` using SQL JOINs.
```sql
CREATE VIEW booking_summary AS
SELECT 
    p.passenger_name,
    f.flight_number,
    f.origin,
    f.destination
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id;
```

### Task 2: Display Passenger Name, Flight Number, Origin and Destination (`queries.sql`)
Queries all records from the initial view:
```sql
SELECT * FROM booking_summary;
```

### Task 3: Create a View for Confirmed Bookings (`views.sql` / `queries.sql`)
Creates `confirmed_bookings` filtering for `status = 'Confirmed'`:
```sql
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
```

### Task 4: Query the View for a Selected Destination (`queries.sql`)
Queries `booking_summary` using a destination condition:
```sql
SELECT * FROM booking_summary WHERE destination = 'Delhi';
```

### Task 5: Drop the View and Recreate It with Booking Amount (`queries.sql`)
1. `DROP VIEW booking_summary;`
2. Supporting verification: `SELECT * FROM Passengers; SELECT * FROM Flights; SELECT * FROM Bookings;` (confirms base table data remains intact).
3. Recreates view with `booking_amount`:
```sql
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
```
4. Final query: `SELECT * FROM booking_summary;`

---

## 5. Viva Q&A Guide

1. **What is a database?**
   - An organized collection of structured data managed by a RDBMS like PostgreSQL.

2. **What is a primary key?**
   - A column that uniquely identifies each row in a table. It cannot contain NULL values.

3. **What is a foreign key?**
   - A column in one table referencing the primary key of another table, enforcing referential integrity.

4. **What is a JOIN?**
   - An SQL clause that combines columns from multiple tables based on related key columns.

5. **What is a VIEW in SQL?**
   - A virtual table derived from an SQL query result. It does not store physical data on disk.

6. **What happens when a VIEW is dropped?**
   - `DROP VIEW` removes only the view metadata definition. Underlying base table data remains untouched.
