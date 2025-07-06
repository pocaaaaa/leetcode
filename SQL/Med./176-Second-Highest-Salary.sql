-- 출처 : https://leetcode.com/problems/second-highest-salary/description

-- case1
select max(e.salary) as SecondHighestSalary
from (
    select dense_rank() over(order by salary desc) as drank, salary
    from Employee
    union all
    select 2 as drank, null as salary
    from dual
) e
where e.drank = 2;

-- case2
select max(e.salary) as SecondHighestSalary
from (
    select dense_rank() over(order by salary desc) as drank, salary
    from Employee
) e
where e.drank = 2;

-- case3
select max(salary) as SecondHighestSalary
from Employee
where Salary not in (select max(salary) from Employee);