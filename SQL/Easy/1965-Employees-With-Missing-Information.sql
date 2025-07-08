-- 출처 : https://leetcode.com/problems/employees-with-missing-information/description

select a.employee_id
from (
    select employee_id
    from Employees e 
    where not exists (
        select 'x'
        from Salaries
        where employee_id = e.employee_id
    )
    union all
    select employee_id
    from Salaries s
    where not exists (
        select 'x'
        from Employees
        where employee_id = s.employee_id
    )
) a
order by a.employee_id;