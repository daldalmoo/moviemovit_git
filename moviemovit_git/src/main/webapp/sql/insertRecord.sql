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
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C001','CGV','송파','1544-1122','SEO','서울시 송파구 충민로 66','가든파이브라이프','37.477633','127.1249435','cWang.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C002','CGV','의정부','1544-1122','GGD','경기도 의정부시 평화로 525','의정부민자역사','37.7334609','127.6805888','default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C003','CGV','원주','1544-1122','GWD','강원도 원주시','서원대 171','37.3448535','127.9308469','default.png',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C004','CGV','강변','1544-1122','SEO','서울시 광진구 광진로','120','56.123482','65.1249435','cgv강변.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C005','CGV','구리','1544-1122','GGD','경기도 구리시 인창동', '10','15.24536','41.124135','cgv구리.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C006','CGV','김포','1544-1122','GGD','경기도 김포시 사우중로','54','123.234234','212.234241','cgv김포.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C007','CGV','대전','1544-1122','CCD','대전광역시 중구 문화동','1-16','55.234235','12.234237','cgv동대문.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C008','CGV','서면','1544-1122','KSD','부산광역시 진구 전포3동','지오플레이스6층','124.23434','141.846512','cgv서면.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C009','CGV','제주노형','1544-1122','JJD','제주도 제주시 노형로 407','노형타워','42.346','34.567','cgv목동.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C010','CGV','수유','1544-1122','SEO','서울시 강북구 수유동','168-12','12.23466','23.87697','cgv압구정.jpg',now(),'운영시간 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L001','LOTTE','월드타워점','1544-8855','SEO','서울시 송파구 올림픽로 300','롯데월드몰 5F','37.513689','127.1044541','lWord.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L002','LOTTE','건대입구','1544-8855','SEO','서울시 광진구 자양동','227-7','636.32452','34.13451','cgv구리.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L003','LOTTE','구리아울렛','1544-8855','GGD','경기도 구리시 동구릉로 136번길','47','롯데아울렛 6층','41.153513','15.235235','cgv김포.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L004','LOTTE','강동','1544-8855','SEO','서울시 강동구 성내동','44-1','34.114423','43.346257','cgv동대문.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L005','LOTTE','성남','1544-8855','GGD','경기도 성남시 중원구 성남동','뉴코아아울렛 9F','86.247345','23.346235','cgv서면.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L006','LOTTE','수원','1544-8855','GGD','경기도 수원시 권선구 서둔동','296-3','롯데몰 롯데시네마','35.3567','46.456856','cgv목동.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L007','LOTTE','서산','1544-8855','CCD','충남 서산시 동문동','193-1','57.97456','34.45733','cgv압구정.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L008','LOTTE','전주(백화점)','1544-8855','JLD','전북 전주시 완산구 서신동','971','86.567345','76.35685','cgv강변.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L009','LOTTE','포항','1544-8855','GSD','경북 포항시 북구 장앙상가길','16','96.2456','17.24577','cgv명동.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L010','LOTTE','울산(백화점)','1544-8855','GSD','울산 남구 삼산동','1480-1','67.53683','85.356856','cgv상봉.jpg',now(),'운영시간 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M001','MEGABOX','송파파크하비오','1544-0070','SEO','서울시 송파구 송파대로 111','하비오푸르지오','37.4776339','127.124934','mSongpa.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M002','MEGABOX','제주','1544-0070','JJD','제주도 제주시 중앙로14길','18','33.5116003','126.5226707','cgv구리.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M003','MEGABOX','강남','1544-0070','SEO','서울 서초구 서초대로 77길 3','아리타워 8층','51.548003','546.5226707','cgv동대문.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M004','MEGABOX','상암월드컵경기장','1544-0070','SEO','서울 마포구 월드컵로 240','1','513.65103','213.05055','cgv김포.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M005','MEGABOX','분당','1544-0070','GGD','경기도 성남시 분당구 황새울로','332','32.56546','25.36357','cgv목동.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M006','MEGABOX','인천','1544-0070','ICH','인천 광역시 연수구 송도 과학로 16번길','트리플 스트리트 D동 2층','56.85674','55.783733','cgv강변.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M007','MEGABOX','원주','1544-0070','GWD','강원도 원주시 서원대로 165-3','아트스페이스빌딩 6층','25.3298','55.522787','cgv상봉.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M008','MEGABOX','부산대','1544-0070','GSD','부산광역시 금정구 장전로 12번길 55','라퓨타아일랜드 4층','23.6594','12.34662','cgv서면.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M009','MEGABOX','여수','1544-0070','JLD','전라남도 여수시 쌍봉로','208','68.48465','75.565156','cgv압구정.jpg',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M010','MEGABOX','동대문','1544-0070','SEO','서울시 중구 장충단로 247','굿모닝시티 9층','46.454582','346.347347','default.png',now(),'운영시간 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D001','INDEP','영화공간주안','032-427-6777','ICH','인천 미추홀구 미추홀대로','716','37.461241','126.680588','default.png',now(),'운영시간 : 8:00~2:00','http://www.cinespacejuan.com');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D002','INDEP','미니시네마','070-7612-7366','GGD','경기 고양시 덕양구','716','37.461241','126.680588','default.png',now(),'운영시간 : 8:00~2:00','http://www.minicinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D003','INDEP','필름포럼','02-363-2537','SEO','서울특별시 서대문구 성산로','527','37.461241','126.680588','필름포럼로고.jpg',now(),'운영시간 : 8:00~2:00','http://www.filmforum.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D004','INDEP','인디스페이스','02-738-0366','SEO','서울특별시 종로구 돈화문로','13','37.461241','126.680588','인디스페이스로고.jpg',now(),'운영시간 : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D005','INDEP','오오극장','053-425-3553','GSD','대구광역시 중구 국채보상로','537','37.461241','126.680588','default.png',now(),'운영시간 : 8:00~2:00','http://55cine.com');

-- roomTable 레코드 삽입

insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_1','C001',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_2','C001',2,100,'2D','moving/images/seat2.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C001_3','C001',3,150,'imax','moving/images/seat3.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C002_1','C002',1,150,'imax','moving/images/seat3.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C002_2','C002',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C002_3','C002',3,100,'2D','moving/images/seat2.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C003_1','C003',1,150,'imax','moving/images/seat3.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C003_2','C003',2,150,'imax','moving/images/seat3.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('C003_3','C003',3,150,'imax','moving/images/seat3.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L001_1','L001',1,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L001_2','L001',2,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L001_3','L001',3,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L002_1','L002',1,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L002_2','L002',2,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L002_3','L002',3,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L003_1','L003',1,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L003_2','L003',2,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L003_3','L003',3,100,'4D','moving/images/seat4.jpg','레드벨벳 신곡기념관');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M001_1','M001',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M001_2','M001',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M001_3','M001',3,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M002_1','M002',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M002_2','M002',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M002_3','M002',3,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M003_1','M003',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M003_2','M003',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('M003_3','M003',3,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D001_1','D001',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D001_2','D001',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D001_3','D001',3,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D002_1','D002',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D002_2','D002',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D002_3','D002',3,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D003_1','D003',1,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D003_2','D003',2,50,'2D, 3D','moving/images/seat1.jpg');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg)
values('D003_3','D003',3,50,'2D, 3D','moving/images/seat1.jpg');


-- reviewTable과 reviewStarTable 합쳐짐 _ 0911 승지
-- reviewStarTable 레코드 삽입
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C001','member1',5,3,1,2,3,3,3,5,now(),'좌석이 폭신폭신하고 넓어서 편안합니다','172.168.0.20',10);
insert into reviewStarTable(no,cineCode,uid,pixel,sound,service,seat,around,snack,trans,wdate,s_e,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'L001','member2',4,2,2,3,2,2,5,now(),'자리앞에 팝콘 떨어진게 아직도 있더라구요','152.168.0.18',2);

-- noticeTable 레코드 삽입
insert into  noticeTable(noticeno,title,s_e,uid,wdate,open)
values((SELECT ifnull(MAX(noticeno),0)+1 FROM noticeTable as notice),'사이트를 처음 이용하시는 분들',' ','admin1',now(),'Y');

-- QnATable 레코드 삽입
insert into  QnATable(qCode,qType,uid,title,content,wdate,ip,groupNo,groupNum,indent)
values((SELECT ifnull(MAX(qCode),0)+1 FROM QnATable as q),'q1','member1','예매어떻게 해요','예매하는 방법을 모르겠습니다. ㅠㅠ',now(),'172.168.0.20',0,0,0);

-- starTable
insert into starTable(sCode, mCode, uid, star, comment, wdate)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM starTable as star), '2', 'member1', '5', '내 인생에서 본 베스트 영화', now());

-- couponTable 레코드 삽입
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member1', '2018-08-10', '2019-08-10');

-- screenTable 레코드 삽입
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_1', '2018-10-04', '1030', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_1', '2018-10-04', '1045', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C001_1', '2018-10-04', '1130', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C002_1', '2018-10-07', '1230', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C002_1', '2018-10-07', '1430', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C002_2', '2018-10-07', '1540', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C002_2', '2018-10-07', '1350', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C003_1', '2018-10-10', '1630', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C003_2', '2018-10-11', '1730', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'C003_3', '2018-10-12', '1830', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_1', '2018-10-05', '1000', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_2', '2018-10-05', '1100', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_3', '2018-10-05', '1230', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L002_1', '2018-10-08', '0830', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L002_2', '2018-10-08', '0930', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L002_3', '2018-10-08', '1330', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_1', '2018-10-12', '1430', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_2', '2018-10-12', '1530', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_3', '2018-10-12', '1630', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_1', '2018-10-14', '1730', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_1', '2018-10-05', '1000', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_2', '2018-10-05', '1100', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L001_3', '2018-10-05', '1230', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L002_1', '2018-10-08', '0830', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L002_2', '2018-10-08', '0930', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L002_3', '2018-10-08', '1330', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_1', '2018-10-12', '1430', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_2', '2018-10-12', '1530', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_3', '2018-10-12', '1630', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'L003_1', '2018-10-14', '1730', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M001_1', '2018-10-20', '1030', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M001_2', '2018-10-20', '1100', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M001_3', '2018-10-20', '1230', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M002_1', '2018-10-17', '1030', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M002_2', '2018-10-17', '1100', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M002_3', '2018-10-17', '1230', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M003_1', '2018-10-11', '1030', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M003_2', '2018-10-11', '1200', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M003_3', '2018-10-11', '1330', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'M003_3', '2018-10-11', '1430', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D001_1', '2018-10-14', '1000', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D001_1', '2018-10-14', '1100', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D001_1', '2018-10-14', '1230', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D002_1', '2018-10-10', '0800', '1');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D002_1', '2018-10-11', '2300', '5');
insert into screenTable(sCode,roomCode,sdate,stime,mCode)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM screenTable as screen), 'D002_2', '2018-10-10', '1130', '1');

-- ticketTable 레코드 삽입
insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018080711330601',now(),'member1',1,'A1,A2,A3,A4','adu,you,sen,kid',1);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018080711330602',now(),'member2',2,'D10,D11','you,sen',8);