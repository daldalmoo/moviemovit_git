
-- ��ȫ 0917 ��� test
SELECT (select avg(star) from starTable WHERE mCode=4) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode      

select mt.mCode, avg(star) as star 
from movieTable mt join starTable st
ON mt.mCode = st.mCode
GROUP BY mt.mCode

--��ȣ�帣�� ž3 ��������
SELECT (select avg(star) from starTable WHERE mCode=4) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode

--Ư�� ������ ���� ��ȭ �帣�� ��� ����
select avg(star)
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
where uid='member2'
group by genre

--Ư�� ������ ���� ��ȭ�� �帣
select *
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
limit
where uid='member2'
group by genre


select * 
from starTable

          
          
