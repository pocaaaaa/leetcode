-- 출처 : https://leetcode.com/problems/find-covid-recovery-patients/description

select p.patient_id
      , p.patient_name
      , p.age
      , a.negative_date - a.positive_date as recovery_time
from (
    select patient_id
        , min(case when result = 'Positive' then test_date end) positive_date
        , min(case when result = 'Negative' then test_date end) negative_date
    from covid_tests
    group by patient_id
    having count(*) > 1
) a, patients p
where a.positive_date < a.negative_date
and p.patient_id = a.patient_id
order by recovery_time, p.patient_name