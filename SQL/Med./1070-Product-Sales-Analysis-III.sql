-- 출처 : https://leetcode.com/problems/product-sales-analysis-iii/description

select s.product_id, s.year AS first_year, quantity, price
from (
    select sale_id, product_id, year, quantity, price, dense_rank() over(partition by product_id order by year) as rnum
    from Sales
) s
where s.rnum = 1;