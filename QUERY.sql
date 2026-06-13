
-- TABLE: Users

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),

    -- Restrict role values to valid user types
    CONSTRAINT chk_user_role
    CHECK (role IN ('Ticket Manager', 'Football Fan'))
);




-- TABLE: Matches

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(150) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price DECIMAL(10,2) NOT NULL,
    match_status VARCHAR(50) NOT NULL,

    -- Prevent negative ticket prices
    CONSTRAINT chk_ticket_price
    CHECK (base_ticket_price >= 0),

    -- Restrict match status to predefined values
    CONSTRAINT chk_match_status
    CHECK (
        match_status IN (
            'Available',
            'Selling Fast',
            'Sold Out',
            'Postponed'
        )
    )
);




-- TABLE: Bookings

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    match_id INT NOT NULL,
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost DECIMAL(10,2) NOT NULL,

    -- Relationship: Booking belongs to a User
    CONSTRAINT fk_booking_user
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    -- Relationship: Booking belongs to a Match
    CONSTRAINT fk_booking_match
    FOREIGN KEY (match_id)
    REFERENCES Matches(match_id),

    -- Prevent negative booking cost
    CONSTRAINT chk_total_cost
    CHECK (total_cost >= 0),

    -- Restrict payment status to valid values
    CONSTRAINT chk_payment_status
    CHECK (
        payment_status IN (
            'Pending',
            'Confirmed',
            'Cancelled',
            'Refunded'
        )
        OR payment_status IS NULL
    )
);

