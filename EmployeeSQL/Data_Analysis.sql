
--1.List the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary FROM employees e 
LEFT JOIN salaries s ON e.emp_no=s.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,hire_date FROM employees WHERE EXTRACT(year from hire_date)=1986;

--3.List the manager of each department along with their department number, department name,
--employee number, last name, and first name.
SELECT e.last_name,e.first_name,dm.dept_no,d.dept_name, dm.emp_no  FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no=d.dept_no
LEFT JOIN employees e  ON e.emp_no=dm.emp_no;


--4.List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.

SELECT de.emp_no, e.last_name,e.first_name,de.dept_no,d.dept_name FROM employees e
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no 
LEFT JOIN departments d ON de.dept_no = d.dept_no;


--5.List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B (2 points)
SELECT first_name,last_name,sex FROM employees WHERE first_name='Hercules' AND last_name LIKE 'B%';


--6.List each employee in the Sales department, including their employee number, last name, and first name

SELECT emp_no,last_name,first_name FROM employees WHERE emp_no IN 
(SELECT emp_no FROM dept_emp WHERE dept_no = (SELECT dept_no FROM departments WHERE dept_name = 'Sales'));


--7.List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no 
JOIN departments d ON d.dept_no = de.dept_no
WHERE (d.dept_name = 'Sales' OR d.dept_name = 'Development');

--Alternate

SELECT emp_no,last_name,first_name,'Sales' AS department FROM employees WHERE emp_no IN 
(SELECT emp_no FROM dept_emp WHERE dept_no = (SELECT dept_no FROM departments WHERE dept_name = 'Sales'))

UNION ALL

SELECT emp_no,last_name,first_name, 'Development' AS department FROM employees WHERE emp_no IN 
(SELECT emp_no FROM dept_emp WHERE dept_no = (SELECT dept_no FROM departments WHERE dept_name = 'Development'));


--8.List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT (last_name) AS frequency FROM employees GROUP BY last_name ORDER BY frequency DESC;











