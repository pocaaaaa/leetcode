-- 출치 : https://leetcode.com/problems/not-boring-movies/description

select c.id, c.movie, c.description, c.rating
from Cinema c 
where MOD(c.id, 2) = 1
and c.description != 'boring'
order by c.rating desc;