-- 출처 : https://leetcode.com/problems/find-product-recommendation-pairs/description

select p.product1_id
      , p.product2_id
      , pi1.category as product1_category
      , pi2.category as product2_category
      , p.customer_count
from (
    select p1.product_id as product1_id
          , p2.product_id as product2_id
          , count(distinct p1.user_id) as customer_count
    from ProductPurchases p1, ProductPurchases p2
    where p1.user_id = p2.user_id
    and p1.product_id < p2.product_id
    group by p1.product_id, p2.product_id
    having count(distinct p1.user_id) > 2
) p, ProductInfo pi1, ProductInfo pi2
where p.product1_id = pi1.product_id
and p.product2_id = pi2.product_id
order by p.customer_count desc, p.product1_id, product2_id;