SELECT * FROM titles;

CREATE TABLE department (
	dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);

CREATE Table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

CREATE Table dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);

CREATE Table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(20) PRIMARY KEY NOT NULL,
	title VARCHAR(50) NOT NULL
);

SELECT * FROM dept_manager;

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
	
SELECT dm.dept_no AS Department_ID
      ,dept.dept_name AS Department_Name
	  ,dm.emp_no AS Employee_ID
	  ,emp.last_name AS Employee_Last_Name
	  ,emp.first_name AS Employee_First_Name
FROM dept_manager AS DM
INNER JOIN department AS dept ON DM.dept_no = dept.dept_no
INNER JOIN employees AS emp ON DM.emp_no = emp.emp_no;

SELECT emp.emp_no AS Employee_ID
	  ,emp.last_name AS Employee_Last_Name
	  ,emp.first_name AS Employee_First_Name
	  ,dept.dept_name AS Department_Name
FROM employees AS emp
INNER JOIN dept_emp AS DE ON emp.emp_no = DE.emp_no
INNER JOIN department AS dept ON DE.dept_no = dept.dept_no;

SELECT first_name AS Employee_First_Name
	  ,last_name AS Employee_Last_Name
	  ,sex AS Employee_Sex
FROM employees
	WHERE first_name = 'Hercules'
		AND LEFT(last_name, 1) = 'B';
		
SELECT emp.emp_no AS Employee_ID
	  ,emp.last_name AS Employee_Last_Name
	  ,emp.first_name AS Employee_First_Name
	  ,dept.dept_name AS Department_Name
FROM employees AS emp
INNER JOIN dept_emp AS DE ON emp.emp_no = DE.emp_no
INNER JOIN department AS dept ON DE.dept_no = dept.dept_no
	WHERE dept.dept_name = 'Sales';
	
SELECT emp.emp_no AS Employee_ID
	  ,emp.last_name AS Employee_Last_Name
	  ,emp.first_name AS Employee_First_Name
	  ,dept.dept_name AS Department_Name
FROM employees AS emp
INNER JOIN dept_emp AS DE ON emp.emp_no = DE.emp_no
INNER JOIN department AS dept ON DE.dept_no = dept.dept_no
	WHERE dept.dept_name = 'Sales'
		OR dept.dept_name = 'Development';
		
SELECT last_name AS Employee_Last_Name
	  ,COUNT(last_name) AS Last_Name_Count
FROM employees
	GROUP BY last_name
	ORDER BY COUNT(last_name) DESC;
		



