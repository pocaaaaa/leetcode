-- 출처 : https://leetcode.com/problems/average-time-of-process-per-machine

select x.machine_id, round(avg(x.endTime - x.startTime), 3) as processing_time
from (
    select a.machine_id
          , a.process_id
          , max(case activity_type when 'start' then a.timestamp else 0 end) as startTime
          , max(case activity_type when 'end' then a.timestamp else 0 end) as endTime
    from Activity a
    group by a.machine_id, a.process_id
) x
group by x.machine_id

