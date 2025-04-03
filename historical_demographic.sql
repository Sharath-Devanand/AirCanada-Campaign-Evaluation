/*



*/


CREATE VIEW IF NOT EXISTS  yearMembers AS
SELECT Enroll_year,
    COUNT(*) AS year_members
FROM Customer
WHERE Enroll_year BETWEEN 2013 AND 2017
GROUP BY Enroll_year;




--- Gender


WITH gender_cte AS (
    SELECT Enroll_year,
        Gender,
        COUNT(*) as gender_count
    FROM Customer
    WHERE Enroll_year BETWEEN 2013 AND 2017
    GROUP BY Enroll_year, Gender
)
SELECT t1.Enroll_year,
    ROUND(COALESCE(SUM(CASE WHEN t2.Gender = 'Male'
                        THEN t2.gender_count
                        END)*100.0/t1.year_members,0),1) AS male_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Gender = 'Female'
                        THEN t2.gender_count
                        END)*100.0/t1.year_members,0),1) AS female_percent
FROM yearMembers t1
LEFT JOIN gender_cte t2
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year
ORDER BY t1.Enroll_year;
                    




--- Marital Status

WITH marital_cte AS (
    SELECT Enroll_year,
        Marital_status,
        COUNT(*) as marital_count
    FROM Customer
    WHERE Enroll_year BETWEEN 2013 AND 2017
    GROUP BY Enroll_year, Marital_status
)
SELECT t1.Enroll_year,
    ROUND(COALESCE(SUM(CASE WHEN t2.Marital_status = 'Single'
                        THEN t2.marital_count
                        END)*100.0/t1.year_members,0),1) AS single_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Marital_status = 'Married'
                        THEN t2.marital_count
                        END)*100.0/t1.year_members,0),1) AS married_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Marital_status = 'Divorced'
                        THEN t2.marital_count
                        END)*100.0/t1.year_members,0),1) AS divorced_percent
FROM yearMembers t1
LEFT JOIN marital_cte t2
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year
ORDER BY t1.Enroll_year;
                    




--- Education

WITH edu_cte AS (
    SELECT Enroll_year,
        Education,
        COUNT(*) as edu_count
    FROM Customer
    WHERE Enroll_year BETWEEN 2013 AND 2017
    GROUP BY Enroll_year, Education
)
SELECT t1.Enroll_year,
    ROUND(COALESCE(SUM(CASE WHEN t2.Education = 'High School or Below'
                        THEN t2.edu_count
                        END)*100.0/t1.year_members,0),1) AS highschool_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Education = 'College'
                        THEN t2.edu_count
                        END)*100.0/t1.year_members,0),1) AS college_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Education = 'Bachelor'
                        THEN t2.edu_count
                        END)*100.0/t1.year_members,0),1) AS bachelors_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Education = 'Master'
                        THEN t2.edu_count
                        END)*100.0/t1.year_members,0),1) AS masters_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Education = 'Doctor'
                        THEN t2.edu_count
                        END)*100.0/t1.year_members,0),1) AS doctor_percent
FROM yearMembers t1
LEFT JOIN edu_cte t2
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year
ORDER BY t1.Enroll_year;


--- Location  - Province



WITH loc_cte AS (
    SELECT Enroll_year,
        Province,
        COUNT(*) as loc_count
    FROM Customer
    WHERE Enroll_year BETWEEN 2013 AND 2017
    GROUP BY Enroll_year, Province
)
SELECT t1.Enroll_year,
    ROUND(COALESCE(SUM(CASE WHEN t2.Province = 'Ontario'
                        THEN t2.loc_count
                        END)*100.0/t1.year_members,0),1) AS ontario_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Province = 'British Columbia'
                        THEN t2.loc_count
                        END)*100.0/t1.year_members,0),1) AS bcolumbia_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.Province = 'Quebec'
                        THEN t2.loc_count
                        END)*100.0/t1.year_members,0),1) AS quebec_percent
FROM yearMembers t1
LEFT JOIN loc_cte t2
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year
ORDER BY t1.Enroll_year;
                    
-- Salary

WITH CustomerSalary AS (
    SELECT Enroll_year,
            CASE 
                WHEN t2.Salary BETWEEN 9000 AND 100000 THEN 'Poor'
                WHEN t2.Salary BETWEEN 100001 AND 300000 THEN 'Average'
                WHEN t2.Salary BETWEEN 300001 AND 410000 THEN 'Rich'
                ELSE 'Unknown'
            END AS SalaryCat
    FROM Customer t1
    LEFT JOIN Salary t2
        ON t1.Loyalty_Number = t2.Loyalty_Number
    
),
sal_cte AS (
    SELECT Enroll_year,
        SalaryCat,
        COUNT(*) as sal_count
    FROM CustomerSalary
    WHERE Enroll_year BETWEEN 2013 AND 2017
    GROUP BY Enroll_year, SalaryCat
)
SELECT t1.Enroll_year,
    ROUND(COALESCE(SUM(CASE WHEN t2.SalaryCat = 'Poor'
                        THEN t2.sal_count
                        END)*100.0/t1.year_members,0),1) AS poor_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.SalaryCat = 'Average'
                        THEN t2.sal_count
                        END)*100.0/t1.year_members,0),1) AS average_percent,
    ROUND(COALESCE(SUM(CASE WHEN t2.SalaryCat = 'Rich'
                        THEN t2.sal_count
                        END)*100.0/t1.year_members,0),1) AS rich_percent
FROM yearMembers t1
LEFT JOIN sal_cte t2
    ON t1.Enroll_year = t2.Enroll_year
GROUP BY t1.Enroll_year
ORDER BY t1.Enroll_year;