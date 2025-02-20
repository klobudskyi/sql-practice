# sql-practice

## Objective:
The primary objective of this project was to develop a solid foundation in SQL for data analytics, showcasing my ability to manipulate, analyze, and extract insights from datasets.

![screenshot-sql-practice](https://github.com/user-attachments/assets/c2e2bee8-d80f-4f10-b1a4-608c3e442587)

## Description:
For this project, I used [PostgreSQL](https://www.postgresql.org/about/) and [DBeaver](https://dbeaver.io/about/) to analyze and experiment with data from two datasets:
- [Data Science Salaries](https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023)
	- The dataset contains information on salaries in the field of Data Science, including data on the year of payment, level of experience, type of employment, position, salary, currency, etc.
- [DBeaver Sample Database](https://dbeaver.com/docs/dbeaver/Sample-Database/)
	- The dataset simulates a music store management system and contains information about customers, orders, music tracks, albums, artists, employees, etc.

The evolution of code application can be described by the phrase ‘from more to less.’ That is, from the practice of writing basic queries and working on common blocks of a typical SQL script, I moved on to studying deeper concepts and functions.
## Stages:
- Data preparation
	- uploading CSV data files to pgAdmin 4 and DBeaver ("data_science_salaries_data" and "dbeaver_sample_data");
- Writing basic queries and practising
	- practice_general, practice_subqueries та practice_left_join (CASE WHEN THEN END, LEFT JOIN and subqueries):
		- Salary ranking of ML Engineer Specialists in 2023
		- Сountry with the lowest salary for a Data Scientist in 2023
		- Top 5 salaries among all specialists who work completely remotely
		- Unique values for column
		- Quantity of unique column values
		- Average, minimal, and maximum salary in 2023
		- Top 5 ML Engineer salaries in 2023
		- Unique values of the remote_ratio column
		- Table data with an additional column 'exp_level_full'
		- Scanning all columns for missing values
		- All specialists with salaries above the average
		- All specialists who live in countries where the average salary is higher than the average salary for all countries
		- Minimal salary among the maximum salaries by country
		- The difference between the average and the maximum salary of all specialists
		- Data on the employee who receives the second highest salary in the table in each profession
- Gradual delving into each of the blocks of a typical SQL script:
	- 00_START:
		- Query with formatting and basic blocks
		- Top 5 Data Science salaries in 2023
		- Salary ranking of ML Engineer Specialists in 2023
		- Сountry with the lowest salary for a Data Scientist in 2023
		- Salaries of Ukrainians sorted in ascending order
		- Top 5 salaries among all specialists who work completely remotely
		- Data of all specialists who in 2023 had a salary of more than $100,000 and worked in medium-sized companies
	- 01_SELECT (MIN, MAX, AVG, ROUND, COUNT):
		- Returning values without using any source
		- Returning the number of values in a table/column and unique values in a column
		- Returning descriptive statistics for the specified column
		- Implementation of new columns by calculation and condition
		- Number of unique values for each column containing text values
		- Unique values for each column containing text values
		- Average, minimum and maximum salary for each year
		- Average salary for each level of employee experience in 2023
		- Top 5 salaries for ML Engineer Specialists in 2023 in UAH
		- Unique remote_ratio values with fractional data format and two decimal places
		- Data with an additional column 'exp_level_full' with the full name of the employees' experience levels according to the exp_level column
		- Data with an additional column 'salary_category', which displays different categories of salaries according to their value in the column 'salary_in_usd
		- Checking each column for missing values
		- Number of employees working for a M-size company with a salary above $100,000 in 2023
	- 02_WHERE (COUNT(DISTINCT)):
		- Filter for numeric columns
		- Filter for text columns
		- Combining filters with conditional operators
		- Specifying a range of values
		- Specifying a list of numeric values
		- Specifying a list of text values
		- Search for text based on a template
		- Filter for empty values
		- Employees who received a salary of more than $300,000 in 2023
		- Employees who received a salary of more than $300,000 and did not work for large companies in 2023
		- Employees who worked for the Ukrainian company completely remotely
		- Employees who worked in Germany and received a salary of more than $100,000 in 2023
		- Top 5 employees by salary level from the previous query
		- Previous query with specialists from Canada
		- List of countries where ML Engineer and Data Scientist specialists received salaries in the range of $50,000 to $100,000 in 2021
		- Number of specialists who worked remotely while working in medium and large companies
		- Number of countries starting with "C"
		- Professions whose names do not consist of three words
	- 03_GROUP_BY:
		- Quantity and average salary for each profession and the corresponding level of experience
		- Salaries for professions that occur only 2 times
		- Data on average salary and number of specialists for each year
	- 04_EDA (exploratory data analysis):
		- Number of rows
		- Missing values
		- Categorical data
		- Numeric data
		- Distribution
	- 05_JOIN:
		- Adding columns from another table
		- Grouping data after joins
	- 06_UNION:
		- 'DBeaver Sample Database' UNION example
		- 'DBeaver Sample Database' EXCEPT example
		- 'DBeaver Sample Database' INTERSECT example
		- 'salary_db' UNION example
	- 07_CTE (common table expressions):
		- CTE's combination with LEFT JOIN's
	- 08_WINDOW (window functions / ROW_NUMBER, RANK, DENSE_RANK, LAG, JULIANDAY, LEAD, FIRST_VALUE, LAST_VALUE):
		- Aggregation with grouping
		- Use of window aggregation functions
		- Employees whose salary exceeds the average salary for the profession they represent
		- Table ranking / ranking of invoices by amount for each customer
		- Offset from the current line
	- 09_ADMIN (database administration / CREATE, ALTER, INSERT, DROP):
		- Table editing and creation
## What's next?
I am now focused on gaining even more practical knowledge to apply this tool, so I am determined to do [SQL 50 by Leetcode](https://leetcode.com/studyplan/top-sql-50/).

I may upload my solutions to the problems here shortly.

Special thanks to [@NickTimosh](https://github.com/NickTimosh) for providing such a comprehensive and practical [course](https://youtu.be/HkT_VrzbXZQ?si=e1DUSv-jr5UuVLTR) that significantly contributed to my SQL journey.
