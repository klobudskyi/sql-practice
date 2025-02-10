-- All specialists with salaries above the average:

SELECT *
FROM salaries
WHERE salary_in_usd > -- comparison with avg_salary
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)
	AND year = 2023;

/* All specialists who live in countries where the average salary is higher 
than the average salary for all countries: */

SELECT *
FROM salaries
WHERE emp_location IN
(
	SELECT
		comp_location
	FROM salaries
	GROUP BY 1
	HAVING AVG(salary_in_usd) >
	(
		SELECT AVG(salary_in_usd)
		FROM salaries
	)
);

-- Minimal salary among the maximum salaries by country:

SELECT MIN(salary_in_usd)		AS salary_in_usd
FROM 
(
	SELECT	
		comp_location
		, MAX(salary_in_usd) 	AS salary_in_usd
	FROM salaries
	GROUP BY 1
);

-- Alternative option:

SELECT	
	MAX(salary_in_usd) 			AS salary_in_usd
FROM salaries
GROUP BY comp_location
ORDER BY 1 ASC
LIMIT 1;

/* The difference between the average and the maximum salary of all specialists
in each profession: */

SELECT
	job_title
	, ROUND(AVG(salary_in_usd),0) -
(
	SELECT MAX(salary_in_usd)
	FROM salaries
) AS diff_salary
FROM salaries
GROUP BY 1;

-- Data on the employee who receives the second highest salary in the table:

SELECT *
FROM
(
	SELECT *
	FROM salaries
	ORDER BY salary_in_usd DESC
	LIMIT 2
)
ORDER BY salary_in_usd ASC
LIMIT 1;

-- Alternative option:

SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 1 OFFSET 1;