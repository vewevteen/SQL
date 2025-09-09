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


-- 실습 1 --
select *
from product_sales
where (sale_id, qty*unit_price) = 
(select sale_id, MAX(qty*unit_price) unit_price
from product_sales
group by sale_id
order by unit_price 
desc LIMIT 1
);

-- 실습 2 --
select * 
from products
where category_id in (
select category_id
from products
where price >= 100000
group by category_id
having count(*) >= 2
);

-- 실습 3 --
select *
from products
where (category_id, price)
in (
select category_id, MAX(price)
from products
group by category_id
)
;

-- 실습 4 --
select p.product_id, p.product_name, p.category_id, p.price
from products p
join (
select category_id, avg(price) as avg_price
from products
group by category_id
) as ap
on p.category_id = ap.category_id
and p.price > ap.avg_price;

-- 실습 5 --
select c.category_id, c.category_name, tp.total_revenue
from categories c
join (
select p.category_id, SUM(ps.qty * ps.unit_price) as total_revenue
from products p
join product_sales ps
on p.product_id = ps.product_id
group by p.category_id
) as tp
on c.category_id = tp.category_id
LIMIT 1;

-- 실습 6 --
select product_id,
product_name,
price,
(select SUM(qty * unit_price) as total_price
from product_sales ps
where p.product_id = ps.product_id
group by product_id)
as total_price,
(select MAX(sale_date)
from product_sales ps
where p.product_id = ps.product_id
group by product_id)
as last_sale_date
from products p
