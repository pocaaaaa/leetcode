-- 출처 : https://leetcode.com/problems/immediate-food-delivery-ii/description

select round(sum(case when d.order_date = d.customer_pref_delivery_date then 1 else 0 end) / count(*) * 100, 2) as "immediate_percentage"
from (
    select 
            row_number() over(partition by customer_id order by order_date) as rnum
            , order_date
            , customer_pref_delivery_date
    from Delivery
) d
where d.rnum = 1;