-- 출처 : https://leetcode.com/problems/bank-account-summary-ii/description

select u.name, sum(t.amount) as BALANCE
from Transactions t
inner join Users u
on u.account = t.account
group by u.account, u.name
having sum(t.amount) > 10000;