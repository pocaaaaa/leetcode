-- 출처 : https://leetcode.com/problems/find-users-with-valid-e-mails/description

select user_id as "user_id", name as "name", mail as "mail"
from Users
where regexp_like(mail, '^[A-Za-z][A-Za-z0-9._-]*@[leetcode]+.[com]{2,}$')
and mail like '%leetcode.com';