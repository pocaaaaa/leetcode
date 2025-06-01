-- 출처 : https://leetcode.com/problems/employees-whose-manager-left-the-company/description

select e1.employee_id
from Employees e1
left outer join Employees e2
on e1.manager_id = e2.employee_id
where e1.manager_id is not null
and e2.employee_id is null
and e1.salary < 30000
order by e1.employee_id;


select e1.employee_id
from Employees e1
where e1.manager_id is not null
and e1.salary < 30000
and not exists (
    select 'x'
    from Employees
    where employee_id = e1.manager_id
)
order by e1.employee_id;