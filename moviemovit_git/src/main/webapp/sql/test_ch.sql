
-- 찬홍 0917 평균 test
SELECT (select avg(star) from starTable WHERE mCode=4) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode      

select mt.mCode, avg(star) as star 
from movieTable mt join starTable st
ON mt.mCode = st.mCode
GROUP BY mt.mCode

--선호장르별 탑3 내림차순
SELECT (select avg(star) from starTable WHERE mCode=4) AS avgstar
FROM starTable
WHERE mCode=4
GROUP BY mCode

--특정 유저가 평가한 영화 장르의 평균 점수
select *, @rownum:1 = @rownum+1:
(select *, avg(star)
from (select *
      from movieTable) mt join starTable st
on mt.mCode = st.mCode
where uid='member2'
group by genre) aa (SELECT @RNUM := 0) bb


--특정 유저가 평가한 영화의 장르
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


 --상영예정작 영화테이블에 인서트
INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/베놈.jpg', '베놈', 'FanSF', 'soon', '15', '영웅인가, 악당인가', '미국', '주벤 플러셔', '톰하디', '4D, IMAX', '107', '2018-10-03', '2018-10-16');  

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/암수살인.jpg', '암수살인', 'crime', 'soon', '15', '범죄자에게 걸려온 전화', '대한민국', '김태균', '김윤석, 주지훈', '2D', '110', '2018-10-03', '2018-10-16');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/미스백.jpg', '미스백', 'crime', 'soon', '15', '소녀를 구하는 미스백', '대한민국', '이지원', '한지민, 이희준', '2D', '98', '2018-10-11', '2018-10-23');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/퍼스트맨.jpg', '퍼스트맨', 'FanSF', 'soon', '12', '여러분은 지금까지 보지 못한 걸 보게 될 겁니다', '미국', '데이미언 셔젤', '라이언고슬링, 클레어 포이', '2D, IMAX', '141', '2018-10-18', '2018-10-31');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/펭귄하이웨이.jpg', '펭귄하이웨이', 'ani', 'soon', '0', '우리 동네에 펭귄이 나타났다', '일본', '이시다 히로야스', '아오이 유우, 키타 카나', '2D', '118', '2018-10-18', '2018-10-31');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/창궐.jpg', '창궐', 'action', 'soon', '15', '아귀떼가 온 세상을 집어 삼켰다!', '대한민국', '김성훈', '현빈, 장동건', '2D', '129', '2018-10-25', '2018-11-06');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/완벽한타인.jpg', '완벽한타인', 'drama', 'soon', '15', '우리 게임 한 번 해볼까?', '대한민국', '이재규', '유해진, 조진웅', '2D', '116', '2018-10-25', '2018-11-06');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '범블비', 'FanSF', 'soon', '12', '트랜스포머의 범블비가 돌아왔다!', '미국', '트래비스 나이트', '존시나, 헤일리 스테인펠드', '2D, IMAX', '120', '2018-12-13', '2018-12-31');


--상영종료 작품 인서트
INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '쥬만지', 'FanSF', 'end', '0', '게임의 세계 속으로!', '미국', '제이크 케스단', '드웨인 존슨, 잭 블랙', '4D, IMAX', '120', '2017-12-10', '2017-12-26');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '그것만이 내 세상', 'comedy', 'end', '12', '게임의 세계 속으로!', '대한민국', '최성현', '이병헌, 박정민', '2D', '127', '2018-01-24', '2018-02-06');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '골든슬럼버', 'action', 'end', '15', '암살범으로 몰린 택배기사!', '대한민국', '노동석', '강동원, 한효주', '2D', '120', '2018-02-17', '2018-02-28');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '레디 플레이어 원', 'FanSF', 'end', '12', '가상 현실의 세계 속으로', '미국', '스티븐 스필버그', '타이 쉐리던, 올리비아 쿡', '4D, IMAX', '125', '2018-03-28', '2018-04-28');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '챔피언', 'comedy', 'end', '12', '다시 한번 더 팔씨름 챔피언에 도전하는 사나이!', '대한민국', '김용완', '마동석, 권율', '2D', '110', '2018-05-03', '2018-05-21');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '버닝', 'thrillhorror', 'end', '19', '이제 진실을 이야기 해봐', '대한민국', '이창동', '유아인, 스티븐 연', '2D', '110', '2018-05-23', '2018-06-10');

INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'movie/img_poster/범블비.jpg', '나미야 잡화점의 기적', 'drama', 'end', '0', '수 십년 만에 부활한 고민상담소', '일본', '히로키 류이치', '야마다 료스케, 니시다 토시유키', '2D', '120', '2018-02-28', '2018-03-13');







            
