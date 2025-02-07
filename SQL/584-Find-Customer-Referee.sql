-- 출처 : https://leetcode.com/problems/find-customer-referee/description/

select name
from Customer
where (referee_id is null or referee_id != 2);