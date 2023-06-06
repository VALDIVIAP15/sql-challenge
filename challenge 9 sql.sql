SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries 
ON salaries.emp_no=employees.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '19860101' and hire_date <= '19861231';



SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,
employees.first_name FROM departments
INNER JOIN dept_manager
ON departments.dept_no=dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no=employees.emp_no;



SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no;



SELECT first_name, last_name, sex
FROM employees
WHERE last_name LIKE 'B%';



SELECT dept_emp.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp
ON dept_emp.emp_no=employees.emp_no
WHERE dept_emp.dept_no = 'd007';


SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales'
OR departments.dept_name='Development';


SELECT last_name, COUNT (last_name) AS "Count last names"
FROM employees
GROUP BY last_name
ORDER BY "Count last names" DESC;












--Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id varchar(255) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    sex varchar(255) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	CONSTRAINT fk_emp_title_id
	FOREIGN KEY (emp_title_id)
	REFERENCES titles(title_id)
);

SELECT * FROM employees;

-- Creating titles table with primary key

CREATE TABLE titles (
    title_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    PRIMARY KEY (title_id)
);

SELECT * FROM titles;

-- Creating dept_manager table with primary key and foreign keys

CREATE TABLE dept_manager (
    emp_no int NOT NULL,
    dept_no varchar(255) NOT NULL,
    PRIMARY KEY (emp_no),
	CONSTRAINT fk_dept_no
	FOREIGN KEY (dept_no)
	REFERENCES departments(dept_no),
	CONSTRAINT fk_emp_no
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;


CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(255) NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
	CONSTRAINT fk_dept_no
	FOREIGN KEY (dept_no)
	REFERENCES departments(dept_no),
	CONSTRAINT fk_emp_no
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no)
);

SELECT * FROM dept_emp;



CREATE TABLE departments (
    dept_no varchar(255) NOT NULL,
    dept_name varchar(255) NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM departments;


CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    PRIMARY KEY (emp_no),
	CONSTRAINT fk_emp_no
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no)
);

SELECT * FROM salaries;
