/*




*/


-- #flights booked by different enroll_years and #enrolled that year


SELECT  t2.Enroll_year,
        SUM(t1.Total_flights) AS Total_flights,
        ROUND(SUM(t1.Solo_flights)*100.0/SUM(t1.Total_flights),1) AS solo_percent,
        SUM(CASE WHEN t2.Enroll_year = t2.Cancel_year THEN t1.Total_flights ELSE 0 END) AS flights_thatYear
FROM Flights t1
LEFT JOIN Customer t2
    ON t1.Loyalty_Number = t2.Loyalty_Number
WHERE Year = '2017'
GROUP BY Enroll_year;



--- AVG(points redeemed) by different enroll_years and #enrolled that year

SELECT t2.Enroll_year,
    ROUND(AVG(t1.Points),1) AS avg_redeemed_points,
    ROUND(AVG(CASE WHEN t2.Enroll_year = t2.Cancel_year THEN t1.Total_flights ELSE 0 END),3) AS points_thatYear
FROM Flights t1
LEFT JOIN Customer t2
    ON t1.Loyalty_Number = t2.Loyalty_Number
GROUP BY t2.Enroll_year