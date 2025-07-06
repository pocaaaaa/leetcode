-- 출처 : https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description

select teacher_id, count(distinct subject_id) AS cnt
from Teacher
group by teacher_id;