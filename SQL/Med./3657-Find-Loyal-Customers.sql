-- 출처 : https://leetcode.com/problems/find-loyal-customers/description

select customer_id
from (
    select customer_id,
            max(transaction_date) max_transcation_date,
            min(transaction_date) min_transaction_date,
            sum(case when transaction_type = 'refund' then 1 else 0 end) refund_cnt,
            count(*) cnt
    from customer_transactions
    group by customer_id
    having count(*) >= 3
) a 
where max_transcation_date - min_transaction_date >= 30 
and refund_cnt / cnt < 0.2
order by customer_id;


select customer_id
from customer_transactions
group by customer_id
having count(*) >= 3
and max(transaction_date) - min(transaction_date) >= 30 
and sum(case when transaction_type = 'refund' then 1 else 0 end) / count(*) < 0.2
order by customer_id;