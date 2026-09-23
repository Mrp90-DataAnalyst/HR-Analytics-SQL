-- 1.2 Inner Join and Left Join Exercises
-- Business Context: Link employees to managers and department tables

-- EXERCISE 1.2.1 Show each employee and their manager's name
SELECT * FROM employees_sample;
SELECT 
	e.employee_id,
	CONCAT(e.first_name,' ',e.last_name) AS full_name,
    e.job_title,
    e.department,
    COALESCE(
		CONCAT(m.first_name,' ', m.last_name), 
        'No Manager'
	) as manager_name -- coalesce functions to give value if it's blank. similar to iferror in excel function
FROM employees_sample e
LEFT JOIN employees_sample m ON e.manager_id = m.employee_id
WHERE e.status = 'Active' 
ORDER BY e.department, e.employee_id;

-- EXERCISE 1.2.2 Join employees with payroll to show their latest pay info
SELECT * FROM payroll_sample;
SELECT 
	e.employee_id,
	CONCAT(e.first_name,' ',e.last_name) AS full_name,
    e.job_title,
    e.department,
    e.salary,
    p.pay_period,
    p.gross_salary,
    p.net_pay,
    p.payment_date
FROM employees_sample e
INNER JOIN payroll_sample p ON e.employee_id = p.employee_id
where e.status = 'Active' AND p.pay_period = '2024-03'
ORDER BY e.salary DESC;

-- EXERCISE 1.2.3 Identify employees missing email addresses (data quality check)
SELECT
	employee_id,
    concat(first_name,' ',last_name) as Full_name,
    department,
    email,
    CASE 
		WHEN email is NULL then 'Missing Email' 
        ELSE 'With Email' 
	END AS Email_status
FROM employees_sample;
-- WHERE email is null;
    
    