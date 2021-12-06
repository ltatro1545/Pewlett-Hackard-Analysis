--  Deliverable 1: # Retiring Emps by Title
SELECT e.emp_no, e.first_name, e.last_name, 
	ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ti
	ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO retirement_titles_cleaned
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM retirement_titles_cleaned;

-- Get count of retiring employees by title
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM retirement_titles_cleaned
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;

-- DELIVERABLE 2: Employees eligible for the mentorship program

SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name,
	e.last_name, e.birth_date,
	de.from_date, de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_employees as de
	ON e.emp_no = de.emp_no
JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (de.to_date = ('9999-01-01'))
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;

-- Deliverable 3 (there are more retiring senior engineers than current senior engineers)
-- Current employee count by title
SELECT COUNT(e.emp_no), t.title
	FROM current_emp as e
INNER JOIN titles as t
	ON e.emp_no = t.emp_no
GROUP BY t.title
ORDER BY COUNT(e.emp_no) DESC;

-- Number of employees eligible for mentorship
SELECT COUNT(emp_no), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- Create actual current employee table
SELECT DISTINCT ON(emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	de.from_date,
	de.to_date,
	t.title
INTO current_emp_info
FROM employees as e
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
INNER JOIN dept_employees as de
	ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01');

DROP TABLE current_emp_info;

-- Get count of current emps by title
SELECT COUNT(emp_no),
	title
INTO current_emp_title_count
FROM current_emp_info
GROUP BY title
ORDER BY COUNT(emp_no) DESC;