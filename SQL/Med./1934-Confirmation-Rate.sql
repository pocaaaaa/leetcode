-- 출처 : https://leetcode.com/problems/confirmation-rate/description/

select x.user_id
    , case when x.t1 = 0 then 0 else round((x.s1 / x.t1), 2) end as confirmation_rate
from (
    select s.user_id
        , sum(case c.action when 'confirmed' then 1 else 0 end) as s1
        , count(c.user_id) as t1
    from Signups s 
    left outer join Confirmations c 
    on c.user_id = s.user_id
    group by s.user_id
) x;

-- avg 사용
Select  user_id
        , ROUND(AVG(CASE WHEN action = 'confirmed' then 1 ELSE 0 END),2) as confirmation_rate
from Confirmations
right join Signups using (user_id)  
group by user_id;