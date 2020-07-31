SELECT e.emp_no AS "Employee Number",
	     e.last_name AS "Last Name",
	     e.first_name AS "First Name",
	     e.sex AS "Sex",
	     s.salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
  ON e.emp_no = s.emp_no;



SELECT first_name AS "First Name",
	     last_name AS "Last Name",
	     hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = '1986';



SELECT d.dept_no AS "Department Number",
	     d.dept_name AS "Department Name",
	     dm.emp_no AS "Employee Number",
		   e.last_name AS "Last Name",
		   e.first_name AS "First Name"
FROM departments AS d
INNER JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
INNER JOIN employees AS e
	ON dm.emp_no = e.emp_no;



SELECT e.emp_no AS "Employee Number",
  		 e.last_name "Last Name",
  		 e.first_name "First Name",
  		 d.dept_name AS "Department Name"
FROM employees AS e
INNER JOIN dept_employee AS de
  ON e.emp_no = de.emp_no
INNER JOIN departments AS d
  ON de.dept_no = d.dept_no;



SELECT first_name AS "First Name",
		   last_name AS "Last Name",
		   sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND
		  last_name LIKE 'B%';



--SELECT e.emp_no AS "Employee Number",
--        e.last_name AS "Last Name",
--        e.first_name AS "First Name",
--        d.dept_name AS "Department Name"
-- FROM employees AS e
-- INNER JOIN dept_employee AS de
--   ON e.emp_no = de.emp_no
-- INNER JOIN departments AS d
--   ON de.dept_no = d.dept_no
-- WHERE d.dept_name = 'Sales';


SELECT e.emp_no AS "Employee Number",
       e.last_name AS "Last Name",
       e.first_name AS "First Name",
       (SELECT d.dept_name AS "Department Name"
		    FROM departments AS d
	      WHERE d.dept_name = 'Sales')
FROM employees AS e;





SELECT e.emp_no AS "Employee Number",
		   e.last_name AS "Last Name",
		   e.first_name AS "First Name",
		   d.dept_name AS "Department Name"
FROM employees AS e
INNER JOIN dept_employee AS de
  ON e.emp_no = de.emp_no
INNER JOIN departments AS d
  ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR
      d.dept_name = 'Development';



SELECT last_name AS "Last Name",
       count(last_name) AS "Count of employees last name"
FROM employees
GROUP BY last_name
ORDER BY "Count of employees last name" DESC;
