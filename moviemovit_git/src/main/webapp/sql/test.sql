
-- �����̲� : ��ȭ���� ���� ���
SELECT aa.cineCode, brandName, cineName, tel, addr1, addr2, addr3, logoImg, startotal
from cinematable as aa
JOIN 
   (SELECT cineCode, (sum(pixel)+sum(sound)+sum(clean)+sum(service)
                       +sum(seat)+sum(around)+sum(snack)+sum(trans))/8 as startotal
   FROM reviewStarTable
   GROUP BY cineCode) AS bb
ON aa.cineCode = bb.cineCode;

-- ���� ������ �Է� �� �˻���� ��ġ�ϴ� ȸ�� ���̵� ��� ��������
SELECT uid
FROM userTable
WHERE uid LIKE '%1%'
ORDER BY uid ASC

-- ȸ�� �߰�
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m1', 'me1234!', '����', 'W', '19940426', 'cheerup_km@naver.com', '01012345678',now(), 'ADMIN');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m2', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SELLER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m3', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m4', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m5', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SILVER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m6', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'F');

-- QnATable ��� �亯�˰���κи� ����
select title, uid, groupNo, indent, groupNum
from QnATable
where groupNo=5;

-- ��ȫ 0917 ��� test
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
