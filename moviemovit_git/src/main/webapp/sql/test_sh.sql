
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

-- �� �׽�Ʈ�� insert
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


-- ��ȭ����(mCode) -> �󿵱���(cineCode,brandName,cineName,logoImgMF)
SELECT *
FROM cinemaTable CT
INNER JOIN roomTable RT
ON CT.cineCode=RT.cineCode
INNER JOIN screenTable ST
ON RT.roomCode=ST.roomCode
WHERE mCode=3 AND addr1='SEO'
GROUP BY CT.cineCode
ORDER BY brandName ASC, cineName ASC;

-- �ּ�1 -> ������
SELECT cineCode, brandName, cineName
FROM cinemaTable
WHERE addr1="SEO"
ORDER BY brandName ASC, cineName ASC;

-- ��ȭ�ڵ�,�ּ�1 -> �󿵱��� ����
SELECT COUNT(CT.cineCode)
FROM cinemaTable CT
INNER JOIN roomTable RT
ON CT.cineCode=RT.cineCode
INNER JOIN screenTable ST
ON RT.roomCode=ST.roomCode
WHERE mCode=3 AND addr1='SEO';

-- ��ȭ�ڵ�,�ּ�1 -> �󿵱��� ���� (mMame �� addr1 ��ƿ�)
    SELECT COUNT(cineCode) cnt
    FROM ( SELECT CT.cineCode
      FROM cinemaTable CT
      INNER JOIN roomTable RT
      ON CT.cineCode=RT.cineCode
      INNER JOIN screenTable ST
      ON RT.roomCode=ST.roomCode
      WHERE mCode=5
      AND addr1="ICH"
      GROUP BY cineCode ) a

-- ü�κ�, �ּ�1 -> ���� ��� <ul> ��ü
SELECT *
FROM cinemaTable
WHERE cineCode LIKE 'C%'
ORDER BY cineName ASC;

-- ����� �˻�
SELECT cineCode, brandName, cineName
FROM cinemaTable
WHERE cineName LIKE '%Ÿ%'

-- ��ȭ�ڵ� -> �󿵳�¥
    SELECT sdate
    FROM cinemaTable CT
    INNER JOIN roomTable RT
    ON CT.cineCode=RT.cineCode
    INNER JOIN screenTable ST
    ON RT.roomCode=ST.roomCode
    WHERE mCode=5
    GROUP BY ST.sdate
    ORDER BY sdate
    
-- �����ڵ� -> �󿵳�¥
    SELECT sdate
    FROM cinemaTable CT
    INNER JOIN roomTable RT
    ON CT.cineCode=RT.cineCode
    INNER JOIN screenTable ST
    ON RT.roomCode=ST.roomCode
    WHERE CT.cineCode='D001'
    GROUP BY ST.sdate
    ORDER BY sdate

-- ��ȭ�ڵ�,�����ڵ� -> �󿵳�¥
    SELECT sdate
    FROM cinemaTable CT
    INNER JOIN roomTable RT
    ON CT.cineCode=RT.cineCode
    INNER JOIN screenTable ST
    ON RT.roomCode=ST.roomCode
    WHERE mCode=5 AND CT.cineCode='D001'
    GROUP BY ST.sdate
    ORDER BY sdate
    
-- ��ȭ,����,��¥ -> ���� �ð� ���
    SELECT sCode, RT.roomName as roomCode, sdate, stime, mCode
    FROM screenTable ST
    INNER JOIN roomTable RT
    ON ST.roomCode=RT.roomCode
    WHERE mCode = 5
          AND ST.roomCode LIKE 'D001%' 
          AND sdate = '2018-09-17'
    
-- mCode -> ��ȭ������,��ȭ�̸� ��������
SELECT poster, mName
FROM movieTable
WHERE mCode='10'



delete from cinemaTable
delete from roomTable
delete from screenTable










-- *********************** ���� ũ�Ѹ�
--ĳ���ͼ� Ȯ��
show variables like 'c%';

-- �ƴҰ�� ����
ALTER DATABASE myjava DEFAULT CHARACTER SET utf8;
alter Database myjava collate = 'utf8_general_ci';

-- Ư������ �ʿ��Ҷ� 
ALTER DATABASE homestead CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- CSV �ֱ�
load data local infile 'd:/cs/people.csv'
into table peopleTable 
fields terminated by ','
lines TERMINATED BY '\n';

load data local infile 'd:/cs/cinema.csv'
into table cinemaTable
fields terminated by ','
lines TERMINATED BY '\n';

load data local infile 'd:/cs/screen.csv'
into table screenTable
fields terminated by ','
lines TERMINATED BY '\n';

load data local infile 'd:/cs/movie.csv'
into table movieTable
fields terminated by ','
lines TERMINATED BY '\n';
-- *********************** ���� ũ�Ѹ� END
