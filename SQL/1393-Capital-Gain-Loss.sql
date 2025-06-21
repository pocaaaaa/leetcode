-- 출처 : https://leetcode.com/problems/capital-gainloss/description

select  stock_name
        , sum(case when operation = 'Sell' then price else price * -1 end) as capital_gain_loss
from Stocks
group by stock_name