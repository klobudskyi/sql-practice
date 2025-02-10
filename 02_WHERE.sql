
-- Filter for numeric columns:

SELECT *
FROM salaries
WHERE
	year != 2023;

-- Filter for text columns:

SELECT *
FROM salaries
WHERE
	exp_level = 'MI';

-- Combining filters with conditional operators:

SELECT *
FROM salaries
WHERE
	exp_level = 'MI'
	AND (exp_level != 'MI'
	OR exp_level != 'MI');

-- Specifying a range of values:

SELECT DISTINCT year
FROM salaries
WHERE
	year NOT BETWEEN 2021 AND 2023;

-- Specifying a list of numeric values:

SELECT DISTINCT year
FROM salaries
WHERE
	year NOT IN (2020,2021);

-- Specifying a list of text values:

SELECT DISTINCT job_title
FROM salaries
WHERE
	job_title IN ('Data Analyst','Data Scientist');

-- Search for text based on a template:

SELECT DISTINCT job_title
FROM salaries
WHERE 1=1
	AND job_title iLIKE ('data_A%');

-- Filter for empty values:

SELECT COUNT(year)
FROM salaries
WHERE
	year IS NOT NULL;

-- Employees who received a salary of more than $300,000 in 2023:

SELECT
	job_title
	, salary_in_usd
FROM salaries
WHERE
	year = 2023
	AND salary_in_usd > 300000
ORDER BY 2 DESC;

-- Employees who received a salary of more than $300,000 and did not work for large companies in 2023:

SELECT
	job_title
	, salary_in_usd
FROM salaries
WHERE
	year = 2023
	AND comp_size != 'L'
	AND salary_in_usd > 300000
ORDER BY 2 DESC;

-- Employees who worked for the Ukrainian company completely remotely:

SELECT job_title
FROM salaries
WHERE
	comp_location = 'UA'
	AND remote_ratio = 100;

-- Employees who worked in Germany and received a salary of more than $100,000 in 2023:

SELECT job_title
FROM salaries
WHERE
	year = 2023
	AND comp_location = 'DE'
	AND salary_in_usd > 100000;

-- Top 5 employees by salary level from the previous query:

SELECT 
	job_title
	, salary_in_usd
FROM salaries
WHERE
	year = 2023
	AND comp_location = 'DE'
	AND salary_in_usd > 100000
ORDER BY 2 DESC
LIMIT 5;

-- Previous query with specialists from Canada:

SELECT 
	job_title
	, salary_in_usd
FROM salaries
WHERE
	year = 2023
	AND comp_location IN ('DE','CA')
	AND salary_in_usd > 100000
ORDER BY 2 DESC
LIMIT 5;

-- List of countries where ML Engineer and Data Scientist specialists received salaries in the range of $50,000 to $100,000 in 2021:

SELECT DISTINCT comp_location
FROM salaries
WHERE
	year = 2021
	AND job_title IN ('ML Engineer','Data Scientist')
	AND salary_in_usd BETWEEN 50000 AND 100000;

-- Number of specialists who worked remotely while working in medium and large companies:

SELECT COUNT(job_title)
FROM salaries
WHERE
	comp_size IN ('M','L')
	AND remote_ratio IN (50,100);
	
-- Number of countries starting with "C":

SELECT COUNT(DISTINCT comp_location)
FROM salaries
WHERE comp_location LIKE 'C%';

-- Professions whose names do not consist of three words:

SELECT DISTINCT job_title
FROM salaries
WHERE job_title NOT LIKE '% % %';

-- Solution option with 4 words or more:

SELECT DISTINCT job_title
FROM salaries
WHERE LENGTH(job_title) - LENGTH(REPLACE(job_title,' ','')) != 2
GROUP BY 1;