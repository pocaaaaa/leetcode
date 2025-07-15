-- 출처 : https://leetcode.com/problems/find-total-time-spent-by-each-employee/description

select to_char(event_day, 'yyyy-mm-dd') as "day"
      , emp_id as "emp_id"
      , sum(out_time - in_time) as "total_time"
from Employees
group by event_day, emp_id
order by 3 desc;