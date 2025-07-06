-- 출처 : https://leetcode.com/problems/market-analysis-i/description

select 
        u.user_id as buyer_id
        , to_char(u.join_date, 'YYYY-MM-DD') as join_date
        , count(o.buyer_id) as orders_in_2019
from Users u 
left outer join Orders o
on o.buyer_id = u.user_id
and o.order_date between to_date('20190101', 'YYYYMMDD') and to_date('20191231', 'YYYYMMDD')
group by u.user_id, to_char(u.join_date, 'YYYY-MM-DD');


select 
        u.user_id as buyer_id
        , to_char(u.join_date, 'YYYY-MM-DD') as join_date
        , sum(case when to_char(order_date, 'YYYY') = '2019' then 1 else 0 end) as orders_in_2019
from Users u 
left outer join Orders o
on o.buyer_id = u.user_id
group by u.user_id, to_char(u.join_date, 'YYYY-MM-DD');