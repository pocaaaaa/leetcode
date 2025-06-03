-- 출처 : https://leetcode.com/problems/restaurant-growth/description

select to_char(c1.visited_on, 'YYYY-MM-DD') as visited_on
        , sum(c2.amount) as amount
        , round(sum(c2.amount) / 7, 2) as average_amount
from (
    select distinct visited_on
    from Customer
    where visited_on > (select min(visited_on) from Customer) + 5
) c1, Customer c2
where c2.visited_on between c1.visited_on - 6 and c1.visited_on
group by c1.visited_on
order by c1.visited_on;