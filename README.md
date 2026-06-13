# Football Ticket Booking System

## Assignment Overview

This project is a database design and SQL query implementation for a **Football Ticket Booking System**. The system manages football fans, football matches, and ticket booking transactions.

The assignment demonstrates:

* Database Design
* Entity Relationship Diagram (ERD)
* Primary Key and Foreign Key Relationships
* Data Integrity Constraints
* SQL Queries using:

  * SELECT
  * WHERE
  * ILIKE
  * COALESCE
  * INNER JOIN
  * LEFT JOIN
  * Subqueries
  * Aggregate Functions
  * ORDER BY
  * LIMIT & OFFSET

---

## Database Name

```sql
football_ticket_db
```

---

## Entity Relationship Diagram (ERD)

### Tables

1. Users
2. Matches
3. Bookings

### Relationships

* One User can have Many Bookings
* One Match can have Many Bookings
* Each Booking belongs to one User
* Each Booking belongs to one Match

### ERD Link

Paste your public ERD link here:

```text
https://drive.google.com/file/d/1VOQ8Dm-Vx41Tioprzznqno6KybfN_qNH/view?usp=drive_link
```

---

## Database Schema

### Users

| Column       | Description                   |
| ------------ | ----------------------------- |
| user_id      | Primary Key                   |
| full_name    | User full name                |
| email        | Unique email                  |
| role         | Football Fan / Ticket Manager |
| phone_number | Contact number                |

### Matches

| Column              | Description         |
| ------------------- | ------------------- |
| match_id            | Primary Key         |
| fixture             | Match teams         |
| tournament_category | Tournament name     |
| base_ticket_price   | Ticket price        |
| match_status        | Availability status |

### Bookings

| Column         | Description    |
| -------------- | -------------- |
| booking_id     | Primary Key    |
| user_id        | Foreign Key    |
| match_id       | Foreign Key    |
| seat_number    | Stadium seat   |
| payment_status | Payment state  |
| total_cost     | Booking amount |

---

## Sample Data

The project contains sample data for:

* 4 Users
* 5 Matches
* 5 Bookings

---

## SQL Queries Implemented

### Query 1

Retrieve all available Champions League matches.

### Query 2

Find users whose names start with "Tanvir" or contain "Haque".

### Query 3

Replace NULL payment status with "Action Required".

### Query 4

Retrieve booking details with user names and match fixtures using INNER JOIN.

### Query 5

Display all users and their booking IDs using LEFT JOIN.

### Query 6

Find bookings whose total cost is higher than the average booking cost.

### Query 7

Retrieve the top 2 expensive matches while skipping the highest-priced match.

---

## Technologies Used

* PostgreSQL
* Beekeeper Studio
* Draw.io (ERD Design)
* Git & GitHub

---

## Project Structure

```text
football-ticket-booking-system/
│
├── QUERY.sql
├── README.md
├── ERD.png
└── screenshots/
```

---

## Author

Name: Your Name

Course: Database Systems

Assignment: Football Ticket Booking System

---

## Repository

GitHub Repository:

```text
https://github.com/kira217-cyber/football-ticket-booking-system
```
