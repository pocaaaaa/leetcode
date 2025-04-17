-- 출처 : https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions

select a.customer_id, a.count_no_trans
from (
    select v.customer_id, count(*) as count_no_trans
    from Visits v
    where not exists (
        select 'x'
        from Transactions t
        where t.visit_id = v.visit_id
    )
    group by v.customer_id
) a
order by a.count_no_trans, a.customer_id;

-- SELECT v.customer_id,count(*) AS count_no_trans FROM Visits v
-- LEFT JOIN Transactions t
-- ON v.visit_id=t.visit_id
-- WHERE t.amount IS NULL
-- GROUP BY 1