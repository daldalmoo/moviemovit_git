
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

-- 뷰 테스트용 insert
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


-- 영화선택(mCode) -> 상영극장(cineCode,brandName,cineName,logoImgMF)
SELECT *
FROM cinemaTable CT
INNER JOIN roomTable RT
ON CT.cineCode=RT.cineCode
INNER JOIN screenTable ST
ON RT.roomCode=ST.roomCode
WHERE mCode=3 AND addr1='SEO'
GROUP BY CT.cineCode
ORDER BY brandName ASC, cineName ASC;

-- 주소1 -> 극장목록
SELECT cineCode, brandName, cineName
FROM cinemaTable
WHERE addr1="SEO"
ORDER BY brandName ASC, cineName ASC;

-- 영화코드,주소1 -> 상영극장 개수
SELECT COUNT(CT.cineCode)
FROM cinemaTable CT
INNER JOIN roomTable RT
ON CT.cineCode=RT.cineCode
INNER JOIN screenTable ST
ON RT.roomCode=ST.roomCode
WHERE mCode=3 AND addr1='SEO';

-- 영화코드,주소1 -> 상영극장 개수 (mMame 에 addr1 담아옴)
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

-- 체인별, 주소1 -> 극장 목록 <ul> 전체
SELECT *
FROM cinemaTable
WHERE cineCode LIKE 'C%'
ORDER BY cineName ASC;

-- 극장명 검색
SELECT cineCode, brandName, cineName
FROM cinemaTable
WHERE cineName LIKE '%타%'

-- 영화코드 -> 상영날짜
    SELECT sdate
    FROM cinemaTable CT
    INNER JOIN roomTable RT
    ON CT.cineCode=RT.cineCode
    INNER JOIN screenTable ST
    ON RT.roomCode=ST.roomCode
    WHERE mCode=5
    GROUP BY ST.sdate
    ORDER BY sdate
    
-- 극장코드 -> 상영날짜
    SELECT sdate
    FROM cinemaTable CT
    INNER JOIN roomTable RT
    ON CT.cineCode=RT.cineCode
    INNER JOIN screenTable ST
    ON RT.roomCode=ST.roomCode
    WHERE CT.cineCode='D001'
    GROUP BY ST.sdate
    ORDER BY sdate

-- 영화코드,극장코드 -> 상영날짜
    SELECT sdate
    FROM cinemaTable CT
    INNER JOIN roomTable RT
    ON CT.cineCode=RT.cineCode
    INNER JOIN screenTable ST
    ON RT.roomCode=ST.roomCode
    WHERE mCode=5 AND CT.cineCode='D001'
    GROUP BY ST.sdate
    ORDER BY sdate
    
-- 영화,극장,날짜 -> 관별 시간 띄움
    SELECT sCode, RT.roomName as roomCode, sdate, stime, mCode
    FROM screenTable ST
    INNER JOIN roomTable RT
    ON ST.roomCode=RT.roomCode
    WHERE mCode = 5
          AND ST.roomCode LIKE 'D001%' 
          AND sdate = '2018-09-17'
    
-- mCode -> 영화포스터,영화이름 가져오기
SELECT poster, mName
FROM movieTable
WHERE mCode='10'



delete from cinemaTable
delete from roomTable
delete from screenTable










-- *********************** 지영 크롤링
--캐릭터셋 확인
show variables like 'c%';

-- 아닐경우 변경
ALTER DATABASE myjava DEFAULT CHARACTER SET utf8;
alter Database myjava collate = 'utf8_general_ci';

-- 특수문자 필요할때 
ALTER DATABASE homestead CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- CSV 넣기
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
-- *********************** 지영 크롤링 END
