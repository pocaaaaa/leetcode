-- 출처 : https://leetcode.com/problems/game-play-analysis-iv/description

select round(count(a2.sum_cnt)/ count(*), 2) as "fraction"
from (
    select sum(case when a1.event_date = a1.min_event_date + 1 then 1 else null end) as sum_cnt
    from (
        select  player_id
                , event_date
                , min(event_date) over(partition by player_id) as min_event_date
        from Activity
    ) a1
    group by a1.player_id;
) a2;

-- 최적화
SELECT ROUND(SUM(CASE WHEN a.event_date = a.min_event_date + 1 THEN 1 ELSE 0 END) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM (
    SELECT  player_id,
            event_date,
            MIN(event_date) OVER (PARTITION BY player_id) AS min_event_date
    FROM Activity
) a;