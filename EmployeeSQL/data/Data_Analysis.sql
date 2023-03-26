--List emp_no, last_name, first_name, sex, and salary for each employee
Select employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
FROM employees
Inner JOIN salaries on employees.emp_no = salaries.emp_no;

--List first_name, last_name, and hire data for the employees who were
-- hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
Where employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
Order by hire_date;

--List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name,
employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments on dept_manager.dept_no=departments.dept_no
INNER JOIN employees on dept_manager.emp_no=employees.emp_no;

--List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, 
employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees on dept_emp.emp_no=employees.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is 
-- 'Hercules' and whose last name begins with the letter 'B'.
Select first_name,last_name, sex
FROM employees
WHERE 
first_name like 'Hercules' AND last_name LIKE'B%';

--List each employee in the Sales department, including their employee number,
-- last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp on employees.emp_no=dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no=departments.dept_no
WHERE
departments.dept_name LIKE 'Sales';

--List each employee in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no=dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no=departments.dept_no
WHERE
departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE 'Development'

--List the frequency counts, in descending order, of all the employee last 
-- names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Employees Sharing Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Employees Sharing Last Name" DESC
