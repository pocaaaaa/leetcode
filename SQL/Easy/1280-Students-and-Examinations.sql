-- 출처 : https://leetcode.com/problems/students-and-examinations/description/

select st.student_id, st.student_name, sub.subject_name, count(e.student_id) as attended_exams
from Students st
cross join Subjects sub
left outer join Examinations e
on e.student_id = st.student_id
and e.subject_name = sub.subject_name
group by st.student_id, st.student_name, sub.subject_name
order by 1, 2, 3;