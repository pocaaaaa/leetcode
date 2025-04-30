-- 출처 : https://leetcode.com/problems/employee-bonus/description/

select e.name, b.bonus
from Employee e
left outer join Bonus b
on b.empId = e.empId
where nvl(b.bonus, 0) < 1000;