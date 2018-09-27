
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


-- �� �׽�Ʈ�� insert
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_1', '2018-09-17', '1030', '2');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_2', '2018-09-17', '1030', '3');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_2', '2018-09-17', '1030', '4');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_3', '2018-09-17', '1030', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D001_2', '2018-09-17', '1030', '5');

insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_2','C001',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('L001_3','L001',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D001_2','D001',1,50,'2D, 3D','moving/images/seat1.jpg');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'moving/images/poster02.jpg', '�Ű��Բ�', 'comedy', 'ing', '0', '���¿� ���� ��ȭ', 'Korea', '7,8', '1,2,3', '3D', '140', '2018-06-15', '2018-06-30');

insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C011','CGV','����','1544-1122','SEO','����� ���ı� ��η� 66','�������̺������','37.477633','127.1249435','cWang.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L011','LOTTE','����Ÿ����','1544-8855','SEO','����� ���ı� �ø��ȷ� 300','�Ե������ 5F','37.513689','127.1044541','lWord.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M011','MEGABOX','������ũ�Ϻ��','1544-0070','SEO','����� ���ı� ���Ĵ�� 111','�Ϻ��Ǫ������','37.4776339','127.124934','mSongpa.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C012','CGV','������','1544-1122','GGD','��⵵ �����ν� ��ȭ�� 525','�����ι��ڿ���','37.7334609','127.6805888','default.png',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D011','INDEP','��ȭ�����־�','032-427-6777','ICH','��õ ����Ȧ�� ����Ȧ���','716','37.461241','126.680588','default.png',now(),'��ð� : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C013','CGV','����','1544-1122','GWD','������ ���ֽ�','������ 171','37.3448535','127.9308469','default.png',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M012','MEGABOX','����','1544-0070','JJD','���ֵ� ���ֽ� �߾ӷ�14��','18','33.5116003','126.5226707','default.png',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C021','CGV','����','1544-1122','SEO','����� ���ı� ��η� 66','�������̺������','37.477633','127.1249435','cWang.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L021','LOTTE','����Ÿ����','1544-8855','SEO','����� ���ı� �ø��ȷ� 300','�Ե������ 5F','37.513689','127.1044541','lWord.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M021','MEGABOX','������ũ�Ϻ��','1544-0070','SEO','����� ���ı� ���Ĵ�� 111','�Ϻ��Ǫ������','37.4776339','127.124934','mSongpa.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C022','CGV','������','1544-1122','GGD','��⵵ �����ν� ��ȭ�� 525','�����ι��ڿ���','37.7334609','127.6805888','default.png',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D021','INDEP','��ȭ�����־�','032-427-6777','ICH','��õ ����Ȧ�� ����Ȧ���','716','37.461241','126.680588','default.png',now(),'��ð� : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C023','CGV','����','1544-1122','GWD','������ ���ֽ�','������ 171','37.3448535','127.9308469','default.png',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M022','MEGABOX','����','1544-0070','JJD','���ֵ� ���ֽ� �߾ӷ�14��','18','33.5116003','126.5226707','default.png',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');


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
WHERE mCode=3 AND addr1='SEO'
GROUP BY CT.cineCode
ORDER BY brandName ASC, cineName ASC;

-- �� �ּ��� ������
SELECT cineCode, brandName, cineName
FROM cinemaTable
WHERE addr1="SEO"
ORDER BY brandName ASC, cineName ASC;


