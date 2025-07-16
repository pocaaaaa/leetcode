-- 출처 : https://leetcode.com/problems/find-overbooked-employees/description

select m.employee_id, e.employee_name, e.department, m.meeting_heavy_weeks
from (
    select m.employee_id, count(*) as meeting_heavy_weeks
    from (
        select m.employee_id
        from meetings m
        group by employee_id, trunc(m.meeting_date, 'IW')
        having sum(m.duration_hours) > 20
    ) m
    group by m.employee_id
    having count(*) > 1
) m, employees e
where e.employee_id = m.employee_id
order by m.meeting_heavy_weeks desc, e.employee_name;