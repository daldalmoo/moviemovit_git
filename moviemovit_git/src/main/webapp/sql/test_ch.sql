
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
select avg(star)
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
where uid='member2'
group by genre

--특정 유저가 평가한 영화의 장르
select *
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
limit
where uid='member2'
group by genre


select * 
from starTable

          
          
