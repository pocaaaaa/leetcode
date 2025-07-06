-- 출처 : https://leetcode.com/problems/fix-names-in-a-table/description

select user_id, upper(substr(name, 0, 1)) || lower(substr(name, 2)) as name
from Users
order by user_id;

select user_id, concat(upper(substr(name, 0, 1)), lower(substr(name, 2))) as name
from Users
order by user_id;