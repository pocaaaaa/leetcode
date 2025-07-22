-- 출처 : https://leetcode.com/problems/sales-analysis-iii/description

-- case1
select p.product_id, p.product_name
from (
    select s.product_id
from (
    select product_id
            , (case 
                    when sale_date between '2019-01-01' and '2019-03-31' 
                    then 0 
                    else 1 
                end) as quarter
        from Sales
    ) s
    group by product_id
    having max(quarter) = 0
) s, Product p
where p.product_id = s.product_id;

-- case2
select p.product_id, p.product_name
from (
    select product_id
    from Sales
    group by product_id
    having min(sale_date) >= '2019-01-01'
    and max(sale_date) <= '2019-03-31'
) s, Product p
where p.product_id = s.product_id;