-- 'DBeaver Sample Database' UNION example:

SELECT  
	'Customer' AS Type
	, c.Email 
FROM Customer c

UNION

SELECT 
	'Employee' AS Type
	, e.Email 
FROM Employee e;

-- 'DBeaver Sample Database' EXCEPT example:

SELECT  
	'Customer' AS Type
	, c.Email 
FROM Customer c

EXCEPT

SELECT 
	'Employee' AS Type
	, e.Email 
FROM Employee e;

-- 'DBeaver Sample Database' INTERSECT example:

SELECT  
	'Customer' AS Type
	, c.Email 
FROM Customer c

INTERSECT

SELECT 
	'Employee' AS Type
	, e.Email 
FROM Employee e;

-- 'salary_db' UNION example:

SELECT
	'min_salary'		AS parameter
	, MIN(salary_in_usd)	AS value
FROM salaries

UNION

SELECT
	'max_salary'		AS parameter
	, MAX(salary_in_usd)	AS value
FROM salaries;
