SELECT COUNT(*) FROM employee;

SELECT COUNT(*) FROM employee WHERE phone_ext IS NULL;

SELECT COUNT(DISTINCT first_name) FROM employee;

SELECT COUNT(DISTINCT first_name) FROM employee WHERE first_name LIKE 'R%';

SELECT * FROM employee WHERE job_code = "Mngr" AND salary > 60000;

SELECT COUNT(DISTINCT job_country) FROM employee;

SELECT last_name, salary FROM employee WHERE job_country="USA";

SELECT AVG(salary), SUM(salary) FROM employee WHERE job_country="USA";

SELECT SUM(salary), COUNT(*), job_country FROM employee GROUP BY job_country;

SELECT SUM(salary), job_country FROM employee
    GROUP BY job_country ORDER BY SUM(salary) DESC;

SELECT SUM(salary), job_country FROM employee
    GROUP BY job_country HAVING COUNT(*) > 2;

SELECT SUM(salary), SUM(salary)*0.19-1200 AS tax, job_country FROM employee
    GROUP BY job_country;

SELECT dept_no, MAX(salary), MIN(salary) FROM employee
    WHERE job_country="USA" GROUP BY dept_no HAVING MIN(40000);

SELECT COUNT(DISTINCT salary), job_country FROM employee
    GROUP BY job_country;
