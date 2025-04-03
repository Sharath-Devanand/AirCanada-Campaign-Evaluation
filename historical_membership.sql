/*



*/


-- Average CLV

SELECT Enroll_year,
    COUNT(*) AS Members_Count,
    ROUND(AVG(CLV),1) as avg_CLV
FROM Customer
GROUP BY Enroll_year;


-- Cancellation in that year and history before


SELECT Enroll_year,
        COUNT(Cancel_year) AS cancel_count,
        SUM(CASE WHEN Enroll_year = Cancel_year THEN 1 ELSE 0 END) AS cancel_thatYear,
        ROUND(SUM(CASE WHEN Enroll_year = Cancel_year THEN 1 ELSE 0 END)*100.0/COUNT(Cancel_year),1) AS cancel_thatyear_percent
FROM Customer t1
WHERE Cancel_year != 'NULL'
GROUP BY Enroll_year;


-- Card type

WITH card_cte AS (
    SELECT Enroll_year,
        Card_type,
        COUNT(*) as card_count
    FROM Customer
    WHERE Enroll_year BETWEEN 2013 AND 2017
    GROUP BY Enroll_year, Card_type
)
SELECT t1.Enroll_year,
    ROUND(COALESCE(SUM(CASE WHEN t2.Card_type = 'Star'
                        THEN t2.card_count
                        END)*100.0/t1.year_members,0),1) AS star_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Card_type = 'Nova'
                        THEN t2.card_count
                        END)*100.0/t1.year_members,0),1) AS nova_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Card_type = 'Aurora'
                        THEN t2.card_count
                        END)*100.0/t1.year_members,0),1) AS aurora_percent
FROM yearMembers t1
LEFT JOIN card_cte t2
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year
ORDER BY t1.Enroll_year;
