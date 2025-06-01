-- 출처 : https://leetcode.com/problems/exchange-seats/description

select id, nvl(case when mod(id, 2) = 0 then lag(student) over(order by id) else lead(student) over(order by id) end, student) as student
from Seat