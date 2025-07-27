-- 출처 : https://leetcode.com/problems/find-products-with-valid-serial-numbers/description

-- ChatGPT 사용
select product_id, product_name, description
from products 
where REGEXP_LIKE(description, '(^|[^A-Z0-9])SN[0-9]{4}-[0-9]{4}([^0-9]|$)')
order by product_id;