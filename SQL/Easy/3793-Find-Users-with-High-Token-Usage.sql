-- 출처 : https://leetcode.com/problems/find-users-with-high-token-usage/description

-- case.1
select p1.user_id, p2.prompt_count, p2.avg_tokens
from prompts p1, (
    select user_id, count(*) prompt_count, round(avg(tokens), 2) avg_tokens
    from prompts
    group by user_id
    having count(*) >= 3
) p2
where p1.user_id = p2.user_id
and p1.tokens > p2.avg_tokens
group by p1.user_id, p2.prompt_count, p2.avg_tokens
order by p2.avg_tokens desc;

-- case.2
select user_id, count(*) prompt_count, round(avg(tokens), 2) avg_tokens
from prompts
group by user_id
having count(*) >= 3
and max(tokens) > avg(tokens)
order by avg_tokens desc;