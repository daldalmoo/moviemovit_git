
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
select *, @rownum:1 = @rownum+1:
(select *, avg(star)
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
where uid='member2'
group by genre) aa (SELECT @RNUM := 0) bb


--Ư�� ������ ���� ��ȭ�� �帣
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


 --�󿵿����� ��ȭ���̺� �μ�Ʈ
INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/����.jpg', '����', 'FanSF', 'soon', '15', '�����ΰ�, �Ǵ��ΰ�', '�̱�', '�ֺ� �÷���', '���ϵ�', '4D, IMAX', '107', '2018-10-03', '2018-10-16');  

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�ϼ�����.jpg', '�ϼ�����', 'crime', 'soon', '15', '�����ڿ��� �ɷ��� ��ȭ', '���ѹα�', '���±�', '������, ������', '2D', '110', '2018-10-03', '2018-10-16');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�̽���.jpg', '�̽���', 'crime', 'soon', '15', '�ҳฦ ���ϴ� �̽���', '���ѹα�', '������', '������, ������', '2D', '98', '2018-10-11', '2018-10-23');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�۽�Ʈ��.jpg', '�۽�Ʈ��', 'FanSF', 'soon', '12', '�������� ���ݱ��� ���� ���� �� ���� �� �̴ϴ�', '�̱�', '���̹̾� ����', '���̾����, Ŭ���� ����', '2D, IMAX', '141', '2018-10-18', '2018-10-31');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/������̿���.jpg', '������̿���', 'ani', 'soon', '0', '�츮 ���׿� ����� ��Ÿ����', '�Ϻ�', '�̽ô� ���ξ߽�', '�ƿ��� ����, ŰŸ ī��', '2D', '118', '2018-10-18', '2018-10-31');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/â��.jpg', 'â��', 'action', 'soon', '15', '�ƱͶ��� �� ������ ���� ���״�!', '���ѹα�', '�輺��', '����, �嵿��', '2D', '129', '2018-10-25', '2018-11-06');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�Ϻ���Ÿ��.jpg', '�Ϻ���Ÿ��', 'drama', 'soon', '15', '�츮 ���� �� �� �غ���?', '���ѹα�', '�����', '������, ������', '2D', '116', '2018-10-25', '2018-11-06');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '�����', 'FanSF', 'soon', '12', 'Ʈ���������� ����� ���ƿԴ�!', '�̱�', 'Ʈ���� ����Ʈ', '���ó�, ���ϸ� ���������', '2D, IMAX', '120', '2018-12-13', '2018-12-31');


--������ ��ǰ �μ�Ʈ
INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '�길��', 'FanSF', 'end', '0', '������ ���� ������!', '�̱�', '����ũ �ɽ���', '����� ����, �� ��', '4D, IMAX', '120', '2017-12-10', '2017-12-26');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '�װ͸��� �� ����', 'comedy', 'end', '12', '������ ���� ������!', '���ѹα�', '�ּ���', '�̺���, ������', '2D', '127', '2018-01-24', '2018-02-06');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '��罽����', 'action', 'end', '15', '�ϻ������ ���� �ù���!', '���ѹα�', '�뵿��', '������, ��ȿ��', '2D', '120', '2018-02-17', '2018-02-28');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '���� �÷��̾� ��', 'FanSF', 'end', '12', '���� ������ ���� ������', '�̱�', '��Ƽ�� ���ʹ���', 'Ÿ�� ������, �ø���� ��', '4D, IMAX', '125', '2018-03-28', '2018-04-28');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', 'è�Ǿ�', 'comedy', 'end', '12', '�ٽ� �ѹ� �� �Ⱦ��� è�Ǿ� �����ϴ� �糪��!', '���ѹα�', '����', '������, ����', '2D', '110', '2018-05-03', '2018-05-21');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '����', 'thrillhorror', 'end', '19', '���� ������ �̾߱� �غ�', '���ѹα�', '��â��', '������, ��Ƽ�� ��', '2D', '110', '2018-05-23', '2018-06-10');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/�����.jpg', '���̾� ��ȭ���� ����', 'drama', 'end', '0', '�� �ʳ� ���� ��Ȱ�� ��λ���', '�Ϻ�', '����Ű ����ġ', '�߸��� �ὺ��, �Ͻô� �����Ű', '2D', '120', '2018-02-28', '2018-03-13');







            
