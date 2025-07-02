-- 출처 : https://leetcode.com/problems/sales-person/description

select sp.name
from SalesPerson sp
left outer join Orders o
on o.sales_id = sp.sales_id
left outer join Company c
on c.com_id = o.com_id
and c.name = 'RED'
where c.com_id is null;