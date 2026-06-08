-- Comment line: Kenneth Irving | Q1
SELECT first_name, last_name, dept_code
FROM l_employees
WHERE dept_code IN ('SAL', 'SHP', 'ACT');

-- Comment line: Kenneth Irving | Q2
SELECT employee_id, first_name, last_name
FROM l_employees
WHERE employee_id BETWEEN 201 AND 205;

-- Comment line: Kenneth Irving | Q3
SELECT employee_id, first_name, last_name
FROM l_employees
WHERE employee_id LIKE '%1%';

-- Comment line: Kenneth Irving | Q4
SELECT *
FROM l_employees
WHERE manager_id IS NULL;

-- Comment line: Kenneth Irving | Q5.1
SELECT department_name AS dept
FROM l_departments
ORDER BY department_name;

-- Comment line: Kenneth Irving | Q5.2
SELECT department_name AS dept
FROM l_departments
ORDER BY 1;