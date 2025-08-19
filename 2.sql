-- 1 --
select * from user_orders order by created_at desc LIMIT 20;

-- 2 --
select * from user_orders order by created_at desc LIMIT 5 offset 10;

-- 3 --
SELECT user_id, COUNT(*) AS paid_cnt, SUM(amount) AS total_amt
FROM user_orders
WHERE status = 'PAID'
GROUP BY user_id
having total_amt >= 100000
LIMIT 5;

-- 4 --
select *
FROM app_logs
where level = "ERROR"
LIMIT 10;

-- 5 --
select DATE(created_at) as ymd, COUNT(*) as cnt
FROM app_logs
where message like "%!%%" ESCAPE "!"
Group by DATE(created_at)
having cnt >= 2
order by ymd asc;

-- 6 --
select COUNT(*) as err_cnt, service
FROM app_logs
where level = "ERROR" and created_at >= NOW() - interval 7 day
group by service
order by err_cnt desc
LIMIT 5;

-- 7 --
select *
from search_logs
where query_text like "%!%%" ESCAPE "!"
or query_text like "%!_%" ESCAPE "!"
order by created_at desc
LIMIT 10;

-- 8 --
select *
from search_logs
where query_text like "ver___"
order by created_at desc
limit 5;

-- 9 --
select user_id, COUNT(*) as query_cnt
from search_logs
group by user_id
order by query_cnt desc
limit 3;
