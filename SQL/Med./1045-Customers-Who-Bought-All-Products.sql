-- 출처 : https://leetcode.com/problems/customers-who-bought-all-products/description

select c.customer_id
from (
    select customer_id, product_key
    from Customer
    group by customer_id, product_key
) c
group by c.customer_id
having count(*) = (select count(*) from Product);

-- 참고
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);