-- 출처 : https://leetcode.com/problems/delete-duplicate-emails/description

delete
from Person
where (id, email) not in (
    select min(id) as "id", email
    from Person
    group by email
)