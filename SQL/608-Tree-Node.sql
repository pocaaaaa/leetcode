-- 출처 : https://leetcode.com/problems/tree-node/description/

select t.id, case when t.p_id is null then 'Root' when t.cnt > 0 then 'Inner' else 'Leaf' end as type
from (
    select t1.id, max(t1.p_id) as p_id, count(t2.p_id) as cnt
    from Tree t1
    left outer join Tree t2
    on t1.id = t2.p_id
    group by t1.id
) t