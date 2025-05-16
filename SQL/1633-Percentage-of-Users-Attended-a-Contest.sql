-- 출처 : https://leetcode.com/problems/percentage-of-users-attended-a-contest/

select r.contest_id, round((count(r.user_id) / (select count(*) from Users) * 100), 2) as percentage
from Register r
group by r.contest_id
order by percentage desc, r.contest_id;

select  contest_id,
        round((count(R.contest_id)/U.uid)*100,2) as percentage
from Register R
cross join (select count(user_id) as uid from Users) U
group by R.contest_id
order by percentage desc, contest_id;