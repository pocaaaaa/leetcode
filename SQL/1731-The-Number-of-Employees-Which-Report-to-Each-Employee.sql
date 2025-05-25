-- 출처 : https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description

select e1.employee_id, e1.name, count(*) AS reports_count, round(avg(e2.age), 0) AS average_age
from Employees e1, Employees e2
where e1.employee_id = e2.reports_to
group by e1.employee_id, e1.name
order by e1.employee_id;