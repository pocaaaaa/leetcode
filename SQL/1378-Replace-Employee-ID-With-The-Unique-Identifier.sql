-- 출처 : https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description

select eu.unique_id, e.name
from Employees e 
left outer join EmployeeUNI eu
on e.id = eu.id;