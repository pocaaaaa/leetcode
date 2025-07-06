-- 출처 : https://leetcode.com/problems/invalid-tweets/description/

-- 문자 길이를 출력 (BYTE 길이를 가져옴 / 영문자(1BYTE) 한글은(3BYTE))
--   1) MySQL - LENGTH()
--   2) ORACLE - LENGTHB()
--   3) MSSQL - DATALENGTH()
-- 문자/칼럼의 문자 개수를 출력
--   1) MySQL - CHAR_LENGTH()
--   2) ORACLE - LENGTH()
--   3) MSSQL - LEN()

-- before (MySql)
select tweet_id
from Tweets
where length(content) > 15;

-- after 
select tweet_id
from Tweets
where len(content) > 15;

-- after (Oracle)
select tweet_id
from Tweets
where length(content) > 15;

-- after (MySql)
select tweet_id
from Tweets
where char_length(content) > 15;