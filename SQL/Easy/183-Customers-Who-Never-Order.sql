-- 출처 : https://leetcode.com/problems/customers-who-never-order/description

select name as Customers
from Customers c
where not exists (
    select 'x'
    from Orders
    where customerId = c.id
);