-- Create tables and import data for each csv file that contains data

CREATE TABLE "departments" (
    "dept_no" varchar(30)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "department_employee" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "department_manager" (
    "dept_no" varchar(30)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(100)   NOT NULL,
    "last_name" varchar(100)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");




--Run queries to cONfirm tables & imports were successful
SELECT * FROM department_employee;
SELECT * FROM department_manager;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
    employees.emp_no, 
    employees.last_name, 
    employees.first_name, 
    employees.gender, 
    salaries.salary
FROM 
    employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT 
    first_name, 
    last_name, 
    hire_date
FROM 
    employees
WHERE 
    hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- 3. List the manager of each department with the following informatiON: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	dep.dept_no,
	dep.dept_name,
	dep_man.emp_no,
	emp.last_name,
	emp.first_name,
	dep_man.from_date,
	dep_man.to_date
FROM
	departments dep
JOIN department_manager dep_man ON dep.dept_no = dep_man.dept_no
JOIN employees emp ON dep_man.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following informatiON: employee number, last name, first name, and department name.
SELECT 
    emp.emp_no, 
    emp.last_name, 
    emp.first_name, 
    dep.dept_no
FROM 
    employees emp
LEFT JOIN department_employee dep_emp ON dep_emp.emp_no = emp.emp_no
JOIN departments dep ON dep.dept_no = dep_emp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
    first_name, 
    last_name
FROM 
    employees
WHERE 
    first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	dep.dept_name,
	emp.emp_no,
	emp.last_name,
	emp.first_name
FROM
	employees emp
LEFT JOIN department_employee dep_emp ON emp.emp_no = dep_emp.emp_no
JOIN departments dep ON dep_emp.dept_no = dep.dept_no
WHERE
	dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	dep.dept_name,
	emp.emp_no,
	emp.last_name,
	emp.first_name
FROM
	employees emp
LEFT JOIN department_employee dep_emp ON emp.emp_no = dep_emp.emp_no
JOIN departments dep ON dep_emp.dept_no = dep.dept_no
WHERE
	dept_name = 'Sales' or dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT(last_name) AS last_name_count
FROM
	employees
GROUP BY
	last_name
ORDER BY
	last_name_count DESC

-- 9. List all employees who were hired since 1990 and their departments
SELECT
	concat(emp.first_name, ' ', emp.last_name) as full_name,
	emp.hire_date,
	dep.dept_name
FROM employees emp
JOIN department_employee dep_emp ON dep_emp.emp_no = emp.emp_no
JOIN departments dep ON dep.dept_no = dep_emp.dept_no
WHERE
	emp.hire_date >= '01-01-1990'
ORDER BY emp.hire_date

-- 10. List the following details of each employee: employee number, last name, first name, gender, and salary. Order by highest salary to lowest.
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sal.salary
FROM
	employees emp
JOIN salaries sal ON emp.emp_no = sal.emp_no
ORDER BY
	sal.salary DESC

-- 11 List all employees that have "Engineer" in their title along with their: department name, full name, and salary. Order the list by highest salary to lowest.
SELECT
	titles.title,
	dep.dept_name,
	concat(emp.first_name, ' ', emp.last_name) as full_name,
	sal.salary
FROM
	employees emp
JOIN department_employee dep_emp ON dep_emp.emp_no = emp.emp_no
JOIN departments dep ON dep.dept_no = dep_emp.dept_no
JOIN salaries sal ON sal.emp_no = emp.emp_no
JOIN titles ON titles.emp_no = emp.emp_no
WHERE 
	titles.title LIKE '%Engineer%'
ORDER BY
	sal.salary DESC

-- 12 List all employees who have an annual salary higher than $65,000 and their titles, employee numbers, full names, gender, and hire date.
SELECT
	titles.title,
	emp.emp_no,
	concat(emp.first_name, ' ', emp.last_name) as full_name,
	sal.salary,
	emp.gender,
	emp.hire_date
FROM
	employees emp
JOIN titles ON titles.emp_no = emp.emp_no
JOIN salaries sal ON sal.emp_no = emp.emp_no
WHERE 
	sal.salary > 65000
ORDER BY
	sal.salary DESC
