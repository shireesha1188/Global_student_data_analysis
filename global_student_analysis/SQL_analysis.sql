--1.Students with salary above their field average
SELECT student_id,field_of_study,starting_salary_usd FROM global_student_data s
WHERE starting_salary_usd >
    (SELECT AVG(starting_salary_usd) FROM global_student_data
	WHERE field_of_study=s.field_of_study)

--2.Universities with more students than the average university size

	SELECT university_name, COUNT(*) AS student_count
FROM global_student_data
GROUP BY university_name
HAVING COUNT(*) > (
    SELECT AVG(student_count)
    FROM (
        SELECT university_name, COUNT(*) AS student_count
        FROM global_student_data
        GROUP BY university_name
    ) AS uni
)
ORDER BY student_count DESC;

--3.Placed students in each company and highest and lowest salary of company

SELECT placement_company,COUNT(*) AS total_emp,MAX(starting_salary_usd) AS highest,MIN(starting_salary_usd) AS lowest
FROM global_student_data
WHERE placement_status='Placed'
GROUP BY placement_company
ORDER BY total_emp DESC

--4.Salary categories
SELECT CASE WHEN starting_salary_usd <40000 THEN 'LOW' 
WHEN starting_salary_usd BETWEEN 40000 AND 90000 THEN 'MEDIUM' 
ELSE 'HIGH'
END AS salary_category,
COUNT(*) AS total_emp FROM global_student_data
WHERE placement_status='Placed'
GROUP BY CASE WHEN starting_salary_usd <40000 THEN 'LOW' 
WHEN starting_salary_usd BETWEEN 40000 AND 90000 THEN 'MEDIUM' 
ELSE 'HIGH'
END

--5.Scholarship impact

SELECT CASE WHEN scholarship_received='Yes' AND placement_status='Placed' THEN 'Benefited'
WHEN scholarship_received='No' AND placement_status='Placed' THEN 'Self Success'
WHEN scholarship_received='Yes' AND placement_status='Not Placed' THEN 'Not Benefited'
ELSE 'Unplaced'
END AS category,COUNT(*) AS total_emp FROM global_student_data
GROUP BY  CASE WHEN scholarship_received='Yes' AND placement_status='Placed' THEN 'Benefited'
WHEN scholarship_received='No' AND placement_status='Placed' THEN 'Self Success'
WHEN scholarship_received='Yes' AND placement_status='Not Placed' THEN 'Not Benefited'
ELSE 'Unplaced'
END ;

--6.Top 3 companies per country by placements

WITH CTE AS (
SELECT destination_country,placement_company,COUNT(*) AS total,
ROW_NUMBER()OVER(PARTITION BY destination_country ORDER BY COUNT(*) DESC) AS rn
FROM global_student_data
WHERE placement_status='Placed'
GROUP BY destination_country,placement_company
)
SELECT destination_country,placement_company,total FROM CTE
WHERE rn <=3

