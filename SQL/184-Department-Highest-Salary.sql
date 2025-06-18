-- 출처 : https://leetcode.com/problems/department-highest-salary/description

select d.name as Department, e.name as Employee, e.salary as Salary
from (
    select  name, salary, departmentId, 
            dense_rank() over(partition by departmentId order by salary desc) drank
    from Employee
) e
inner join Department d
on d.id = e.departmentId
where e.drank = 1;