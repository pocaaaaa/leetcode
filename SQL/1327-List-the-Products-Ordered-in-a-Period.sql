-- 출처 : https://leetcode.com/problems/list-the-products-ordered-in-a-period/description

select p.product_name, o.unit
from (
    select product_id, sum(unit) as unit
    from Orders 
    where order_date >= to_date('20200201', 'YYYYMMDD')
    and order_date < to_date('20200301', 'YYYYMMDD')
    group by product_id
    having sum(unit) >= 100
) o, Products p
where o.product_id = p.product_id;