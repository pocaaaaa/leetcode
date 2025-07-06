-- 출처 : https://leetcode.com/problems/top-travellers/description

select max(u.name) as name, nvl(sum(r.distance), 0) as travelled_distance
from Users u
left outer join Rides r
on u.id = r.user_id
group by u.id
order by 2 desc, 1;