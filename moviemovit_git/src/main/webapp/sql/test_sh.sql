
-- 지영이꺼 : 영화관별 별점 평균
SELECT aa.cineCode, brandName, cineName, tel, addr1, addr2, addr3, logoImg, startotal
from cinematable as aa
JOIN 
   (SELECT cineCode, (sum(pixel)+sum(sound)+sum(clean)+sum(service)
                       +sum(seat)+sum(around)+sum(snack)+sum(trans))/8 as startotal
   FROM reviewStarTable
   GROUP BY cineCode) AS bb
ON aa.cineCode = bb.cineCode;

-- 쿠폰 데이터 입력 시 검색어와 일치하는 회원 아이디 목록 가져오기
SELECT uid
FROM userTable
WHERE uid LIKE '%1%'
ORDER BY uid ASC

-- 회원 추가
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m1', 'me1234!', '기경민', 'W', '19940426', 'cheerup_km@naver.com', '01012345678',now(), 'ADMIN');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m2', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SELLER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m3', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m4', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m5', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SILVER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('m6', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'F');

-- QnATable 목록 답변알고리즘부분만 보기
select title, uid, groupNo, indent, groupNum
from QnATable
where groupNo=5;


-- 뷰 테스트용 insert
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
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'moving/images/poster02.jpg', '신과함께', 'comedy', 'ing', '0', '저승에 가는 영화', 'Korea', '7,8', '1,2,3', '3D', '140', '2018-06-15', '2018-06-30');

insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C011','CGV','송파','1544-1122','SEO','서울시 송파구 충민로 66','가든파이브라이프','37.477633','127.1249435','cWang.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L011','LOTTE','월드타워점','1544-8855','SEO','서울시 송파구 올림픽로 300','롯데월드몰 5F','37.513689','127.1044541','lWord.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M011','MEGABOX','송파파크하비오','1544-0070','SEO','서울시 송파구 송파대로 111','하비오푸르지오','37.4776339','127.124934','mSongpa.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C012','CGV','의정부','1544-1122','GGD','경기도 의정부시 평화로 525','의정부민자역사','37.7334609','127.6805888','default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D011','INDEP','영화공간주안','032-427-6777','ICH','인천 미추홀구 미추홀대로','716','37.461241','126.680588','default.png',now(),'운영시간 : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C013','CGV','원주','1544-1122','GWD','강원도 원주시','서원대 171','37.3448535','127.9308469','default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M012','MEGABOX','제주','1544-0070','JJD','제주도 제주시 중앙로14길','18','33.5116003','126.5226707','default.png',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C021','CGV','송파','1544-1122','SEO','서울시 송파구 충민로 66','가든파이브라이프','37.477633','127.1249435','cWang.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L021','LOTTE','월드타워점','1544-8855','SEO','서울시 송파구 올림픽로 300','롯데월드몰 5F','37.513689','127.1044541','lWord.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M021','MEGABOX','송파파크하비오','1544-0070','SEO','서울시 송파구 송파대로 111','하비오푸르지오','37.4776339','127.124934','mSongpa.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C022','CGV','의정부','1544-1122','GGD','경기도 의정부시 평화로 525','의정부민자역사','37.7334609','127.6805888','default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D021','INDEP','영화공간주안','032-427-6777','ICH','인천 미추홀구 미추홀대로','716','37.461241','126.680588','default.png',now(),'운영시간 : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C023','CGV','원주','1544-1122','GWD','강원도 원주시','서원대 171','37.3448535','127.9308469','default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M022','MEGABOX','제주','1544-0070','JJD','제주도 제주시 중앙로14길','18','33.5116003','126.5226707','default.png',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');


-- 영화선택(mCode) -> 상영극장(cineCode,brandName,cineName,logoImgMF) 가져오기
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

-- 각 주소의 극장목록
SELECT cineCode, brandName, cineName
FROM cinemaTable
WHERE addr1="SEO"
ORDER BY brandName ASC, cineName ASC;


