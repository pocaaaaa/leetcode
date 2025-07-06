-- 출처 : https://leetcode.com/problems/dna-pattern-recognition/description

select  sample_id
        , dna_sequence
        , species
        , regexp_count(dna_sequence, '^ATG') as has_start
        , regexp_count(dna_sequence, '(TAA|TAG|TGA)$') as has_stop
        , regexp_count(dna_sequence, 'ATAT') as has_atat
        , case when regexp_count(dna_sequence, 'G{3,}') > 0 then 1 else 0 end as has_ggg
from Samples
order by 1