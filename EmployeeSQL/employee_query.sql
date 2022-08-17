SELECT * FROM "Titles";
SELECT * FROM "Employees";
SELECT * FROM "Department";
SELECT * FROM "Dept_Manager";
SELECT * FROM "Dept_Employees";
SELECT * FROM "Salaries";

-----------------------------------------
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

-- JOIN "Employees" table and "Salaries" table
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s on e.emp_no = s.emp_no;

-----------------------------------------
-- 2. List first name, last name, and hire date for employees who were hired in 1986.

-- Change hire_date in "Employees" Table to DATE data type
ALTER TABLE "Employees"
ALTER COLUMN hire_date TYPE DATE
USING hire_date::date;

SELECT e.first_name, e.last_name, e.hire_date
FROM "Employees" e
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

-----------------------------------------
-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" dm 
INNER JOIN "Department" d ON dm.dept_no = d.dept_no
JOIN "Employees" e ON dm.emp_no = e.emp_no;

-----------------------------------------
-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employees" de
INNER JOIN "Department" d ON d.dept_no = de.dept_no
JOIN "Employees" e ON de.emp_no = e.emp_no;

-----------------------------------------
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM "Employees" e
WHERE e.first_name LIKE 'Hercules' AND e.last_name LIKE 'B%';

-----------------------------------------
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
INNER JOIN  "Dept_Employees" de ON de.emp_no = e.emp_no
JOIN "Department" d ON d.dept_no = de.dept_no
WHERE de.dept_no LIKE 'd007';

-----------------------------------------
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
INNER JOIN  "Dept_Employees" de ON de.emp_no = e.emp_no
JOIN "Department" d ON d.dept_no = de.dept_no
WHERE de.dept_no LIKE 'd007' OR de.dept_no LIKE 'd005';

-----------------------------------------
-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
-- SELECT e.last_name,
-- COUNT (e.last_name)
-- FROM "Employees" e
-- GROUP BY e.last_name
-- ORDER BY e.last_name DESC;

SELECT e.last_name, COUNT(e.last_name) AS "last_name Count"
FROM "Employees" e
group by e.last_name
order by "last_name Count" DESC;
