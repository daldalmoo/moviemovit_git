
-- ÂùÈ« 0917 Æò±Õ test
SELECT sCode, mCode, uid, (select avg(star) from starTable where mCode=1) as star , comment, wdate
FROM starTable

select mt.*, st.star
from (SELECT sCode, mCode, uid, (select avg(star) from starTable where mCode=4) as star, comment, wdate
      FROM starTable ) st join movieTable mt
ON mt.mCode = st.mCode
WHERE st.mCode = 4
GROUP BY mCode


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
