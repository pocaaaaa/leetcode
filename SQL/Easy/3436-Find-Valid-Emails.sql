-- 출처 : https://leetcode.com/problems/find-valid-emails/description

select user_id, email
from Users
where regexp_like(email, '^[A-Za-z0-9_]+@[A-Za-z]+.[com]{2,}$')
order by user_id;