-- 출처 : https://leetcode.com/problems/group-sold-products-by-the-date/description

select to_char(sell_date, 'YYYY-MM-DD') as sell_date
    , count(distinct product) as num_sold
    , regexp_replace(listagg(product, ',') within group (order by product), '([^,]+)(,\1)*(,|$)', '\1\3') as products
from Activities
group by to_char(sell_date, 'YYYY-MM-DD')
order by sell_date

-- 19c
select to_char(sell_date, 'YYYY-MM-DD') as sell_date
    , count(distinct product) as num_sold
    , listagg(distinct product, ',') within group (order by product) as products
from Activities
group by to_char(sell_date, 'YYYY-MM-DD')
order by sell_date