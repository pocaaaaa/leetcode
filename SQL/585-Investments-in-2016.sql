-- 출처 : https://leetcode.com/problems/investments-in-2016/description

select round(sum(tiv_2016), 2) as tiv_2016
from Insurance i
where exists (
    select 'x'
    from Insurance
    where i.tiv_2015 = tiv_2015
    and i.pid != pid
)
and not exists (
    select 'x'
    from Insurance
    where i.lat = lat
    and i.lon = lon
    and i.pid != pid
)