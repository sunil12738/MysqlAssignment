-- LEVEL 3, QUERY 1:
create view a1 as select dept_no,.salaries.emp_no,salary from dept_manager join salaries on dept_manager.emp_no=salaries.emp_no;
create view a2 as select emp_no,salary from employees natural join salaries where employees.emp_no=salaries.emp_no;
create view a3 as select dept_no,dept_emp.emp_no,salary from dept_emp natural join a2 where a2.emp_no=dept_emp.emp_no;
select a3.emp_no from a1 join a3 on a1.dept_no=a3.dept_no where a1.salary<a3.salary;

-- LEVEL 3, QUERY 2:
create view x1 as select emp_no,dept_no,first_name,last_name,gender from employees natural join dept_emp where gender='F';
create view x2 as select emp_no,first_name,last_name,dept_no,gender,salary from x1 natural join salaries;
select first_name,last_name, avg(salary),dept_no from x2 group by first_name,dept_no;

-- LEVEL 3, QUERY 3:
create view table11 as select employees.emp_no, dept_no, first_name, last_name from employees natural join dept_emp;
create view dep as select count(*) as no_of_dept, last_name from table11 group by first_name,last_name;
select last_name,no_of_dept from dep where last_name like '%ar';

-- LEVEL 3, QUERY 4:
create view ta1 as select count(*) as sal_ch, emp_no from salaries group by emp_no;
create view final as select sal_ch, emp_no from ta1 where sal_ch>15;
select birth_date, first_name, last_name, sal_ch, emp_no from employees natural join final order by birth_date;