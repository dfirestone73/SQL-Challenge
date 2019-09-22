CREATE TABLE "SQLChallenge"."departments" (
    "ID" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "SQLChallenge"."dept_emp" (
    "ID" INTEGER   NOT NULL,
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "SQLChallenge"."dept_manager" (
    "ID" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "SQLChallenge"."employees" (
    "ID" INTEGER   NOT NULL,
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
    "ID" INTEGER   NOT NULL,
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "SQLChallenge"."titles" (
    "ID" INTEGER   NOT NULL,
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "ID"
     )
);

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

