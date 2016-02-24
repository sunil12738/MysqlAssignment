-- LEVEL 2, QUERY 2:
create view joinees as select count(*) as cnt, dept_no,from_date from dept_emp group by dept_no,from_date;
create view max_join as select max(cnt) as maximum, dept_no from joinees group by dept_no;
create view min_join as select min(cnt) as minimum, dept_no from joinees group by dept_no;
select maximum-minimum, dept_no from max_join natural join min_join;

-- LEVEL 2, QUERY 3:
create view t1 as select emp_no,dept_no,gender from employees natural join dept_emp;
create view females as select count(*) as 'female', dept_no from t1 where gender='F' group by dept_no; 
create view males as select count(*) as 'male', dept_no from t1 where gender='M' group by dept_no;
create view ratio as select male/female, dept_no from males natural join females;
select * from ratio;