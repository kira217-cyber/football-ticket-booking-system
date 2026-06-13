-- TABLE: Users
CREATE TABLE
    Users (
        user_id INT PRIMARY KEY,
        full_name VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        role VARCHAR(50) NOT NULL,
        phone_number VARCHAR(20),
        -- Restrict role values to valid user types
        CONSTRAINT chk_user_role CHECK (role IN ('Ticket Manager', 'Football Fan'))
    );

-- TABLE: Matches
CREATE TABLE
    Matches (
        match_id INT PRIMARY KEY,
        fixture VARCHAR(150) NOT NULL,
        tournament_category VARCHAR(100) NOT NULL,
        base_ticket_price DECIMAL(10, 2) NOT NULL,
        match_status VARCHAR(50) NOT NULL,
        -- Prevent negative ticket prices
        CONSTRAINT chk_ticket_price CHECK (base_ticket_price >= 0),
        -- Restrict match status to predefined values
        CONSTRAINT chk_match_status CHECK (
            match_status IN (
                'Available',
                'Selling Fast',
                'Sold Out',
                'Postponed'
            )
        )
    );

-- TABLE: Bookings
CREATE TABLE
    Bookings (
        booking_id INT PRIMARY KEY,
        user_id INT NOT NULL,
        match_id INT NOT NULL,
        seat_number VARCHAR(20),
        payment_status VARCHAR(50),
        total_cost DECIMAL(10, 2) NOT NULL,
        -- Relationship: Booking belongs to a User
        CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES Users (user_id),
        -- Relationship: Booking belongs to a Match
        CONSTRAINT fk_booking_match FOREIGN KEY (match_id) REFERENCES Matches (match_id),
        -- Prevent negative booking cost
        CONSTRAINT chk_total_cost CHECK (total_cost >= 0),
        -- Restrict payment status to valid values
        CONSTRAINT chk_payment_status CHECK (
            payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
            OR payment_status IS NULL
        )
    );


-- Insert sample user records into the Users table
INSERT INTO
    Users (user_id, full_name, email, role, phone_number)
VALUES
    (
        1,
        'Tanvir Rahman',
        'tanvir@mail.com',
        'Football Fan',
        '+8801711111111'
    ),
    (
        2,
        'Asif Haque',
        'asif@mail.com',
        'Football Fan',
        '+8801722222222'
    ),
    (
        3,
        'Sajjad Rahman',
        'sajjad@mail.com',
        'Ticket Manager',
        '+8801733333333'
    ),
    (
        4,
        'Jannat Ara',
        'jannat@mail.com',
        'Football Fan',
        NULL
    );

-- Insert sample football match records into the Matches table
INSERT INTO
    Matches (
        match_id,
        fixture,
        tournament_category,
        base_ticket_price,
        match_status
    )
VALUES
    (
        101,
        'Real Madrid vs Barcelona',
        'Champions League',
        150.00,
        'Available'
    ),
    (
        102,
        'Man City vs Liverpool',
        'Premier League',
        120.00,
        'Selling Fast'
    ),
    (
        103,
        'Bayern Munich vs PSG',
        'Champions League',
        130.00,
        'Available'
    ),
    (
        104,
        'AC Milan vs Inter Milan',
        'Serie A',
        90.00,
        'Sold Out'
    ),
    (
        105,
        'Juventus vs Roma',
        'Serie A',
        80.00,
        'Available'
    );

-- Insert sample ticket booking records into the Bookings table
INSERT INTO
    Bookings (
        booking_id,
        user_id,
        match_id,
        seat_number,
        payment_status,
        total_cost
    )
VALUES
    (501, 1, 101, 'A-12', 'Confirmed', 150.00),
    (502, 1, 102, 'B-04', 'Confirmed', 120.00),
    (503, 2, 101, 'A-13', 'Confirmed', 150.00),
    (504, 2, 101, NULL, NULL, 150.00),
    (505, 3, 102, 'C-20', 'Pending', 120.00);


