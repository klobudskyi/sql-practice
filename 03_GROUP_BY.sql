-- Quantity and average salary for each profession and the corresponding level of experience:

SELECT
	job_title
	, exp_level
	, COUNT(*) AS num_job_title
	, ROUND(AVG(salary_in_usd),0) AS avg_salary_in_usd
FROM salaries
GROUP BY job_title, exp_level
ORDER BY 1,2;

-- Salaries for professions that occur only 2 times:

SELECT 
	job_title
	, ROUND(AVG(salary_in_usd),0) AS avg_salary_in_usd
FROM salaries
GROUP BY job_title
HAVING 
	COUNT(*) = 2
	AND ROUND(AVG(salary_in_usd * 41),0) > 4000000
ORDER BY 2 DESC;

-- Data on average salary and number of specialists for each year:

SELECT
	year
	, COUNT(*) AS num_emp
	, ROUND(AVG(salary_in_usd),0) AS avg_salary_in_usd
FROM salaries
GROUP BY 1
ORDER BY 3 DESC;