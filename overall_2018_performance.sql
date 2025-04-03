/*


*/


-- YoY growth rate


WITH YoY AS (
    SELECT Enroll_year,
        COUNT(Loyalty_Number) AS mem_count,
        LAG(COUNT(Loyalty_Number)) OVER(ORDER BY Enroll_year) AS prev_memb_count
    FROM Customer
    GROUP BY Enroll_year
)

SELECT Enroll_year,
    mem_count AS member_count,
    ROUND((mem_count - prev_memb_count)*100.0/prev_memb_count,2) AS YoY_percent
FROM YoY;

WITH YoY AS (
    SELECT Enroll_year,
        COUNT(Loyalty_Number) AS mem_count,
        LAG(COUNT(Loyalty_Number)) OVER(ORDER BY Enroll_year) AS prev_memb_count
    FROM Customer
    WHERE Enroll_Type = 'Standard'
    GROUP BY Enroll_year
)

SELECT Enroll_year,
    mem_count AS member_count,
    ROUND((mem_count - prev_memb_count)*100.0/prev_memb_count,2) AS YoY_Standard_percent
FROM YoY;


-- Flight % increase due from promotion

/*
WITH Standard_flights AS (
    SELECT SUM(Total_flights) AS flight_count,
            Year as std_year
    FROM Flights t1
    LEFT JOIN Customer t2
        ON t1.Loyalty_Number = t2.Loyalty_Number
    WHERE t2.Enroll_type = 'Standard'
    GROUP BY t1.Year
    HAVING Year = '2018'
),
yearFlights AS (
    SELECT Year,
            SUM(Total_flights) AS flights_year
    FROM Flights
    GROUP BY Year
)


SELECT ROUND(((SELECT flights_year FROM yearFlights WHERE year = '2018')-(SELECT flights_year FROM yearFlights WHERE year = '2017'))*100.0/(SELECT flights_year FROM yearFlights WHERE year = '2017'),1) AS flights_YoY,
        ROUND(((SELECT flight_count FROM Standard_flights) - (SELECT flights_year FROM yearFlights WHERE year = '2017'))*100.0/(SELECT flights_year FROM yearFlights WHERE year = '2017'),1) AS flights_std_YoY;

*/
WITH Flights_Aggregated AS (
    SELECT 
        Year, 
        SUM(Total_flights) AS flights_year,
        SUM(CASE WHEN t2.Enroll_type = 'Standard' THEN Total_flights ELSE 0 END) AS standard_flights
    FROM Flights t1
    LEFT JOIN Customer t2
        ON t1.Loyalty_Number = t2.Loyalty_Number
    GROUP BY Year
)
SELECT 
    ROUND((f18.flights_year - f17.flights_year) * 100.0 / f17.flights_year, 1) AS flights_YoY,
    ROUND((f18.standard_flights - f17.flights_year) * 100.0 / f17.flights_year, 1) AS flights_std_YoY
FROM 
    Flights_Aggregated f17
JOIN 
    Flights_Aggregated f18
ON f17.Year = 2017 AND f18.Year = 2018;


-- Cancellation rate YoY%

/*
WITH Cancel_rate AS (
    SELECT Enroll_year, COUNT(*) AS yearCancelled
    FROM Customer
    WHERE Cancel_year != 'NULL'
    GROUP BY Enroll_year
)

SELECT Enroll_year,
        ROUND((SELECT yearCancelled FROM Cancel_rate t2 WHERE t2.Enroll_year = t1.Enroll_year)*100.0/COUNT(*),1) AS cancel_percentage
FROM Customer t1
GROUP BY Enroll_year;



WITH Cancel_rate AS (
    SELECT Enroll_year, COUNT(*) AS yearCancelled
    FROM Customer
    WHERE Cancel_year != 'NULL' AND Enroll_type = 'Standard'
    GROUP BY Enroll_year
)

SELECT Enroll_year,
        ROUND((SELECT yearCancelled FROM Cancel_rate t2 WHERE t2.Enroll_year = t1.Enroll_year)*100.0/COUNT(*),1) AS cancel_percentage
FROM Customer t1
WHERE Enroll_type = 'Standard'
GROUP BY Enroll_year;
*/

WITH Cancel_rate AS (
    SELECT Enroll_year, 
           COUNT(*) AS yearCancelled,
           COUNT(CASE WHEN Enroll_type = 'Standard' THEN 1 END) AS standardCancelled
    FROM Customer
    WHERE Cancel_year != 'NULL'
    GROUP BY Enroll_year
)

SELECT t1.Enroll_year,
       ROUND(t2.yearCancelled * 100.0 / COUNT(*), 1) AS overall_cancel_percentage,
       ROUND(t2.standardCancelled * 100.0 / COUNT(CASE WHEN Enroll_type = 'Standard' THEN 1 END), 1) AS standard_cancel_percentage
FROM Customer t1
LEFT JOIN Cancel_rate t2 
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year, t2.yearCancelled, t2.standardCancelled
ORDER BY t1.Enroll_year;



-- CLV average at 2018 - Impact of the promotion

WITH CLV_rate AS (
    SELECT Enroll_year, 
           ROUND(AVG(CLV),2) AS avg_clv
    FROM Customer
    WHERE Enroll_type = 'Standard'
    GROUP BY Enroll_year
)

SELECT Enroll_year,
        ROUND(AVG(CLV),2) AS avg_clv,
        (SELECT avg_clv FROM CLV_rate t2 WHERE t1.Enroll_year = t2.Enroll_year) AS std_CLV
FROM Customer t1
GROUP BY Enroll_year;





-- Percentage of increase/decrease in points redeemed in 2018 from promotion

WITH points_Aggregated AS (
    SELECT 
        Year, 
        ROUND(AVG(Points),1) AS points_year,
        ROUND(AVG(CASE WHEN t2.Enroll_type = 'Standard' THEN Points ELSE 0 END),1) AS standard_points
    FROM Flights t1
    LEFT JOIN Customer t2
        ON t1.Loyalty_Number = t2.Loyalty_Number
    GROUP BY Year
)
SELECT 
    ROUND((f18.points_year - f17.points_year) * 100.0 / f17.points_year, 1) AS points_YoY,
    ROUND((f18.standard_points - f17.points_year) * 100.0 / f17.points_year, 1) AS points_std_YoY
FROM 
    points_Aggregated f17
JOIN 
    points_Aggregated f18
ON f17.Year = 2017 AND f18.Year = 2018;