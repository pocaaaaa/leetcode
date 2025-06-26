-- 출처 : https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description

select customer_number
from (
    select customer_number, count(*) as cnt 
    from Orders
    group by customer_number 
    order by cnt desc
)
where rownum = 1;