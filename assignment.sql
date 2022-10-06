show databases;
select * from salaries;
use employees;


-- 01 Datewise total salary
select from_date, to_date, sum(salary) from salaries a
inner join employees b on a.emp_no=b.emp_no
group by from_date, to_date;


-- 02 Department name and their total salary till now
select dept_name, sum(salary) from departments a
join dept_emp b on a.dept_no=b.dept_no 
join employees c on b.emp_no=c.emp_no
join salaries d on d.emp_no=c.emp_no
group by dept_name;


-- 03 Deprtment with highest salary
select dept_name, max(salary) from departments a
join dept_emp b on a.dept_no=b.dept_no
join employees c on b.emp_no=c.emp_no
join salaries d on d.emp_no=c.emp_no
group by dept_name;


-- 04 Employee with highest salary
select a.emp_no, first_name, last_name, salary
from employees a
join salaries b on a.emp_no=b.emp_no
where salary in (select max(salary) from salaries);


-- 05 Employee with 10th highest salary
select x.emp_no, first_name, last_name, salary from
(select a.emp_no, first_name, last_name, salary, dense_rank() over (order by salary desc) as rnk
from employees a
join salaries b on a.emp_no=b.emp_no) x
where rnk=10;

-- 06 Show employee id with their title, department name, department id
select e.emp_no, last_name, dept_name, de.dept_no
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments d on de.dept_no=d.dept_no;


-- 07 Employee total salary till now
select e.emp_no, sum(salary)
from employees e
join salaries s on e.emp_no=s.emp_no
group by e.emp_no;

-- 08 Male total salary and female total salary
select gender, sum(salary)
from employees e
join salaries s on e.emp_no=s.emp_no
group by gender;

-- 09 No of employees hired per date
select hire_date,count(emp_no) from employees
group by hire_date;


-- 10 Test delete with cascade
DELETE FROM employees WHERE emp_no = 2;
DELETE FROM salaries WHERE  emp_no= 2;














