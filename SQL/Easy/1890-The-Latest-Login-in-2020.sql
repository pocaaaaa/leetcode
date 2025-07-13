-- 출처 : https://leetcode.com/problems/the-latest-login-in-2020/description

select user_id, max(time_stamp) as last_stamp
from Logins
where time_stamp >= to_date('20200101', 'yyyy-mm-dd')
and time_stamp < to_date('20210101', 'yyyy-mm-dd')
group by user_id;