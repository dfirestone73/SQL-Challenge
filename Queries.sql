--1.
CREATE VIEW employeeVW AS
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary FROM "SQLChallenge"."employees" AS e
JOIN "SQLChallenge"."salaries" AS s ON e.emp_no=s.emp_no;

SELECT * FROM employeeVW;

--2.
SELECT e.first_name, e.last_name, e.hire_date FROM "SQLChallenge"."employees" AS e
WHERE e.hire_date >= '1987-01-01' AND e.hire_date <= '1987-12-31';

--3.
CREATE VIEW managersVW AS
SELECT m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name, m.from_date, m.to_date 
FROM "SQLChallenge"."dept_manager" AS m JOIN "SQLChallenge"."employees" AS e ON (m.emp_no=e.emp_no)
JOIN "SQLChallenge"."departments" AS d ON (m.dept_no=d.dept_no);

SELECT * FROM managersVW;

--4.
CREATE VIEW departmentsVW AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "SQLChallenge"."employees" AS e JOIN "SQLChallenge"."dept_emp" AS de ON (e.emp_no=de.emp_no)
JOIN "SQLChallenge"."departments" AS d ON (de.dept_no=d.dept_no);

SELECT * FROM departmentsVW;

--5.
CREATE VIEW DuangkaewVW AS
SELECT e.first_name, e.last_name FROM "SQLChallenge"."employees" AS e WHERE e.first_name = 'Duangkaew'
AND e.last_name LIKE 'P%';

SELECT * FROM DuangkaewVW;

--6.
CREATE VIEW SalesVW AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name FROM "SQLChallenge"."employees" AS e
JOIN "SQLChallenge"."dept_emp" AS de ON (e.emp_no=de.emp_no) 
JOIN "SQLChallenge"."departments" AS d ON (de.dept_no=d.dept_no) WHERE d.dept_name = 'Sales';

SELECT * FROM SalesVW;

--7.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name FROM "SQLChallenge"."employees" AS e
JOIN "SQLChallenge"."dept_emp" AS de ON (e.emp_no=de.emp_no) 
JOIN "SQLChallenge"."departments" AS d ON (de.dept_no=d.dept_no) WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--8.
CREATE VIEW namecountVW AS
SELECT e.last_name, COUNT(e.last_name) AS "name count" FROM "SQLChallenge"."employees" AS e
GROUP BY e.last_name ORDER BY "name count" ASC;

SELECT * FROM namecountVW;

