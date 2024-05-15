
--Data Analysis
--1. List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees as e
join salaries as s
on e.emp_no = s.emp_no

--2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date from employees
where hire_date between '1986/1/1' and '1986/12/1'

--3.List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no
join employees as e
on dm.emp_no = e.emp_no

--4. List the department number for each employee along 
-- with that employee’s employee number, last name, first name, and department name.

select dm.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as dm
join departments as d
on dm.dept_no = d.dept_no
join employees as e
on dm.emp_no = e.emp_no

--5. List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%'

--6.List each employee in the Sales department, 
--including their employee number, last name, and first name.

select emp_no, last_name, first_name from employees
where emp_no in (select emp_no from dept_emp
				where dept_no in (select dept_no from departments 
				 where dept_name = 'Sales'))

--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as dm
join departments as d
on dm.dept_no = d.dept_no
join employees as e
on dm.emp_no = e.emp_no
where d.dept_name = 'Sales' or d.dept_name='Development'

--8. List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency