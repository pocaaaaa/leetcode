-- 출처 : https://leetcode.com/problems/combine-two-tables/description

select p.firstName, p.lastName, a.city, a.state
from Person p
left outer join Address a
on a.personId = p.personId;