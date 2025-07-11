-- 출처 : https://leetcode.com/problems/reformat-department-table/description

-- case1
select id
    , sum(case when month = 'Jan' then revenue end) as Jan_Revenue
    , sum(case when month = 'Feb' then revenue end) as Feb_Revenue
    , sum(case when month = 'Mar' then revenue end) as Mar_Revenue
    , sum(case when month = 'Apr' then revenue end) as Apr_Revenue
    , sum(case when month = 'May' then revenue end) as May_Revenue
    , sum(case when month = 'Jun' then revenue end) as Jun_Revenue
    , sum(case when month = 'Jul' then revenue end) as Jul_Revenue
    , sum(case when month = 'Aug' then revenue end) as Aug_Revenue
    , sum(case when month = 'Sep' then revenue end) as Sep_Revenue
    , sum(case when month = 'Oct' then revenue end) as Oct_Revenue
    , sum(case when month = 'Nov' then revenue end) as Nov_Revenue
    , sum(case when month = 'Dec' then revenue end) as Dec_Revenue
from Department
group by id;

-- case2
select *
from (
    select id as "id", revenue, month
    from Department
)
pivot (
    sum(revenue)
    for month in (
        'Jan' as Jan_Revenue,
        'Feb' as Feb_Revenue,
        'Mar' as Mar_Revenue,
        'Apr' as Apr_Revenue,
        'May' as May_Revenue,
        'Jun' as Jun_Revenue,
        'Jul' as Jul_Revenue,
        'Aug' as Aug_Revenue,
        'Sep' as Sep_Revenue,
        'Oct' as Oct_Revenue,
        'Nov' as Nov_Revenue,
        'Dec' as Dec_Revenue
    )
);