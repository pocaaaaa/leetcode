-- 출처 : https://leetcode.com/problems/consecutive-numbers/description/

select l.ConsecutiveNums
from (
    select 
            case 
                when num = lead(num) over (order by id) 
                    and num = lead(num, 2) over (order by id) 
                then num 
                else null 
            end as ConsecutiveNums
    from Logs
) l
where l.ConsecutiveNums is not null
group by l.ConsecutiveNums;