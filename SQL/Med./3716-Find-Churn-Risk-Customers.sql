-- 출처 : https://leetcode.com/problems/find-churn-risk-customers/description

select user_id
      , max(plan_name) keep(dense_rank last order by event_id) current_plan
      , max(monthly_amount) keep(dense_rank last order by event_id) current_monthly_amount
      , max(monthly_amount) max_historical_amount
      , max(event_date) - min(event_date) days_as_subscriber
from subscription_events
group by user_id
having max(event_type) keep(dense_rank last order by event_id) != 'cancel'
and sum(case when event_type = 'downgrade' then 1 end) > 0
and round(max(monthly_amount) keep(dense_rank last order by event_id) / max(monthly_amount), 2) < 0.5
and max(event_date) - min(event_date) >= 60
order by days_as_subscriber desc, user_id;


-- HAVING 절 내에서 OVER() (분석 함수)를 직접 사용할 수 없음. 
-- Gimini 참조 
SELECT 
        user_id,
        current_plan,
        current_monthly_amount,
        max_historical_amount,
        days_as_subscriber
FROM (
    SELECT 
          user_id,
          last_value(plan_name) OVER (
            PARTITION BY user_id ORDER BY event_id 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
          ) AS current_plan,
          last_value(monthly_amount) OVER (
            PARTITION BY user_id ORDER BY event_id 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
          ) AS current_monthly_amount,
          last_value(event_type) OVER (
            PARTITION BY user_id ORDER BY event_id 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
          ) AS last_event_type,
          MAX(monthly_amount) OVER (PARTITION BY user_id) AS max_historical_amount,
          COUNT(CASE WHEN event_type = 'downgrade' THEN 1 END) OVER (PARTITION BY user_id) AS downgrade_count,
          MAX(event_date) OVER (PARTITION BY user_id) - MIN(event_date) OVER (PARTITION BY user_id) AS days_as_subscriber,
          ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_id DESC) AS rn
    FROM
          subscription_events
)
WHERE rn = 1 
  AND last_event_type != 'cancel'
  AND downgrade_count > 0
  AND (current_monthly_amount / NULLIF(max_historical_amount, 0)) < 0.5
  AND days_as_subscriber >= 60
ORDER BY days_as_subscriber DESC, user_id;


-- fist_value 사용 버전
SELECT user_id,
        current_plan,
        current_monthly_amount,
        max_historical_amount,
        days_as_subscriber
FROM (
    SELECT 
          user_id,
          FIRST_VALUE(plan_name) OVER (PARTITION BY user_id ORDER BY event_id DESC) AS current_plan,
          FIRST_VALUE(monthly_amount) OVER (PARTITION BY user_id ORDER BY event_id DESC) AS current_monthly_amount,
          FIRST_VALUE(event_type) OVER (PARTITION BY user_id ORDER BY event_id DESC) AS last_event_type,
          MAX(monthly_amount) OVER (PARTITION BY user_id) AS max_historical_amount,
          COUNT(CASE WHEN event_type = 'downgrade' THEN 1 END) OVER (PARTITION BY user_id) AS downgrade_count,
          MAX(event_date) OVER (PARTITION BY user_id) - MIN(event_date) OVER (PARTITION BY user_id) AS days_as_subscriber,
          ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_id DESC) AS rn
    FROM
          subscription_events
)
WHERE rn = 1
  AND last_event_type != 'cancel'
  AND downgrade_count > 0
  AND (current_monthly_amount / NULLIF(max_historical_amount, 0)) < 0.5
  AND days_as_subscriber >= 60
ORDER BY days_as_subscriber DESC, user_id;