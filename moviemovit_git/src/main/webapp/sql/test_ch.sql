
-- 찬홍 0917 평균 test
SELECT (select avg(star) from starTable WHERE mCode=4) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode      

select mt.mCode, avg(star) as star 
from movieTable mt join starTable st
ON mt.mCode = st.mCode
GROUP BY mt.mCode

--선호장르별 탑3 내림차순
SELECT (select avg(star) from starTable WHERE mCode=4) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode

--특정 유저가 평가한 영화 장르의 평균 점수
select *, @rownum:1 = @rownum+1:
(select *, avg(star)
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
where uid='member2'
group by genre) aa (SELECT @RNUM := 0) bb


--특정 유저가 평가한 영화의 장르
SET rowcount 3
select top 3, *
from (select  * 
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
where uid='member2'
group by genre

select mt.mCode, mName, genre, country, director, actor, avg(star) as star
            from (select mCode, mName, genre, country, director, actor
                  from movieTable) mt join starTable st
            on mt.mCode = st.mCode
            where uid='member2'
            group by genre
            
select mt.mCode, mName, genre as comment, country as wdate, avg(star) as aver 
from movieTable mt join starTable st
ON mt.mCode = st.mCode
where uid='member2'
group by genre
limit 3          


SELECT mName, genre, aver, uid
FROM movieTable B
     JOIN
     (select mCode, avg(star) as aver, uid
      from starTable 
       group by mCode) as A
ON A.mCode = B.mCode
where uid='member2'
group by genre

limit 3


select mName, genre, avg(star) as star, uid 
            from movieTable mt join starTable st
            ON mt.mCode = st.mCode
            WHERE st.uid='member2'
            group by genre
            
select genre as wdate, avg(star) as star, uid
            from movieTable mt join starTable st
            ON mt.mCode = st.mCode
            WHERE uid='member2'
            group by genre            
