-- 출처 : https://leetcode.com/problems/department-top-three-salaries/description

select d.name as "Department", e.name as "Employee", e.salary as "Salary"
from (
    select 
            name, 
            salary, 
            departmentId, 
            dense_rank() over(partition by departmentId order by salary desc) drnum
    from Employee 
) e
inner join Department d
on e.departmentId = d.id
where e.drnum < 4;