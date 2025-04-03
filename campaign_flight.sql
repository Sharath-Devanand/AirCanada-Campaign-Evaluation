/*


*/

-- Campaign Flights

SELECT (SELECT SUM(Total_flights) FROM Flights WHERE Year = '2017') AS flights_2017,
        SUM(Total_flights) AS flights_promo,
        (SELECT SUM(Total_flights) FROM Flights WHERE Year = '2018') AS flights_2018,
        ROUND(SUM(Total_flights)*100.0/(SELECT SUM(Total_flights) FROM Flights WHERE Year = '2018'),2) AS flight_promo_percent
FROM Flights t1
LEFT JOIN Customer t2
    ON t1.Loyalty_Number = t2.Loyalty_Number
WHERE t2.Enroll_type = '2018 Promotion' AND t1.year = '2018';


WITH yearFlight AS
(SELECT Month,
        (SELECT SUM(Total_flights) FROM Flights t2 WHERE Year = '2017' AND t2.Month = t1.Month GROUP BY Month) AS monthFlights_2017,
        (SELECT SUM(Total_flights) FROM Flights t3 WHERE Year = '2018' AND t3.Month = t1.Month GROUP BY Month) AS monthFlights_2018,
        (SELECT SUM(Total_flights) FROM Flights t3 LEFT JOIN Customer t4 ON t3.Loyalty_Number = t4.Loyalty_Number WHERE Year = '2018' AND t3.Month = t1.Month AND t4.Enroll_type = 'Standard' GROUP BY Month) AS monthFlights_std_2018
FROM Flights t1
GROUP BY Month)
SELECT *,
        ROUND((monthFlights_2018-monthFlights_2017)*100.0/monthFlights_2017,1) AS MoM_overall,
        ROUND((monthFlights_std_2018-monthFlights_2017)*100.0/monthFlights_2017,1) AS MoM_std
FROM yearFlight;


-- Points Redeemed AVG


SELECT (SELECT ROUND(AVG(Points),1) FROM Flights WHERE Year = '2017') AS redeemed_points_2017,
        ROUND(AVG(Points),1) AS redeemed_point_promo,
        (SELECT ROUND(AVG(Points),1) FROM Flights WHERE Year = '2018') AS redeemed_points_2018,
        ROUND(ROUND(AVG(Points),1)*100.0/(SELECT AVG(Points) FROM Flights WHERE Year = '2018'),1) AS redeemed_promo_percent
FROM Flights t1
LEFT JOIN Customer t2
    ON t1.Loyalty_Number = t2.Loyalty_Number
WHERE t2.Enroll_type = '2018 Promotion' AND t1.year = '2017';


WITH yearFlight AS
(SELECT Month,
        (SELECT ROUND(AVG(Points),1) FROM Flights t2 WHERE Year = '2017' AND t2.Month = t1.Month GROUP BY Month) AS month_avg_points_2017,
        (SELECT ROUND(AVG(Points),1) FROM Flights t3 WHERE Year = '2018' AND t3.Month = t1.Month GROUP BY Month) AS month_avg_points_2018,
        (SELECT ROUND(AVG(Points),1) FROM Flights t3 LEFT JOIN Customer t4 ON t3.Loyalty_Number = t4.Loyalty_Number WHERE Year = '2018' AND t3.Month = t1.Month AND t4.Enroll_type = 'Standard' GROUP BY Month) AS month_avg_points_std_2018
FROM Flights t1
GROUP BY Month)
SELECT *,
        ROUND((month_avg_points_2018-month_avg_points_2017)*100.0/month_avg_points_2017,1) AS MoM_overall,
        ROUND((month_avg_points_std_2018-month_avg_points_2017)*100.0/month_avg_points_2017,1) AS MoM_std
FROM yearFlight;
