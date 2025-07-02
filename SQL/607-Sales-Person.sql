-- 출처 : https://leetcode.com/problems/sales-person/description

select sp.name
from SalesPerson sp
where sp.sales_id not in (
    select sales_id
    from Orders o 
    inner join Company c
    on c.com_id = o.com_id
    and c.name = 'RED'
);