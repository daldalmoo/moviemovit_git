
-- ÂùÈ« 0917 Æò±Õ test
SELECT sCode, mCode, uid, (select avg(star) from starTable where mCode=1) as star , comment, wdate
FROM starTable

select mt.mCode, st.star
from (SELECT mCode, (select avg(star) from starTable where mCode=1) as star
      FROM starTable ) st join movieTable mt
ON mt.mCode = st.mCode
WHERE mt.mCode = 1


select mt.mCode, mt.mName, mt.s_date, avg(star) 
from movieTable mt join starTable st
ON mt.mCode = st.mCode
GROUP BY mt.mCode

SELECT mt.mCode, mt.poster, mt.mName, st.star
FROM movieTable mt join starTable st
ON mt.mCode = st.mCode

SELECT sCode, mCode, uid, (select avg(star) from starTable) as star, comment, wdate
FROM starTable
WHERE mCode=1
SELECT mCode, (select avg(star) from starTable where mCode=3) as avgstar
FROM starTable
where 


SELECT (select avg(star) from starTable) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode
            
    
          
select mt.mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, s_date, e_date, avg(star) as runningTime 
          from movieTable mt join starTable st
          ON mt.mCode = st.mCode
          GROUP BY mt.mCode
          
          
          
