---1. List the employee number, last name, first name, sex, and salary of each employee.

select emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.sex,
	sal.salary
from employees as emp
inner join salaries as sal 
on sal.emp_no = emp.emp_no;	

---2. List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, 
	last_name, 
	hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

---3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dept_mng.dept_no,
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	dept.dept_name
from dept_manager as dept_mng
inner join employees as emp
on emp.emp_no = dept_mng.emp_no
inner join departments as dept
on dept.dept_no = dept_mng.dept_no;

---4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select dept_emp.dept_no,
	dept_emp.emp_no,
	emp.first_name,
	emp.last_name,
	dept.dept_name
from dept_emp
inner join employees as emp
on dept_emp.emp_no = emp.emp_no
inner join departments as dept
on dept.dept_no = dept_emp.dept_no;

---5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, 
	last_name, 
	sex
from employees
where first_name = 'Hercules' and last_name like 'B%'; 

---6. List each employee in the Sales department, including their employee number, last name, and first name.

select  emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	dept.dept_name
from employees as emp
inner join dept_emp 
on emp.emp_no = dept_emp.emp_no
inner join departments as dept 
on dept_emp.dept_no = dept.dept_no
where  dept.dept_name = 'Sales';

---7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select  emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	dept.dept_name
from employees as emp
inner join dept_emp 
on emp.emp_no = dept_emp.emp_no
inner join departments as dept 
on dept_emp.dept_no = dept.dept_no
where dept.dept_name = 'Sales' or dept.dept_name = 'Development';

---8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name , count(last_name)
from employees 
group by last_name 
order by last_name desc;