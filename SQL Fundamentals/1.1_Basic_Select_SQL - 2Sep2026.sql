-- select exercises

SELECT * 
from hranalytics.employees_sample
ORDER BY hire_date DESC;

-- EXERCISE 1.1.1: List all active employees by department
SELECT 
	employee_id,
	CONCAT(first_name, ' ', last_name) AS full_name,
    department, 
    salary,
    job_title
FROM employees_sample
WHERE status = 'Active' and department = 'Engineering'
ORDER BY department, salary DESC; 

-- EXERCISE 1.1.2 Find all employees hired in the last 3 years (after 2021-01-01)
SELECT 
	employee_id,
	CONCAT(first_name, ' ', last_name) AS full_name,
    hire_date,
    department,
    salary
FROM employees_sample
WHERE hire_date >= '2021-01-01' AND status = 'Active'
ORDER BY hire_date DESC;

-- EXERCISE 1.1.3 Show salary distribution by status (Active vs Inactive)
SELECT 
	status,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary,
    COUNT(*) AS employee_count
FROM employees_sample
group by status; -- this analysis set the aggregated functions by grouping them

