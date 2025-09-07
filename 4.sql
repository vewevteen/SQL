-- 1 --
select product_id, product_name, price from products where price > (select AVG(price) from products);

-- 2 --
select product_id, product_name, price 
from products 
where price > (select MIN(price) 
from products 
where category_id = (select category_id 
from categories 
where category_name = '전자'));

-- 3 --
select p.category_id, p.product_id, p.product_name, p.price
from products p
where p.price in (select MIN(price) as min_price from products group by category_id);

-- 4 --
select s.sale_id, s.product_id, s.sale_date, s.qty from product_sales s
where s.qty > (select avg(s2.qty) from product_sales s2 where s.product_id = s2.product_id group by product_id);

-- 5 --
select product_id, SUM(qty * unit_price) as total_revenue from product_sales group by product_id order by total_revenue desc LIMIT 3;

-- 6 --
select c.category_id, c.category_name, SUM(s.qty),MAX(s.sale_date)
from categories c
inner join products p
on c.category_id = p.category_id
inner join product_sales s
on p.product_id = s.product_id
group by c.category_id;
