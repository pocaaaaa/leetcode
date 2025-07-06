-- 출처 : https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description

-- rownum 대신에 fetch first row only 사용 가능. (성능상에도 fetch가 유리 / oracle 12c부터 사용 가능)
-- rownum : 처리 순서	전체 결과 계산 후 ROWNUM을 매긴 후 제한.
-- fetch first : ORDER BY 후 바로 행 제한.

select r.id, r.num
from (
    select r.requester_id as id, count(*) num
    from (
        select requester_id, accepter_id
        from RequestAccepted
        union all
        select accepter_id as requester_id, requester_id as accepter_id
        from RequestAccepted
    ) r
    group by r.requester_id
    order by num desc
) r
where rownum = 1;