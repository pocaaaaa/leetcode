-- 출처 : https://leetcode.com/problems/product-sales-analysis-i/description

select p.product_name, s.year, s.price
from Product p
inner join Sales s
on s.product_id = p.product_id;