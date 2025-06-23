-- 출처 : https://leetcode.com/problems/analyze-subscription-conversion/description

select  u.user_id
        , round(trial_sum_duration/trial_cnt_duration, 2) as trial_avg_duration
        , round(paid_sum_duration/paid_cnt_duration, 2) as paid_avg_duration
from (
    select  user_id
            , sum(case when activity_type = 'free_trial' then activity_duration else 0 end) as trial_sum_duration
            , sum(case when activity_type = 'free_trial' then 1 else 0 end) as trial_cnt_duration
            , sum(case when activity_type = 'paid' then activity_duration else 0 end) as paid_sum_duration
            , sum(case when activity_type = 'paid' then 1 else 0 end) as paid_cnt_duration
    from UserActivity
    group by user_id
) u
where u.paid_cnt_duration > 0
order by u.user_id;