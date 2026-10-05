# Airline Passenger Reservation Database Using SQL Views

A PostgreSQL DBMS / SQL college case-study project built for execution in VS Code via `psql`. The project demonstrates five required case-study tasks focusing on table relationships, SQL JOINs, SQL Views creation, filtering, dropping, and re-creation.

---

## 📁 Project Structure

```
airline-reservation-db/
├── sql/
│   ├── schema.sql           # Database table structures (Passengers, Flights, Bookings)
│   ├── data.sql             # Required sample data insertion
│   ├── views.sql            # Reusable view definitions (booking_summary, confirmed_bookings)
│   └── queries.sql          # Execution of the 5 case-study tasks
├── documentation/
│   └── project_notes.md     # Project documentation & viva Q&A guide
└── README.md                # Project setup and execution guide
```

---

## 🎯 The Five Case-Study Tasks

1. **Create a booking summary view:** Combines `Passengers`, `Flights`, and `Bookings` tables using SQL JOINs.
2. **Display passenger name, flight number, origin and destination:** Queries the initial `booking_summary` view.
3. **Create a view for confirmed bookings:** Queries the `confirmed_bookings` view filtered for `status = 'Confirmed'`.
4. **Query the view for a selected destination:** Queries `booking_summary` where `destination = 'Delhi'`.
5. **Drop the view and recreate it with booking amount:** Demonstrates `DROP VIEW`, verifies base table persistence, recreates `booking_summary` with `booking_amount`, and displays the final result.

---

## 🛠️ Execution Order in VS Code Terminal

### Step 1: Create Database (`airline_reservation`)
Open VS Code integrated terminal and create the database in PostgreSQL:

```bash
psql -U postgres -c "CREATE DATABASE airline_reservation;"
```

### Step 2: Execute SQL Files in Sequential Order

```bash
cd airline-reservation-db

# 1. Create Tables
psql -U postgres -d airline_reservation -f sql/schema.sql

# 2. Insert Sample Data
psql -U postgres -d airline_reservation -f sql/data.sql

# 3. Create Views
psql -U postgres -d airline_reservation -f sql/views.sql

# 4. Demonstrate Case Study Tasks
psql -U postgres -d airline_reservation -f sql/queries.sql
```

---

## 📊 Expected Execution Output

### Task 2: Display Booking Summary (`SELECT * FROM booking_summary;`)
| passenger_name | flight_number | origin | destination |
| :--- | :--- | :--- | :--- |
| Rao | AI101 | Mumbai | Delhi |
| Singh | AI202 | Pune | Bengaluru |
| Joshi | AI303 | Delhi | Kolkata |

### Task 3: Confirmed Bookings View (`SELECT * FROM confirmed_bookings;`)
| passenger_name | flight_number | origin | destination |
| :--- | :--- | :--- | :--- |
| Rao | AI101 | Mumbai | Delhi |
| Singh | AI202 | Pune | Bengaluru |

### Task 4: Query Selected Destination (`WHERE destination = 'Delhi'`)
| passenger_name | flight_number | origin | destination |
| :--- | :--- | :--- | :--- |
| Rao | AI101 | Mumbai | Delhi |

### Task 5: Recreated Booking Summary with `booking_amount`
| passenger_name | flight_number | origin | destination | booking_amount |
| :--- | :--- | :--- | :--- | :--- |
| Rao | AI101 | Mumbai | Delhi | 5500.00 |
| Singh | AI202 | Pune | Bengaluru | 6200.00 |
| Joshi | AI303 | Delhi | Kolkata | 4800.00 |
