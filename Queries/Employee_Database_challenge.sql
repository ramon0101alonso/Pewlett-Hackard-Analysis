--Step 1
SELECT employees.emp_no, 
employees.first_name, 
employees.last_name,
titles.title, 
titles.from_date, 
titles.to_date
INTO retirement_titles
FROM employees 
INNER JOIN titles
ON titles.emp_no = employees.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC;

SELECT * FROM retirement_titles



SELECT DISTINCT ON (emp_no) first_name last_name, title, to_date
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT(title), title
INTO retiring_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

SELECT DISTINCT on (employees.emp_no) employees.emp_no, 
employees.first_name, 
employees.last_name,
employees.birth_date, 
dept_emp.from_date, 
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees 
INNER JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
INNER JOIN titles
ON dept_emp.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND (employees.birth_date  BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY  employees.emp_no;

SELECT DISTINCT on (employees.emp_no) employees.emp_no, 
employees.first_name, 
employees.last_name,
employees.birth_date, 
dept_emp.from_date, 
dept_emp.to_date,
titles.title
INTO mentorship_eligibilitythreeyears
FROM employees 
INNER JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
INNER JOIN titles
ON dept_emp.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND (employees.birth_date  BETWEEN '1960-01-01' AND '1965-12-31')
ORDER BY  employees.emp_no;
