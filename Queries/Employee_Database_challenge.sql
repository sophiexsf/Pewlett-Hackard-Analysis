SELECT 
employees.emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO retirement_titles
FROM employees INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE date_part('year', birth_date) BETWEEN 1952 AND 1955
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
