DROP TABLE "SQLChallenge"."departments" CASCADE;
DROP TABLE "SQLChallenge"."dept_emp" CASCADE;
DROP TABLE "SQLChallenge"."dept_manager" CASCADE;
DROP TABLE "SQLChallenge"."employees" CASCADE;
DROP TABLE "SQLChallenge"."salaries" CASCADE;
DROP TABLE "SQLChallenge"."titles" CASCADE;

CREATE TABLE "SQLChallenge"."departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "SQLChallenge"."dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "SQLChallenge"."dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "SQLChallenge"."employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "SQLChallenge"."salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "SQLChallenge"."titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

--Run after CSV import
ALTER TABLE "SQLChallenge"."dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "SQLChallenge"."employees" ("emp_no");

ALTER TABLE "SQLChallenge"."dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "SQLChallenge"."departments" ("dept_no");

ALTER TABLE "SQLChallenge"."dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "SQLChallenge"."departments" ("dept_no");

ALTER TABLE "SQLChallenge"."dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "SQLChallenge"."employees" ("emp_no");

ALTER TABLE "SQLChallenge"."salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "SQLChallenge"."employees" ("emp_no");

ALTER TABLE "SQLChallenge"."titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "SQLChallenge"."employees" ("emp_no");


--Add ID column
ALTER TABLE "SQLChallenge"."departments" ADD ID SERIAL NOT NULL;
ALTER TABLE "SQLChallenge"."dept_emp" ADD ID SERIAL PRIMARY KEY;
ALTER TABLE "SQLChallenge"."dept_manager" ADD ID SERIAL PRIMARY KEY;
ALTER TABLE "SQLChallenge"."employees" ADD ID SERIAL NOT NULL;
ALTER TABLE "SQLChallenge"."salaries" ADD ID SERIAL PRIMARY KEY;
ALTER TABLE "SQLChallenge"."titles" ADD ID SERIAL PRIMARY KEY;

SELECT * FROM "SQLChallenge"."employees";

--1.
CREATE VIEW employeeVW AS
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary FROM "SQLChallenge"."employees" AS e
JOIN "SQLChallenge"."salaries" AS s ON e.emp_no=s.emp_no;

SELECT * FROM employeeVW;

--2.
SELECT e.first_name, e.last_name, e.hire_date FROM "SQLChallenge"."employees" AS e
WHERE e.hire_date >= '1987-01-01' AND e.hire_date <= '1987-12-31';

--3.




