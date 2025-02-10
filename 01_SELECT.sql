-- Returning values without using any source:

SELECT
	1 	AS nmb_1
	, 2 	AS nmb_2
	, 5 + 5	AS nmb_3;

-- Returning the number of values in a table/column and unique values in a column:

SELECT
	COUNT(*) 		AS cnt_all
	, COUNT(exp_level)	AS cnt_level
	, COUNT(DISTINCT exp_level) 
FROM salaries
LIMIT 10;

-- Returning descriptive statistics for the specified column:

SELECT
	AVG(salary_in_usd)	AS salary_avg
	, MIN(salary_in_usd) 	AS salary_min
	, MAX(salary_in_usd) 	AS salary_max
FROM salaries
WHERE year = '2023'
LIMIT 10;

-- Implementation of new columns by calculation and condition:

SELECT
	year
	, exp_level
	, salary_in_usd
	, salary_in_usd * 38 AS salary_in_uah
	-- 'SE' - Senior
	-- 'MI' - Middle
	-- Other - Other
	, CASE
		WHEN exp_level = 'SE'
		THEN 'Senior'
		WHEN exp_level = 'MI'
		THEN 'Middle'
		ELSE 'Other' END AS full_level
FROM salaries
LIMIT 10;

-- Number of unique values for each column containing text values:

SELECT
	COUNT(DISTINCT exp_level) 		AS unique_exp_level
	, COUNT(DISTINCT emp_type) 		AS unique_emp_type
	, COUNT(DISTINCT job_title) 		AS unique_job_title
	, COUNT(DISTINCT salary_cur) 		AS unique_salary_cur
	, COUNT(DISTINCT emp_location) 		AS unique_emp_location
	, COUNT(DISTINCT comp_location) 	AS unique_comp_location
	, COUNT(DISTINCT comp_size) 		AS unique_comp_size
FROM salaries;

-- Unique values for each column containing text values:

SELECT DISTINCT exp_level 		AS unique_exp_level
FROM salaries
ORDER BY 1 ASC;

SELECT DISTINCT emp_type 		AS unique_emp_type
FROM salaries
ORDER BY 1 ASC;

SELECT DISTINCT job_title 		AS unique_job_title
FROM salaries
ORDER BY 1 ASC;

SELECT DISTINCT salary_cur 		AS unique_salary_cur
FROM salaries
ORDER BY 1 ASC;

SELECT DISTINCT emp_location 		AS unique_emp_location
FROM salaries
ORDER BY 1 ASC;

SELECT DISTINCT comp_location 		AS unique_comp_location
FROM salaries
ORDER BY 1 ASC;

SELECT DISTINCT comp_size 		AS unique_comp_size
FROM salaries
ORDER BY 1 ASC;

-- Average, minimum and maximum salary for each year:

SELECT
	ROUND(AVG(salary_in_usd),0)	AS avg_salary_2020
	, MIN(salary_in_usd)		AS min_salary_2020
	, MAX(salary_in_usd)		AS max_salary_2020
FROM salaries
WHERE
	year = '2020';

SELECT
	ROUND(AVG(salary_in_usd),0)	AS avg_salary_2021
	, MIN(salary_in_usd)		AS min_salary_2021
	, MAX(salary_in_usd)		AS max_salary_2021
FROM salaries
WHERE
	year = '2021';

SELECT
	ROUND(AVG(salary_in_usd),0)	AS avg_salary_2022
	, MIN(salary_in_usd) 		AS min_salary_2022
	, MAX(salary_in_usd) 		AS max_salary_2022
FROM salaries
WHERE
	year = '2022';

SELECT
	ROUND(AVG(salary_in_usd),0)	AS avg_salary_2023
	, MIN(salary_in_usd) 		AS min_salary_2023
	, MAX(salary_in_usd) 		AS max_salary_2023
FROM salaries
WHERE
	year = '2023';
	
-- Average salary for each level of employee experience in 2023:

SELECT ROUND(AVG(salary_in_usd),0) AS avg_EN_salary_2023
FROM salaries
WHERE year = '2023' AND exp_level = 'EN';

SELECT ROUND(AVG(salary_in_usd),0) AS avg_EX_salary_2023
FROM salaries
WHERE year = '2023' AND exp_level = 'EX';

SELECT ROUND(AVG(salary_in_usd),0) AS avg_MI_salary_2023
FROM salaries
WHERE year = '2023' AND exp_level = 'MI';

SELECT ROUND(AVG(salary_in_usd),0) AS avg_SE_salary_2023
FROM salaries
WHERE year = '2023' AND exp_level = 'SE';

-- Top 5 salaries for ML Engineer Specialists in 2023 in UAH:  

SELECT 
	year
	, job_title
	, salary_in_usd * 41 AS salary_in_uah
FROM salaries
WHERE 
	year = '2023' 
	AND job_title = 'ML Engineer'
ORDER BY 3 DESC
LIMIT 5;

-- Unique remote_ratio values with fractional data format and two decimal places:

SELECT DISTINCT ROUND(remote_ratio/100.0,2) AS unique_remote_ratio
FROM salaries
ORDER BY 1 DESC;

-- Data with an additional column 'exp_level_full' with the full name of the employees' experience levels according to the exp_level column: 

	-- 'SE' - Senior-level
	-- 'MI' - Middle-level
	-- 'EX' - Executive-level
	-- 'EN' - Entry-level

SELECT *
	, CASE
		WHEN exp_level = 'SE' THEN 'Senior-level'
		WHEN exp_level = 'MI' THEN 'Middle-level'
		WHEN exp_level = 'EX' THEN 'Executive-level'
		WHEN exp_level = 'EN' THEN 'Entry-level'
	  END AS exp_level_full
FROM salaries;
/* Data with an additional column 'salary_category', which displays different categories of salaries
according to their value in the column 'salary_in_usd: */

	-- salary <= 20 000 - Category 1
	-- salary <= 50 000 - Category 2
	-- salary <= 100 000 - Category 3
	-- salary > 100 000 - Category 4

SELECT *
	, CASE
		WHEN salary_in_usd <= 20000	THEN 'Category 1'
		WHEN salary_in_usd <= 50000	THEN 'Category 2'
		WHEN salary_in_usd <= 100000	THEN 'Category 3'
		ELSE 'Category 4'
	  END AS salary_category
FROM salaries;

-- Checking each column for missing values:

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(year) 					AS dist_rows
	, COUNT(*) - COUNT(year) 			AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(exp_level) 				AS dist_rows
	, COUNT(*) - COUNT(exp_level) 			AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(emp_type) 				AS dist_rows
	, COUNT(*) - COUNT(emp_type) 			AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(job_title) 				AS dist_rows
	, COUNT(*) - COUNT(job_title) 			AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(salary) 				AS dist_rows
	, COUNT(*) - COUNT(salary) 			AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(salary_cur) 				AS dist_rows
	, COUNT(*) - COUNT(salary_cur)			AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(salary_in_usd) 				AS dist_rows
	, COUNT(*) - COUNT(salary_in_usd) 		AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(emp_location) 				AS dist_rows
	, COUNT(*) - COUNT(emp_location) 		AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(remote_ratio) 				AS dist_rows
	, COUNT(*) - COUNT(remote_ratio) 		AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(comp_location) 				AS dist_rows
	, COUNT(*) - COUNT(comp_location) 		AS null_rows
FROM salaries;

SELECT
	COUNT(*) 					AS total_rows
	, COUNT(comp_size) 				AS dist_rows
	, COUNT(*) - COUNT(comp_size) 			AS null_rows
FROM salaries;

-- Number of employees working for a M-size company with a salary above $100,000 in 2023:

SELECT COUNT(salary_in_usd)
FROM salaries
WHERE
	year = '2023'
	AND comp_size = 'M'
	AND salary_in_usd >= 100000;
