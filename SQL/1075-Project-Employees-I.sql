-- 출처 : https://leetcode.com/problems/project-employees-i/description

select p.project_id, round(avg(e.experience_years), 2) as average_years
from Project p 
inner join Employee e
on e.employee_id = p.employee_id 
group by p.project_id;