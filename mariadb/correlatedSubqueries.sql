SELECT AVG(salary), MIN(salary), MAX(salary) FROM employee;

SELECT first_name, last_name, dept_no, salary FROM employee
    WHERE salary=(SELECT MAX(salary) FROM employee);

SELECT full_name, dept_no, hire_date FROM employee
    WHERE hire_date = (SELECT MIN(hire_date) FROM employee);

SELECT full_name, dept_no FROM employee
 	WHERE dept_no = (SELECT dept_no FROM employee WHERE full_name = 'Nelson, Robert');

SELECT AVG(salary), dept_no FROM employee GROUP BY dept_no;

SELECT full_name, salary FROM employee
    WHERE salary > (SELECT AVG(salary) FROM employee);

SELECT full_name, salary, dept_no FROM employee
    WHERE dept_no = 623 AND salary > (SELECT AVG(salary) FROM employee WHERE dept_no = 623);

SELECT dept_no, AVG(salary) FROM employee
 	GROUP BY dept_no HAVING AVG(salary) < 100000 ORDER BY AVG(salary) DESC;

SELECT dept_no, AVG(salary) FROM employee WHERE job_country = 'USA'
    GROUP BY dept_no HAVING AVG(salary) > 100000 ORDER BY AVG(salary) DESC;

SELECT full_name, salary, dept_no FROM employee	GROUP BY dept_no HAVING MIN(salary);

SELECT dept_no FROM employee
	GROUP BY dept_no HAVING COUNT(*) > 4;

SELECT department, dept_no FROM department AS d1
    WHERE EXISTS (SELECT * FROM employee AS e1
	WHERE salary > 100000 AND d1.dept_no = e1.dept_no);

SELECT department, dept_no FROM department AS d1
 	WHERE (SELECT COUNT(*) FROM employee AS e1
 	WHERE e1.salary < 100000 AND e1.job_code = 'Eng' AND d1.DEPT_NO = e1.dept_no) >=2;

SELECT department, dept_no FROM department AS d1
 	WHERE (SELECT COUNT(*) FROM employee AS e1
	WHERE job_country = 'USA' AND d1.DEPT_NO = e1.dept_no) = 0;

SELECT department, dept_no, mngr_no FROM department AS d1
	WHERE (SELECT COUNT(*) FROM employee AS e1
	WHERE d1.MNGR_NO = e1.EMP_NO AND e1.SALARY > 90000);

SELECT department FROM department
 	WHERE budget > (SELECT AVG(budget) FROM department) + 30000;

SELECT full_name, salary FROM employee WHERE salary >= (
 	SELECT 2* salary FROM employee WHERE full_name = 'Brown, Kelly');

SELECT full_name, job_country, salary FROM employee
    WHERE salary >= (SELECT 2* salary FROM employee
    WHERE full_name = 'Brown, Kelly')
        AND job_country = (SELECT job_country FROM employee WHERE full_name = 'Brown, Kelly');

SELECT full_name FROM employee AS e1 WHERE salary >= 2*(SELECT salary FROM employee AS e2
    WHERE e2.FULL_NAME = 'Brown, Kelly' AND e2.JOB_country = e1.job_country);

SELECT department, mngr_no FROM department WHERE mngr_no IS NULL;

SELECT d.dept_no, d.department FROM department d
WHERE(SELECT salary FROM employee e
      WHERE e.emp_no = d.MNGR_NO) <ANY (SELECT salary FROM employee e WHERE e.dept_no = d.dept_no)
