
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

-- screenTable, roomTable insert
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_1', '2018-09-17', '1030', '2');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_2', '2018-09-17', '1030', '3');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('L001_2','C001',1,50,'2D, 3D','moving/images/seat1.jpg');


-- ��ȭ����(mCode) -> �󿵱���(cineCode,brandName,cineName,logoImgMF) ��������
SELECT sCode,roomCode,sdate,stime
FROM screenTable
WHERE mCode=2
ORDER BY sCode ASC;

SELECT *
FROM cinemaTable CT
INNER JOIN roomTable RT
ON CT.cineCode=RT.cineCode
INNER JOIN screenTable ST
ON RT.roomCode=ST.roomCode
WHERE mCode=3
GROUP BY CT.cineCode
ORDER BY brandName ASC, cineName ASC;

