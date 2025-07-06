-- 출처 : https://leetcode.com/problems/biggest-single-number/description

select max(mn.num) AS num
from (
    select num
    from MyNumbers
    group by num
    having count(*) = 1
) mn;