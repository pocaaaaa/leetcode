-- 출처 : https://leetcode.com/problems/movie-rating/description

select x.name as results
from (
    select m.user_id, count(m.user_id) as cnt, u.name
    from MovieRating m, Users u
    where m.user_id = u.user_id
    group by m.user_id, u.name
    order by cnt desc, u.name
) x
where rownum = 1
union all
select (select title from Movies where x.movie_id = movie_id) as results
from (
    select movie_id, avg(rating) as rating
    from MovieRating m
    where created_at >= TO_DATE('20200201', 'YYYYMMDD') 
    and TO_DATE('20200301', 'YYYYMMDD') > created_at
    group by movie_id
    order by rating desc
) x
where rownum = 1