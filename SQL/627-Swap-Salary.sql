-- 출처 : https://leetcode.com/problems/swap-salary/description

update Salary
set sex = decode(sex, 'm', 'f', 'm');

update Salary
set sex = (case sex when 'm' then 'f' else 'm' end);

update Salary
set sex = (case when sex = 'm' then 'f' else 'm' end);