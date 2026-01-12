-- 출처 : https://leetcode.com/problems/find-books-with-polarized-opinions/description

select b.book_id as "book_id"
        , b.title as "title"
        , b.author as "author"
        , b.genre as "genre"
        , b.pages as "pages"
        , (rs.max_session_rating - rs.min_session_rating) as "rating_spread"
        , round(rs.score / rs.cnt, 2) as "polarization_score"
from (
    select rs.book_id, 
        max(rs.session_rating) max_session_rating,
        min(rs.session_rating) min_session_rating,
        sum(case when rs.session_rating <= 2 or rs.session_rating >= 4 then 1 end) as score,
        count(*) cnt
    from reading_sessions rs 
    group by book_id
    having count(*) >= 5
    and max(rs.session_rating) >= 4
    and min(rs.session_rating) <= 2
) rs, books b 
where rs.book_id = b.book_id
and round(rs.score / rs.cnt) >= 0.6
order by "polarization_score" desc, b.title desc;

-- 정리
select b.book_id as "book_id"
        , b.title as "title"
        , b.author as "author"
        , b.genre as "genre"
        , b.pages as "pages"
        , rs.rating_spread as "rating_spread"
        , rs.polarization_score as "polarization_score"
from (
    select rs.book_id, 
        max(rs.session_rating) - min(rs.session_rating) rating_spread,
        round(sum(case when rs.session_rating <= 2 or rs.session_rating >= 4 then 1 end) / count(*), 2) polarization_score
    from reading_sessions rs 
    group by rs.book_id
    having count(*) >= 5
    and max(rs.session_rating) >= 4
    and min(rs.session_rating) <= 2
) rs, books b 
where rs.book_id = b.book_id
and rs.polarization_score >= 0.6
order by rs.polarization_score desc, b.title desc;