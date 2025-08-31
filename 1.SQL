-- 1 --
select first_name, last_name, hire_date from employees where gender = "M";

-- 2 --
select emp_no, salary from salaries where salary >= 60000;

-- 3 --
select emp_no, gender from employees where gender != "F";

-- 4 --
select * from titles where title IN ("Senior Engineer", "Manager");

-- 5 --
select * from salaries where salary between 50000 and 70000;

-- 과제 1 --
select * from employees where gender != "M" and hire_date > 1984-12-31;

-- 과제 2 --
select * from employees where gender = "F" and hire_date >= 1990-01-01 and (last_name like "%a%" or last_name like "%e%");

-- 과제 3 --
select * from employees where last_name like "J%" and last_name like "_a%" and LENGTH(last_name) = 4;

-- 과제 4 --
select * from employees where emp_no not between 10001 and 10005 AND gender = "M";
select * from salaries where salary >= 65000;
select * from salaries where to_date is null or to_date = "9999-01-01";
