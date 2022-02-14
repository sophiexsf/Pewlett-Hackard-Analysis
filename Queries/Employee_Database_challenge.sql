SELECT 
employees.emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO retirement_titles
FROM employees INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, from_date DESC;

SELECT
count(emp_no),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

select DISTINCT ON (employees.emp_no)
employees.emp_no, first_name, last_name, birth_date,
dept_emp.from_date, dept_emp.to_date,
title
into mentorship_eligibilty
from
employees,
dept_emp,
titles
where
employees.emp_no = dept_emp.emp_no
and
employees.emp_no = titles.emp_no
and
dept_emp.to_date = '9999-01-01'
and
birth_date between '1965-01-01' and '1965-12-31'
order by employees.emp_no