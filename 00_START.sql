-- Query with formatting and basic blocks:

SELECT 
	year
	, exp_level AS level
	, emp_type 	AS type
FROM salaries
WHERE 
	year != 2022
	AND exp_level = 'SE'
ORDER BY year ASC
LIMIT 20;

-- Top 5 Data Science salaries in 2023:

SELECT
	year
	, job_title
	, comp_location AS country
	, salary_in_usd
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'Data Scientist'
ORDER BY salary_in_usd DESC
LIMIT 5;

-- Salary ranking of ML Engineer Specialists in 2023:

SELECT
	year
	, job_title
	, comp_location AS country
	, salary_in_usd
FROM salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY 4 DESC;

-- Сountry with the lowest salary for a Data Scientist in 2023:

SELECT
	year
	, job_title
	, comp_location AS country
	, salary_in_usd
FROM salaries
WHERE
	year = 2023
	AND job_title = 'Data Scientist'
ORDER BY 4 ASC
LIMIT 1;

-- Salaries of Ukrainians sorted in ascending order:

SELECT
	year
	, job_title
	, comp_location AS country
	, salary_in_usd
FROM salaries
WHERE
	comp_location = 'UA'
ORDER BY 4 ASC;

-- Top 5 salaries among all specialists who work completely remotely:

SELECT
	year
	, job_title
	, salary_in_usd
FROM salaries
WHERE
	remote_ratio = 100
ORDER BY 3 DESC
LIMIT 5;

/* Data of all specialists who in 2023 had a salary of more than $100,000 
and worked in medium-sized companies: */

SELECT *
FROM salaries
WHERE
	year = 2023
	AND salary_in_usd > 100000
	AND comp_size = 'M';