-- 1 INNER JOIN--
select eu.update_id, eu.emp_no, eu.field_name, eu.old_value, eu.old_value, eu.approved_by, eu.approved_at, d.dept_no
from emp_updates eu
inner join employees e
inner join dept_emp d
on eu.emp_no = e.emp_no
and e.emp_no = d.emp_no
where eu.status = "APPROVED" and eu.approved_at between '2025-06-01' and '2025-06-30' and d.to_date = '9999-01-01';

-- 2 LEFT OUTER JOIN --
select d.dept_no, d.dept_name, db.budget_amount as budget_2025
from departments d
left outer join dept_budget db
on d.dept_no = db.dept_no and db.fiscal_year = 2025;

-- 3 RIGHT OUTER JOIN --
select db.fiscal_year, d.dept_no, d.dept_name, db.budget_amount
from departments d
right outer join dept_budget db
on d.dept_no = db.dept_no
where db.fiscal_year = 2025;

-- 4 CORSS JOIN --
select m.ym, d.dept_no, d.dept_name, m.work_days
from month_calendar m
cross join departments d
on m.ym between '2025-07' and '2025-09'
and d.dept_no in ('d004', 'd005', 'd007');

-- 5 SELF JOIN --
select d2025.dept_no, d2024.budget_amount as budget_2024, d2025.budget_amount as budget_2025,
(d2025.budget_amount - d2024.budget_amount) as diff,
((d2025.budget_amount - d2024.budget_amount)/d2025.budget_amount * 100) as 'diff_rate(%)'
from dept_budget d2025
inner join dept_budget d2024
on d2025.dept_no = d2024.dept_no
and d2025.fiscal_year != d2024.fiscal_year;
