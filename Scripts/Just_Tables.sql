CREATE TABLE department (
	dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(20) PRIMARY KEY NOT NULL,
	title VARCHAR(50) NOT NULL
);

CREATE Table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT fk_title_id
		FOREIGN KEY (emp_title_id)
		REFERENCES titles (title_id)
);

CREATE Table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	CONSTRAINT fk_dep_no
		FOREIGN KEY (dept_no)
		REFERENCES department (dept_no),
	CONSTRAINT fk_emp_no
		FOREIGN KEY (emp_no)
		REFERENCES employees (emp_no)
);

CREATE Table dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	CONSTRAINT fk_dept_no
		FOREIGN KEY (dept_no)
		REFERENCES department (dept_no),
	CONSTRAINT fk_emp_no
		FOREIGN KEY (emp_no)
		REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL
);

SELECT emp.emp_no AS Employee_ID
	  ,emp.last_name AS Employee_Last_Name
	  ,emp.first_name AS Employee_First_Name
	  ,emp.sex AS Employee_Sex
	  ,sal.salary AS Employee_Salary
FROM employees AS emp
INNER JOIN salaries AS sal ON emp.emp_no = sal.emp_no;

SELECT first_name AS Employee_First_Name
	  ,last_name AS Employee_Last_Name
	  ,hire_date AS Employee_Hire_Date
FROM employees
	WHERE DATE_PART('YEAR', hire_date) = 1986;
	


