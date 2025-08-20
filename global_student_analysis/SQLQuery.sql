-- 1.universities with most popular education type

WITH cte AS (
    SELECT university_name,education_type,COUNT(*) AS student_count,
        RANK() OVER (PARTITION BY university_name ORDER BY COUNT(*) DESC) AS rnk
    FROM global_student_data
    GROUP BY university_name, education_type
)
SELECT university_name,education_type,student_count FROM cte
WHERE rnk = 1;

--2.how many students whco score language test got scholarship
SELECT 
    language_proficiency_test,
    SUM(CASE WHEN scholarship_received = 'Yes' THEN 1 ELSE 0 END) AS received_count,
    SUM(CASE WHEN scholarship_received = 'No'  THEN 1 ELSE 0 END) AS not_received_count
FROM global_student_data
GROUP BY language_proficiency_test;

--3.Placement trends over years

SELECT year_of_enrollment,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
       SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS placement_rate
FROM global_student_data
GROUP BY year_of_enrollment
ORDER BY year_of_enrollment;

--4.Top universities according to feild_study
with cte as(
select field_of_study,university_name,destination_country,count(*) as total ,
row_number() over(partition by field_of_study order by count(*)desc) as rnk
 from global_student_data
 group by field_of_study,university_name,destination_country
)

select field_of_study,university_name,destination_country,total ,rnk from cte
where rnk=1;

--5.which destination city is top according to feild_study
with cte as(
select destination_country,field_of_study,count(*) as total ,
rank() over(partition by destination_country order by count(*)desc) as rnk
 from global_student_data
 group by destination_country,field_of_study
)

select destination_country,field_of_study,total ,rnk from cte
where rnk=1;

--6.placement_company trends according to country

WITH CTE AS(

SELECT placement_company,destination_country,COUNT(*) AS total ,
RANK()OVER(PARTITION BY placement_company ORDER BY COUNT(*) DESC) AS rnk
FROM global_student_data
WHERE placement_status='Placed'
GROUP BY placement_company,destination_country
)

SELECT placement_company,destination_country ,rnk FROM CTE
WHERE rnk=1;






