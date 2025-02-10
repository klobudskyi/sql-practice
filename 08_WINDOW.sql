-- Aggregation with grouping:
 
select 
	job_title
	, ROUND(AVG(salary_in_usd),0) as avg_salary
from salaries
group by 1;

-- Use of window aggregation functions:

with cte as (

	select
		job_title
		, salary_in_usd
		, SUM(salary_in_usd)	over (partition by job_title)	as sum_salary
		, AVG(salary_in_usd)	over (partition by job_title)	as avg_salary
		, MIN(salary_in_usd)	over (partition by job_title)	as min_salary
		, MAX(salary_in_usd)	over (partition by job_title)	as max_salary
		, COUNT(salary_in_usd)	over (partition by job_title)	as count_job
	from salaries s 

)

select *
	, salary_in_usd::float / max_salary as ratio_max
	, salary_in_usd::float / avg_salary as ratio_avg
from cte

-- Employees whose salary exceeds the average salary for the profession they represent:

with cte as (

	select
		job_title
		, salary_in_usd
		, AVG(salary_in_usd)	over (partition by job_title)	as avg_salary
	from salaries s

)

select *
from cte
where salary_in_usd > avg_salary

-- Table ranking / ranking of invoices by amount for each customer:

WITH cte AS
( 

	select
		InvoiceId
		, CustomerId
		, Total
		, ROW_NUMBER() 	over(partition by CustomerId order by Total DESC) as invoice_num
		, RANK() 	over(partition by CustomerId order by Total DESC) as invoice_rank
		, DENSE_RANK()	over(partition by CustomerId order by Total DESC) as invoice_dense_rank
	from Invoice
	Order by CustomerId 

)

SELECT *
FROM cte
WHERE invoice_num = 1

-- Offset from the current line:

SELECT
	InvoiceId
	, CustomerId
	, InvoiceDate
	, Total
	, LAG(Total, 1) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate)						AS lag_total
	, LAG(InvoiceDate, 1) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate)					AS lag_total
	, JULIANDAY(InvoiceDate) - JULIANDAY(LAG(InvoiceDate, 1) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate))	AS diff_in_days
	, LEAD(Total, 1) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate)						AS lead_total
 	, FIRST_VALUE(Total) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate ASC)					AS first_amount
	, LAST_VALUE(Total) OVER(PARTITION BY CustomerId)								AS last_amount
FROM Invoice
ORDER BY CustomerId
