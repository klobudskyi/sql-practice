-- Number of rows:

SELECT COUNT(*)
FROM salaries;

-- Missing values:

SELECT 
	COUNT(*)
	, COUNT(*) - COUNT(salary_in_usd) AS missing_values
FROM salaries;

-- Categorical data:

SELECT
	job_title
	, COUNT(*)
FROM salaries
GROUP BY 1
ORDER BY 2 DESC;

-- Numeric data:

SELECT
	job_title
	, exp_level
	, MIN(salary_in_usd)
	, MAX(salary_in_usd)
	, ROUND(AVG(salary_in_usd),0) 		AS avg
	, ROUND(variance(salary_in_usd),0) 	AS var
	, ROUND(stddev(salary_in_usd),0) 	AS stddev
FROM salaries
GROUP BY 1, 2
ORDER BY 1, 2;

-- Distribution:

SELECT
	salary_in_usd
	, COUNT(*)
FROM salaries
GROUP BY 1
ORDER BY 2 DESC;

SELECT
	CASE
		WHEN salary_in_usd <= 10000	THEN 'A'
		WHEN salary_in_usd <= 20000	THEN 'B'
		WHEN salary_in_usd <= 50000	THEN 'C'
		WHEN salary_in_usd <= 100000	THEN 'D'
		WHEN salary_in_usd <= 200000	THEN 'E'
		ELSE 'F'
	END AS salary_category
	, COUNT(*)
FROM salaries
GROUP BY 1
ORDER BY 1;

SELECT
	corr(remote_ratio, salary_in_usd)
FROM salaries;
