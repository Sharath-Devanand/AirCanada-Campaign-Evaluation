/*


*/


--- AVG CLV

SELECT  Card_type,
        ROUND(AVG(CLV),1) AS avg_clv_card,
        (SELECT ROUND(AVG(CLV),1) FROM Customer WHERE Enroll_type = '2018 Promotion') AS total_clv_avg
FROM Customer
WHERE Enroll_type = '2018 Promotion'
GROUP BY Card_type;


-- Card Type Count

WITH total_cte AS (
    SELECT COUNT(*) AS count_all
    FROM Customer
    WHERE Enroll_type = '2018 Promotion'
)
SELECT Card_type,
        ROUND(COUNT(*)*100.0/(SELECT count_all FROM total_cte),1) AS Card_percent
FROM Customer
WHERE Enroll_type = '2018 Promotion'
GROUP BY Card_type;


-- Cancellation Count

SELECT COUNT(*) AS Cancel_count,
        (SELECT COUNT(*) FROM Customer WHERE Enroll_type = '2018 Promotion') AS Total_enrolled
FROM Customer
WHERE Enroll_type = '2018 Promotion' AND Cancel_year != 'NULL';