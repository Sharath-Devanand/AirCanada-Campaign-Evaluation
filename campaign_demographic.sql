/*


*/


--- Gender

WITH total_cte AS (
    SELECT COUNT(*) AS count_all
    FROM Customer
    WHERE Enroll_type = '2018 Promotion'
)
SELECT Gender,
        ROUND(COUNT(*)*100.0/(SELECT count_all FROM total_cte),1) AS Gender_percent
FROM Customer
WHERE Enroll_type = '2018 Promotion'
GROUP BY Gender;



-- Marital Status


WITH total_cte AS (
    SELECT COUNT(*) AS count_all
    FROM Customer
    WHERE Enroll_type = '2018 Promotion'
)
SELECT Marital_status,
        ROUND(COUNT(*)*100.0/(SELECT count_all FROM total_cte),1) AS Marital_percent
FROM Customer
WHERE Enroll_type = '2018 Promotion'
GROUP BY Marital_status;


-- Education

WITH total_cte AS (
    SELECT COUNT(*) AS count_all
    FROM Customer
    WHERE Enroll_type = '2018 Promotion'
)
SELECT Education,
        ROUND(COUNT(*)*100.0/(SELECT count_all FROM total_cte),1) AS Edu_percent
FROM Customer
WHERE Enroll_type = '2018 Promotion'
GROUP BY Education;

-- Province

WITH total_cte AS (
    SELECT COUNT(*) AS count_all
    FROM Customer
    WHERE Enroll_type = '2018 Promotion'
)
SELECT Province,
        ROUND(COUNT(*)*100.0/(SELECT count_all FROM total_cte),1) AS Location_percent
FROM Customer
WHERE Enroll_type = '2018 Promotion'
GROUP BY Province
ORDER BY Location_percent DESC
LIMIT 3;

-- Salary

WITH total_cte AS (
    SELECT COUNT(*) AS count_all
    FROM Customer
    WHERE Enroll_type = '2018 Promotion'
),
Salary_categ AS(
    SELECT 
        Loyalty_Number,
        CASE 
            WHEN Salary BETWEEN 9000 AND 100000 THEN 'Poor'
            WHEN Salary BETWEEN 100001 AND 300000 THEN 'Average'
            WHEN Salary BETWEEN 300001 AND 410000 THEN 'Rich'
            ELSE 'Unknown'
        END AS Salary_bracket
    FROM Salary
)
SELECT t2.Salary_bracket,
        ROUND(COUNT(*)*100.0/(SELECT count_all FROM total_cte),1) AS Salary_percent
FROM Customer t1
LEFT JOIN Salary_categ t2
    ON t1.Loyalty_Number = t2.Loyalty_Number
WHERE Enroll_type = '2018 Promotion'
GROUP BY t2.Salary_bracket;