-- 출처 : https://leetcode.com/problems/trips-and-users/description

select t.request_at as "Day"
      , round(sum(case when t.status like 'cancelled%' then 1 else 0 end) / count(*), 2) as "Cancellation Rate"
from Trips t
inner join Users u1
on u1.users_id = t.client_id
and u1.banned = 'No'
inner join Users u2
on u2.users_id = t.driver_id
and u1.banned = 'No'
group by t.request_at
having count(*) > 1