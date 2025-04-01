CREATE TABLE IF NOT EXISTS Flights(
    Loyalty_Number INTEGER,
    Year INTEGER,
    Month INTEGER,
    Solo_flights INTEGER,
    Companion_flights INTEGER,
    Total_flights INTEGER,
    Distance INTEGER,
    Points_accum FLOAT,
    Points Redeemed FLOAT,
    Dollars_redeemed FLOAT
);


CREATE TABLE IF NOT EXISTS Customer(
    Loyalty_Number INTEGER PRIMARY KEY,
    Country TEXT,
    Province TEXT,
    City TEXT,
    Post_code TEXT,
    Gender TEXT,
    Education TEXT,
    Salary INTEGER,
    Marital_status TEXT,
    Card_type TEXT,
    CLV FLOAT,
    Enroll_type TEXT,
    Enroll_year INTEGER,
    Enroll_month INTEGER,
    Cancel_year INTEGER,
    Cancel_month INTEGER
);