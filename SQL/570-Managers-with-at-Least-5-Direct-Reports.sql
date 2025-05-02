-- 출처 : https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/

select e1.name
from Employee e1, Employee e2
where e1.id = e2.managerId
group by e1.name, e1.id
having count(*) >= 5;