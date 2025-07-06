-- 출처 : https://leetcode.com/problems/rearrange-products-table/description

select * 
from Products
unpivot (
    price
    for store
    in(
        store1 as 'store1',
        store2 as 'store2',
        store3 as 'store3'
    )
);

select product_id,'store1' as store,store1 as price from Products where store1 is not null
union
select product_id,'store2' as store,store2 as price from Products where store2 is not null
union
select product_id,'store3' as store,store3 as price from Products where store3 is not null