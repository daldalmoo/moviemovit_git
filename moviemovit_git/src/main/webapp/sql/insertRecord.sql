-- ------------------------- insert record
-- userTable 레코드 삽입
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member1', 'me1234!', '기경민', 'W', '19940426', 'cheerup_km@naver.com', '01012345678',now(), 'ADMIN');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member2', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SELLER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member3', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member4', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member5', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SILVER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member6', 's1234!', '우신혜', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'F');

-- movieTable 레코드 삽입
INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'moving/images/poster02.jpg', '신과함께', 'comedy', 'ing', '0', '저승에 가는 영화', 'Korea', '7,8', '1,2,3', '3D', '140', '2018-06-15', '2018-06-30');

-- peopleTable 레코드 삽입
insert into peopleTable(peoCode, peoName, country, peoBirth, gender, peoPic)
values((SELECT IFNULL(MAX(peocode),0)+1 FROM peopleTable as peo),'차태현','korea','1988', 'M', 'moving/images/peo0001.jpg'); 

-- cinemaTable 레코드 삽입
-- 지영 2018/08/31 수정 
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C001','CGV','송파','1544-1122','SEO','서울시 송파구 충민로 66','가든파이브라이프','37.477633','127.1249435','img/cWang.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L001','LOTTE','월드타워점','1544-8855','SEO','서울시 송파구 올림픽로 300','롯데월드몰 5F','37.513689','127.1044541','img/lWord.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M001','MEGABOX','송파파크하비오','1544-0070','SEO','서울시 송파구 송파대로 111','하비오푸르지오','37.4776339','127.124934','img/mSongpa.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C002','CGV','의정부','1544-1122','GGD','경기도 의정부시 평화로 525','의정부민자역사','37.7334609','127.6805888','img/default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D001','INDEP','영화공간주안','032-427-6777','ICH','인천 미추홀구 미추홀대로','716','37.461241','126.680588','img/default.png',now(),'운영시간 : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C003','CGV','원주','1544-1122','GWD','강원도 원주시','서원대 171','37.3448535','127.9308469','img/default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M002','MEGABOX','제주','1544-0070','JJD','제주도 제주시 중앙로14길','18','33.5116003','126.5226707','img/default.png',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');

-- roomTable 레코드 삽입
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_1','C001',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_2','C001',2,100,'2D','moving/images/seat2.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_3','C001',3,150,'imax','moving/images/seat3.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L001_4','L001',4,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');

-- reviewStarTable 레코드 삽입
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C001','member1',5,3,1,2,3,3,3,5,now());
insert into reviewStarTable(no,cineCode,uid,pixel,sound,service,seat,around,snack,trans,wdate)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'L001','member2',4,2,2,3,2,2,5,now());

-- reviewTable 레코드 삽입
insert into reviewTable(no,cineCode,uid,s_e,wdate,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewTable as rt),'C001','member1','좌석이 폭신폭신하고 넓어서 편안합니다',now(),'172.168.0.20',10);
insert into reviewTable(no,cineCode,uid,s_e,wdate,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewTable as rt),'L001','member2','자리앞에 팝콘 떨어진게 아직도 있더라구요',now(),'152.168.0.18',2);
insert into reviewTable(no,cineCode,uid,s_e,wdate,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewTable as rt),'M001','member3','제 키가 작은 편인데도 다리 뻗고 있기 힘들어요',now(),'128.168.0.20',0);

-- noticeTable 레코드 삽입
insert into  noticeTable(noticeno,title,s_e,uid,wdate,open)
values((SELECT ifnull(MAX(noticeno),0)+1 FROM noticeTable as notice),'사이트를 처음 이용하시는 분들',' ','admin1',now(),'Y');

-- QnATable 레코드 삽입
insert into  QnATable(qCode,qType,uid,title,content,wdate,ip,groupNo,indent)
values((SELECT ifnull(MAX(qCode),0)+1 FROM QnATable as q),'q1','member1','예매어떻게 해요','예매하는 방법을 모르겠습니다. ㅠㅠ',now(),'172.168.0.20',0,0);

-- starTable
insert into starTable(sCode, mCode, uid, star, comment, wdate)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM starTable as star), '2', 'member1', '5', '내 인생에서 본 베스트 영화', now());

-- couponTable 레코드 삽입
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member1', '2018-08-10', '2019-08-10');

-- screenTable 레코드 삽입
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_1', '2018-08-20', '1030', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_2', '2018-08-20', '1030', '1');

-- bookTable 레코드 삽입
insert into bookTable(bCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018080711330601',now(),'member1',1,'A1,A2,A3,A4','adu,you,sen,kid',1);

insert into bookTable(bCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018080711330602',now(),'member2',2,'D10,D11','you,sen',8);


