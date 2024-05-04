SELECT * FROM employee;

SELECT LAST_NAME, FIRST_NAME FROM employee;

SELECT FIRST_NAME, LAST_NAME FROM employee WHERE DEPT_NO='000';

SELECT FIRST_NAME, LAST_NAME, JOB_COUNTRY FROM employee WHERE JOB_COUNTRY != 'USA';

SELECT full_name, hire_date>'15.01.1990' FROM employee;

SELECT* FROM employee WHERE salary BETWEEN 10000 AND 50000;

SELECT* FROM employee WHERE salary > 10000 AND salary<50000;

SELECT* from employee where hire_date>'18.01.1990' and hire_date<'31.12.1992';

SELECT* FROM employee WHERE phone_ext is not NULL;

SELECT* FROM employee WHERE phone_ext is NULL;

SELECT last_name, salary, (salary*1.9)-1200 AS tax FROM employee;

SELECT * FROM employee ORDER BY salary ASC;

SELECT * FROM employee ORDER BY LAST_NAME, FIRST_NAME ASC;

SELECT * FROM employee WHERE dept_no = 000 ORDER BY salary, hire_date DESC;

SELECT * FROM employee ORDER BY PHONE_EXT;

SELECT * FROM employee WHERE job_country = 'USA' AND hire_date > '1.01.1994' AND dept_no<>000;

SELECT * FROM employee WHERE dept_no IN (000, 100, 115) AND salary > 100000;

SELECT * FROM employee WHERE (dept_no = 000 OR dept_no=100 OR dept_no=115) AND salary > 100000;

SELECT * FROM employee WHERE dept_no not IN (000, 100, 115) AND salary < 100000;

SELECT * FROM employee WHERE first_name LIKE 'R%';

SELECT * FROM employee WHERE first_name LIKE '%a';

SELECT * FROM employee WHERE job_code LIKE '%ng%'
