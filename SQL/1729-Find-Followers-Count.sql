-- 출처 : https://leetcode.com/problems/find-followers-count/description

select user_id, count(follower_id) AS "followers_count"
from Followers
group by user_id
order by user_id;