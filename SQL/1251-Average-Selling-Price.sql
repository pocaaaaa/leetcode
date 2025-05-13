-- 출처 : https://leetcode.com/problems/average-selling-price/description

select  p.product_id
        , nvl(round(sum(p.price * u.units) / sum(u.units), 2), 0) as average_price
from Prices p 
left outer join UnitsSold u 
on u.product_id = p.product_id
and u.purchase_date between p.start_date and p.end_date
group by p.product_id;