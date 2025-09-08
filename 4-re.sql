-- 과제 5 --
select p1.product_id, p2.total_revenue
from product_sales p1
join (
select product_id, (qty * unit_price) as total_revenue
from product_sales
order by total_revenue desc
LIMIT 3
) p2
on p1.product_id = p2.product_id;

-- 과제 6 --
select c.category_id, c.category_name, a.qty, a.last_date
from categories c
left join (
select p.category_id, SUM(ps.qty) as qty, MAX(ps.sale_Date) as last_date
from product_sales ps
join products p
on ps.product_id = p.product_id
group by p.category_id
) as a
on c.category_id = a.category_id;
