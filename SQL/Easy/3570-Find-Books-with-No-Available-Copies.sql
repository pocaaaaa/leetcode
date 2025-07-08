-- 출처 : https://leetcode.com/problems/find-books-with-no-available-copies/description

select l.book_id, l.title, l.author, l.genre, l.publication_year, total_copies as current_borrowers
from library_books l
inner join (
    select book_id, sum(case when return_date is null then 1 else 0 end) as cnt
    from borrowing_records 
    group by book_id
) b
on b.book_id = l.book_id
and b.cnt = l.total_copies
order by current_borrowers desc, l.title;