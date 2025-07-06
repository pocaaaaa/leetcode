-- 출처 : https://leetcode.com/problems/product-price-at-a-given-date/description

select p1.product_id, nvl(p2.new_price, 10) as price
from (
    select product_id
    from Products
    group by product_id
) p1
left outer join (
    select product_id
        , new_price
        , change_date
        , row_number() over(partition by product_id order by change_date desc) rnum
    from Products 
    where change_date <= to_date('2019-08-16')
) p2
on p2.product_id = p1.product_id
and p2.rnum = 1;