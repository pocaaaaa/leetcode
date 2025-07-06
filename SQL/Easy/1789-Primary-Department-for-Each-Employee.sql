-- 출처 : https://leetcode.com/problems/primary-department-for-each-employee/description

select e.employee_id, e.department_id
from (
    select employee_id
          , department_id
          , row_number() over(partition by employee_id order by primary_flag desc) as rnum
    from Employee
) e
where e.rnum = 1;