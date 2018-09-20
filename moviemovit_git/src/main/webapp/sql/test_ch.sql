
-- ÂùÈ« 0917 Æò±Õ test
SELECT sCode, mCode, uid, (select avg(star) from starTable where mCode=1) as star , comment, wdate
FROM starTable

select st.star, mt.poster
from (SELECT sCode, mCode, uid, (select avg(star) from starTable where mCode=1) as star, comment, wdate
      FROM starTable ) st join movieTable mt
ON mt.mCode = st.mCode
WHERE st.mCode = mt.mCode AND 

SELECT mt.mCode, mt.poster, mt.mName, st.star
FROM movieTable mt join starTable st
ON mt.mCode = st.mCode

SELECT sCode, mCode, uid, (select avg(star) from starTable) as star, comment, wdate
FROM starTable
WHERE mCode=1
