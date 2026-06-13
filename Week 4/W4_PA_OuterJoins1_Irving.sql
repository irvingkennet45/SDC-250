-- Name: Kenneth Irving
/* Q1 */
SELECT  a.department_name,
        b.first_name,
        b.last_name
FROM l_departments a
LEFT OUTER JOIN l_employees b
  ON a.dept_code = b.dept_code;

/* Q2 */
SELECT  a.department_name,
        b.first_name,
        b.last_name
FROM l_employees b
RIGHT OUTER JOIN l_departments a
  ON a.dept_code = b.dept_code;

/* Q3 */
SELECT a.department_name,
       b.first_name,
       b.last_name
FROM l_departments a
FULL OUTER JOIN sec1405_employees b
  ON a.dept_code = b.dept_code;

/* Q4 */
SELECT * 
FROM l_departments

UNION

SELECT * FROM sec1407_departments;