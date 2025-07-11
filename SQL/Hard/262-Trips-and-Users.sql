-- 출처 : https://leetcode.com/problems/trips-and-users/description

-- case1
select t.request_at as "Day"
      , round(sum(case when t.status like 'cancelled%' then 1 else 0 end) / count(*), 2) as "Cancellation Rate"
from Trips t
inner join Users u1
on u1.users_id = t.client_id
and u1.banned = 'No'
inner join Users u2
on u2.users_id = t.driver_id
and u2.banned = 'No'
where request_at between '2013-10-01' and '2013-10-03'
group by t.request_at
having count(*) > 0;

-- case2
select t.request_at as "Day"
      , round(sum(case when t.status in ('cancelled_by_driver', 'cancelled_by_client') then 1 else 0 end) / count(*), 2) as "Cancellation Rate"
from Trips t
where t.client_id in (select users_id from Users where banned = 'No' and role = 'client')
and t.driver_id in (select users_id from Users where banned = 'No' and role = 'driver')
and t.request_at between '2013-10-01' and '2013-10-03'
group by t.request_at