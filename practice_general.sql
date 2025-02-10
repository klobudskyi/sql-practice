-- Salary ranking of ML Engineer Specialists in 2023:

SELECT
	year
	, job_title
	, salary_in_usd AS salary
FROM salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY 3 ASC
LIMIT 10;

-- Сountry with the lowest salary for a Data Scientist in 2023:

SELECT
	year
	, job_title
	, comp_location
	, salary_in_usd AS salary
FROM salaries
WHERE
	year = 2023
	AND job_title = 'Data Scientist'
ORDER BY 4 ASC
LIMIT 1;

-- Top 5 salaries among all specialists who work completely remotely:

SELECT
	job_title
	, salary_in_usd
FROM salaries
WHERE
	remote_ratio = 100
ORDER BY 2 DESC
LIMIT 5;

-- Unique values for column:

SELECT DISTINCT remote_ratio
FROM salaries
ORDER BY 1 ASC;

-- Quantity of unique column values:

SELECT COUNT(DISTINCT comp_location)
FROM salaries;

-- Average, minimal, and maximum salary in 2023:

SELECT
	ROUND(AVG(salary_in_usd),0)	AS avg_salary
	, MIN(salary_in_usd)		AS min_salary
	, MAX(salary_in_usd)		AS max_salary
FROM salaries
WHERE
	year = 2023;

-- Top 5 ML Engineer salaries in 2023:

SELECT
	(salary_in_usd * 41) AS salary_in_uah
FROM salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER by 1 DESC
LIMIT 5;

-- Unique values of the remote_ratio column:

SELECT
	DISTINCT ROUND((remote_ratio/100.0),2) AS unique_remote_ratio
FROM salaries
ORDER BY 1 DESC;

-- Table data with an additional column 'exp_level_full':

SELECT *
	, CASE
		WHEN exp_level = 'SE' THEN 'Senior-level'
		WHEN exp_level = 'MI' THEN 'Middle-level'
		WHEN exp_level = 'EX' THEN 'Executive-level'
		WHEN exp_level = 'EN' THEN 'Entry-level'
	  END AS exp_level_full
FROM salaries;

SELECT *
	, CASE
		WHEN salary_in_usd <= 50000		THEN 'Category 1'
		WHEN salary_in_usd <= 100000	THEN 'Category 2'
		WHEN salary_in_usd <= 150000	THEN 'Category 3'
		WHEN salary_in_usd > 150000		THEN 'Category 4'
	  END AS salary_category
FROM salaries;

-- Scanning all columns for missing values:

SELECT
	COUNT(*)
	, COUNT(year)
	, COUNT(*) - COUNT(year)
FROM salaries;