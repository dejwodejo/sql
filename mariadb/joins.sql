# Join two tables, employee and department based on the same department number
# SELECT first_name, last_name, d.dept_no, d.department FROM employee e
#     JOIN department d ON d.dept_no=e.dept_no;

# Join two tables, employee and department based on the same job, but only for employees from USA
# SELECT e.first_name, e.last_name, d.dept_no, d.department FROM employee e
#     JOIN department d ON d.dept_no = e.dept_no
#     WHERE job_country = 'USA';

# Find all employees working within the same department as 'Nelson, Robert'
# SELECT e2.full_name, e2.dept_no FROM employee e1
#     JOIN employee e2 ON  e1.dept_no = e2.dept_no
#     WHERE e1.full_name = 'Nelson, Robert'

# Join employee and project tables, display project name and its team leader full name
# SELECT proj_name, employee.full_name FROM project
#     JOIN employee ON employee.emp_no = project.TEAM_LEADER;

# The same as previous, but include projects without defined team leader
# SELECT proj_name, employee.full_name FROM project
#     LEFT JOIN employee ON employee.emp_no = project.TEAM_LEADER;

# Join department and employee tables, for each department display name, number, amount of employees, sum of salaries,
# minimum, maximum and average salary
# SELECT d.department, d.dept_no, COUNT(e.full_name) AS employees_amount, AVG(e.salary), SUM(e.salary), min(e.salary), MAX(e.salary)
#     FROM department AS d
#     right JOIN employee AS e ON d.dept_no = e.dept_no
#     GROUP BY d.dept_no;

# For each employee display name, surname, department number, salary and minimum, maximum and average salary in employee's department
# SELECT e1.FIRST_NAME, e1.last_name, e1.dept_no, e1.salary, AVG(e2.salary), MAX(e2.salary), MIN(e2.salary) FROM employee e1, employee e2
#     WHERE e1.DEPT_NO = e2.dept_no
#     GROUP BY e1.first_name, e1.LAST_NAME, e1.salary, e1.dept_no;

# Show the percentage of an employee's earnings to the total earnings of the entire employee's department
# SELECT e1.full_name, e1.salary, e1.salary/SUM(e2.SALARY)*100 AS earning_share FROM employee e1
#     JOIN employee e2 ON e1.DEPT_NO=e2.dept_no
#     GROUP BY e1.full_name;

# For each department, determine the difference between its budget and the sum of employees' earnings
# SELECT d.dept_no, IFNULL((d.budget - SUM(e.SALARY)), d.budget) AS difference FROM department d
#     left JOIN employee e ON e.dept_no = d.dept_no
#     GROUP BY d.dept_no, d.budget;

# For each country, count how many different departments its employees are from
# SELECT e1.job_country, COUNT(distinct e2.dept_no) FROM employee e1
#     JOIN employee e2 ON e1.job_country = e2.JOB_COUNTRY
#     GROUP BY e1.job_country;

# For each department display sum of employees salary employed as managers
# SELECT d.dept_no, SUM(e.salary) FROM department d
#     JOIN employee e ON e.dept_no = d.dept_no
#     WHERE e.job_code='mngr'
#     GROUP BY d.dept_no;

# Show how many employees were hired for each year
# SELECT year(e1.HIRE_DATE), COUNT(e2.full_name) FROM employee e1
#     JOIN employee e2 ON YEAR(e1.HIRE_DATE) = YEAR(e2.hire_date)
#     GROUP BY YEAR(e1.hire_date);

# Show how many employees were hired for each year for every department
# SELECT year(e1.HIRE_DATE), e1.DEPT_NO, COUNT(e2.full_name) FROM employee e1
#     JOIN employee e2 ON YEAR(e1.HIRE_DATE) = YEAR(e2.hire_date)
#     GROUP BY YEAR(e1.hire_date), e1.dept_no;

# Count how many employees are earning more than 'Brown Kelly'
# SELECT COUNT(full_name) FROM employee
#     WHERE salary>(SELECT salary FROM employee WHERE full_name = 'Brown, Kelly');

# Count how many employees are earning more than 'Brown Kelly' in hers department
# SELECT COUNT(full_name) FROM employee
#   WHERE salary>(SELECT salary FROM employee WHERE full_name = 'Brown, Kelly')
#       AND dept_no = (SELECT dept_no FROM employee WHERE full_name = 'Brown, Kelly');
