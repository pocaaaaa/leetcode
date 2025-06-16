-- 출처 : https://leetcode.com/problems/rank-scores/description

select score, dense_rank() over(order by score desc) rank
from Scores;