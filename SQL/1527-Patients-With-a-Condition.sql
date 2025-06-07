-- 출처 : https://leetcode.com/problems/patients-with-a-condition/description

select patient_id, patient_name, conditions
from Patients
where concat(' ', conditions) like '% DIAB1%';

select patient_id, patient_name, conditions
from Patients
where conditions like '% DIAB1%'
or conditions like 'DIAB1%';