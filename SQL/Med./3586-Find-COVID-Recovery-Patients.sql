-- 출처 : https://leetcode.com/problems/find-covid-recovery-patients/description

select p.patient_id
    , p.patient_name
    , p.age
    , c.negative_date - c.positive_date as recovery_time
from (
    select c1.patient_id
        , max(positive_date) as positive_date
        , min(c1.test_date) as negative_date
    from covid_tests c1, 
        (
            select patient_id, min(test_date) as positive_date
            from covid_tests
            where result = 'Positive'
            group by patient_id
        ) c2
    where c2.patient_id = c1.patient_id
    and c2.positive_date < c1.test_date
    and c1.result = 'Negative'
    group by c1.patient_id
) c, patients p
where p.patient_id = c.patient_id
order by recovery_time, patient_name;