-- 출처 : https://leetcode.com/problems/employees-earning-more-than-their-managers/description

select e1.name as Employee
from Employee e1, Employee e2
where e1.managerId = e2.id
and e1.salary > e2.salary;