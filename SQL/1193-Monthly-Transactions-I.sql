-- 출처 : https://leetcode.com/problems/monthly-transactions-i/description

select  to_char(to_date(trans_date, 'YYYY-MM-DD'), 'YYYY-MM') as "month"
        , country as "country"
        , count(id) as "trans_count"
        , sum(case when state = 'approved' then 1 else 0 end) as "approved_count"
        , sum(amount) as "trans_total_amount"
        , sum(case when state = 'approved' then amount else 0 end) as "approved_total_amount"
from Transactions
group by grouping sets((to_char(to_date(trans_date, 'YYYY-MM-DD'), 'YYYY-MM'), country))
order by 1, 2 desc;

-- MySQL
-- IF(컬럼 = 조건, 결과1, 결과2)
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month
    , country
    , COUNT(*) AS trans_count
    , SUM(IF(state = 'approved', 1, 0)) AS approved_count
    , SUM(amount) AS trans_total_amount
    , SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country;