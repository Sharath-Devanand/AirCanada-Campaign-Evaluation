/*

A detailed SQL analysis is performed to understand the dataset.


Exploratory

1. 2067/16737 - Cancelled
2. Location
	2.1 Country - Only Canada
	2.2 Provinces - 11 Unique - frequency
3. Gender - Frequency
4. Marital Status - Frequency
5. Education - Frequency
6. Salary - 20 are negative + 3.5k records - NULL

1. Card_type - frequency
2. Enrollment Type - freq (971:15k) - 2018Promo:Standard
3. CLV - min,max,mean
4. Card_type % in 2018 promo
5. CLV mean - Card types
6. CLV mean - Enroll_type
7. #of new users increase YoY compared to 2018 increase
8. Customer count across card_types - very similar trend (S>N>A)
9. Cancellations over time

1. #flights - Solo vs Companion - month-wise
2. distance - month-wise
3. %of redeemed points = 0 (94%)


*/

--- Exploration to understand the demographics


--- Demographic Exploration

-- Unique Countries

SELECT DISTINCT Country as unique_countries
FROM Customer;


-- Count of Unique Provinces and their AVG(CLV), COUNT(Enroll_year), COUNT(Cancel_year)

WITH cancel_check_p AS(
        SELECT Loyalty_Number,
                Province,
                CLV,
                CASE WHEN Cancel_year = 'NULL'
                        THEN 0
                        ELSE 1
                        END AS Cancelled_member
        FROM Customer
)


SELECT Province,
        ROUND(AVG(CLV),1) as avg_CLV,
        COUNT(Loyalty_number) as Customer_count,
        SUM(Cancelled_member) as Cancelled_customers
FROM cancel_check_p
GROUP BY Province
ORDER BY Customer_count DESC;

-- Gender grouped AVG(CLV), COUNT(Enroll, cancel)


WITH cancel_check_g AS(
        SELECT Loyalty_Number,
                Gender,
                CLV,
                CASE WHEN Cancel_year = 'NULL'
                        THEN 0
                        ELSE 1
                        END AS Cancelled_member
        FROM Customer
)


SELECT Gender,
        ROUND(AVG(CLV),1) as avg_CLV,
        COUNT(Loyalty_number) as Customer_count,
        SUM(Cancelled_member) as Cancelled_customers
FROM cancel_check_g
GROUP BY Gender
ORDER BY Customer_count DESC;

-- Education grouped AVG(CLV), COUNT(Enroll, cancel)

WITH cancel_check_e AS(
        SELECT Loyalty_Number,
                Education,
                CLV,
                CASE WHEN Cancel_year = 'NULL'
                        THEN 0
                        ELSE 1
                        END AS Cancelled_member
        FROM Customer
)


SELECT Education,
        ROUND(AVG(CLV),1) as avg_CLV,
        COUNT(Loyalty_number) as Customer_count,
        SUM(Cancelled_member) as Cancelled_customers
FROM cancel_check_e
GROUP BY Education
ORDER BY Customer_count DESC;


-- Marital Status grouped AVG(CLV), COUNT(Enroll, cancel)

WITH cancel_check_m AS(
        SELECT Loyalty_Number,
                Marital_status,
                CLV,
                CASE WHEN Cancel_year = 'NULL'
                        THEN 0
                        ELSE 1
                        END AS Cancelled_member
        FROM Customer
)


SELECT Marital_status,
        ROUND(AVG(CLV),1) as avg_CLV,
        COUNT(Loyalty_number) as Customer_count,
        SUM(Cancelled_member) as Cancelled_customers
FROM cancel_check_m
GROUP BY Marital_status
ORDER BY Customer_count DESC;


-- YoY% increase in enrollment

WITH YearlyEnrollment AS (
    SELECT 
        Enroll_year,
        COUNT(Loyalty_Number) AS customer_count,
        LAG(COUNT(Loyalty_Number)) OVER (ORDER BY Enroll_year) AS prev_year_count
    FROM Customer
    GROUP BY Enroll_year
)
SELECT 
    Enroll_year,
    customer_count,
    prev_year_count,
    ROUND(
        CASE 
            WHEN prev_year_count IS NOT NULL THEN 
                (customer_count - prev_year_count) * 100.0 / prev_year_count
            ELSE NULL
        END, 2
    ) AS YoY_Percentage_Increase
FROM YearlyEnrollment
ORDER BY Enroll_year;



-- Card type grouped AVG(CLV), COUNT(Enroll, cancel)

WITH cancel_check_c AS(
        SELECT Loyalty_Number,
                Card_type,
                CLV,
                CASE WHEN Cancel_year = 'NULL'
                        THEN 0
                        ELSE 1
                        END AS Cancelled_member
        FROM Customer
)


SELECT Card_type,
        ROUND(AVG(CLV),1) as avg_CLV,
        COUNT(Loyalty_number) as Customer_count,
        SUM(Cancelled_member) as Cancelled_customers
FROM cancel_check_c
GROUP BY Card_type
ORDER BY Customer_count DESC;


-- Enroll Type - grouped AVG(CLV), COUNT(Enroll, cancel)

WITH cancel_check_et AS(
        SELECT Loyalty_Number,
                Enroll_type,
                CLV,
                CASE WHEN Cancel_year = 'NULL'
                        THEN 0
                        ELSE 1
                        END AS Cancelled_member
        FROM Customer
)


SELECT Enroll_type,
        ROUND(AVG(CLV),1) as avg_CLV,
        COUNT(Loyalty_number) as Customer_count,
        SUM(Cancelled_member) as Cancelled_customers
FROM cancel_check_et
GROUP BY Enroll_type
ORDER BY Customer_count DESC;


---  Across years - CLV average

WITH CLV_YoY AS (
        SELECT Enroll_year,
                AVG(CLV) as current_avg_clv,
                LAG(AVG(CLV)) OVER(ORDER BY Enroll_year) as previous_avg_clv
        FROM Customer
        GROUP BY Enroll_year
        )


SELECT Enroll_year,
        current_avg_clv AS average_CLV,
        ROUND((current_avg_clv - previous_avg_clv)*100.0/previous_avg_clv,2) AS YOY_CLV_avg
FROM CLV_YoY
ORDER BY Enroll_year;


---- FLIGHT Exploration

-- Month-wise - Total flights, solo flights, companion_flight, avg_points_accum, avg_point_redeem_avg_dollars_redeem, avg_distance

SELECT Month,
        SUM(Total_flights) AS Total_flights,
        ROUND(SUM(Solo_flights)*100.0/SUM(Total_flights),2) AS Solo_flights,
        ROUND(SUM(Companion_flights)*100.0/SUM(Total_flights),2) AS Companion_flights
FROM Flights
GROUP BY Month
ORDER BY Month;


-- YoY increase in total flights, avg_distance and points_accumulated

WITH flight_yoy AS (
        SELECT Month,
                SUM(Total_flights) AS total_flights,
                LAG(SUM(Total_flights)) OVER(ORDER BY Month) AS previous_flights,
                AVG(Distance) AS avg_dist,
                LAG(AVG(Distance)) OVER(ORDER BY Month) AS prev_avg_dist,
                AVG(Points_accum) AS Points_avg,
                LAG(AVG(Points_accum)) OVER(ORDER BY Month) AS prev_points_avg
        FROM Flights
        GROUP BY Month
)

SELECT Month,
        total_flights,
        ROUND((total_flights - previous_flights)*100.0/previous_flights,2) AS Flight_YoY,
        avg_dist AS Average_Distance,
        ROUND((avg_dist-prev_avg_dist)*100.0/prev_avg_dist,2) AS Distance_YoY,
        Points_avg AS Average_Points_Accum,
        ROUND((Points_avg-prev_points_avg)*100.0/prev_points_avg,2) AS Points_YoY
FROM flight_yoy
ORDER BY Month;