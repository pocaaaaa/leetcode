-- 출처 : https://leetcode.com/problems/last-person-to-fit-in-the-bus/description

select q.person_name
from (
    select person_name, sum(weight) over(order by turn) AS totalWeight
    from Queue 
    order by 2 desc
) q
where q.totalWeight <= 1000
and rownum = 1;