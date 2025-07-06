-- 출처 : https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description

select to_char(activity_date, 'YYYY-MM-DD') AS day, count(distinct user_id) AS active_users
from Activity
where activity_date between to_date('2019-07-27') - 29 and to_date('2019-07-27')
group by activity_date
order by day;