-- 출처 : https://leetcode.com/problems/triangle-judgement/description
-- greatest() : 같은 행(Row)에서 서도 다른 컬럼의 값을 비교하여 최댓값 반환.
-- least() : 같은 행(Row)에서 서도 다른 컬럼의 값을 비교하여 최솟값 반환.

select  x
        , y
        , z
        , case when greatest(x, y, z) - (x+y+z-(greatest(x, y, z))) >= 0 then 'No' else 'Yes' end as triangle 
from Triangle