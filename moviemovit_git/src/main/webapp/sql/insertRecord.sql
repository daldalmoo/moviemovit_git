-- ------------------------- insert record
-- userTable ���ڵ� ����
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member1', 'me1234!', '����', 'W', '19940426', 'cheerup_km@naver.com', '01012345678',now(), 'ADMIN');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member2', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SELLER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member3', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member4', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member5', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SILVER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member6', 's1234!', '�����', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'F');

-- movieTable ���ڵ� ����
INSERT INTO movieTable(mCode, poster, mName, genre, screen, age, s_e, country, director, actor, DD, runningTime, s_date, e_date)
VALUES ((SELECT ifnull(MAX(mCode),0)+1 FROM movieTable as movie), 'moving/images/poster02.jpg', '�Ű��Բ�', 'comedy', 'ing', '0', '���¿� ���� ��ȭ', 'Korea', '7,8', '1,2,3', '3D', '140', '2018-06-15', '2018-06-30');

-- peopleTable ���ڵ� ����
insert into peopleTable(peoCode, peoName, country, peoBirth, gender, peoPic)
values((SELECT IFNULL(MAX(peocode),0)+1 FROM peopleTable as peo),'������','korea','1988', 'M', 'moving/images/peo0001.jpg'); 

-- cinemaTable ���ڵ� ����
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C001','CGV','����','1544-1122','SEO','����� ���ı� ��η� 66','�������̺������','37.477633','127.1249435','cWang.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C002','CGV','������','1544-1122','GGD','��⵵ �����ν� ��ȭ�� 525','�����ι��ڿ���','37.7334609','127.6805888','default.png',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C003','CGV','����','1544-1122','GWD','������ ���ֽ�','������ 171','37.3448535','127.9308469','default.png',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C004','CGV','����','1544-1122','SEO','����� ������ ������','120','56.123482','65.1249435','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C005','CGV','����','1544-1122','GGD','��⵵ ������ ��â��', '10','15.24536','41.124135','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C006','CGV','����','1544-1122','GGD','��⵵ ������ ����߷�','54','123.234234','212.234241','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C007','CGV','����','1544-1122','CCD','���������� �߱� ��ȭ��','1-16','55.234235','12.234237','cgv���빮.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C008','CGV','����','1544-1122','KSD','�λ걤���� ���� ����3��','�����÷��̽�6��','124.23434','141.846512','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C009','CGV','���ֳ���','1544-1122','JJD','���ֵ� ���ֽ� ������ 407','����Ÿ��','42.346','34.567','cgv��.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C010','CGV','����','1544-1122','SEO','����� ���ϱ� ������','168-12','12.23466','23.87697','cgv�б���.jpg',now(),'��ð� : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L001','LOTTE','����Ÿ����','1544-8855','SEO','����� ���ı� �ø��ȷ� 300','�Ե������ 5F','37.513689','127.1044541','lWord.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L002','LOTTE','�Ǵ��Ա�','1544-8855','SEO','����� ������ �ھ絿','227-7','636.32452','34.13451','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L003','LOTTE','�����ƿ﷿','1544-8855','GGD','��⵵ ������ �������� 136����','47','�Ե��ƿ﷿ 6��','41.153513','15.235235','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L004','LOTTE','����','1544-8855','SEO','����� ������ ������','44-1','34.114423','43.346257','cgv���빮.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L005','LOTTE','����','1544-8855','GGD','��⵵ ������ �߿��� ������','���ھƾƿ﷿ 9F','86.247345','23.346235','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L006','LOTTE','����','1544-8855','GGD','��⵵ ������ �Ǽ��� ���е�','296-3','�Ե��� �Ե��ó׸�','35.3567','46.456856','cgv��.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L007','LOTTE','����','1544-8855','CCD','�泲 ����� ������','193-1','57.97456','34.45733','cgv�б���.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L008','LOTTE','����(��ȭ��)','1544-8855','JLD','���� ���ֽ� �ϻ걸 ���ŵ�','971','86.567345','76.35685','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L009','LOTTE','����','1544-8855','GSD','��� ���׽� �ϱ� ��ӻ󰡱�','16','96.2456','17.24577','cgv��.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L010','LOTTE','���(��ȭ��)','1544-8855','GSD','��� ���� ��굿','1480-1','67.53683','85.356856','cgv���.jpg',now(),'��ð� : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M001','MEGABOX','������ũ�Ϻ��','1544-0070','SEO','����� ���ı� ���Ĵ�� 111','�Ϻ��Ǫ������','37.4776339','127.124934','mSongpa.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M002','MEGABOX','����','1544-0070','JJD','���ֵ� ���ֽ� �߾ӷ�14��','18','33.5116003','126.5226707','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M003','MEGABOX','����','1544-0070','SEO','���� ���ʱ� ���ʴ�� 77�� 3','�Ƹ�Ÿ�� 8��','51.548003','546.5226707','cgv���빮.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M004','MEGABOX','��Ͽ����Ű����','1544-0070','SEO','���� ������ �����ŷ� 240','1','513.65103','213.05055','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M005','MEGABOX','�д�','1544-0070','GGD','��⵵ ������ �д籸 Ȳ�����','332','32.56546','25.36357','cgv��.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M006','MEGABOX','��õ','1544-0070','ICH','��õ ������ ������ �۵� ���з� 16����','Ʈ���� ��Ʈ��Ʈ D�� 2��','56.85674','55.783733','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M007','MEGABOX','����','1544-0070','GWD','������ ���ֽ� ������� 165-3','��Ʈ�����̽����� 6��','25.3298','55.522787','cgv���.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M008','MEGABOX','�λ��','1544-0070','GSD','�λ걤���� ������ ������ 12���� 55','��ǻŸ���Ϸ��� 4��','23.6594','12.34662','cgv����.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M009','MEGABOX','����','1544-0070','JLD','���󳲵� ������ �ֺ���','208','68.48465','75.565156','cgv�б���.jpg',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M010','MEGABOX','���빮','1544-0070','SEO','����� �߱� ����ܷ� 247','�¸�׽�Ƽ 9��','46.454582','346.347347','default.png',now(),'��ð� : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D001','INDEP','��ȭ�����־�','032-427-6777','ICH','��õ ����Ȧ�� ����Ȧ���','716','37.461241','126.680588','default.png',now(),'��ð� : 8:00~2:00','http://www.cinespacejuan.com');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D002','INDEP','�̴Ͻó׸�','070-7612-7366','GGD','��� ���� ���籸','716','37.461241','126.680588','default.png',now(),'��ð� : 8:00~2:00','http://www.minicinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D003','INDEP','�ʸ�����','02-363-2537','SEO','����Ư���� ���빮�� �����','527','37.461241','126.680588','�ʸ������ΰ�.jpg',now(),'��ð� : 8:00~2:00','http://www.filmforum.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D004','INDEP','�ε����̽�','02-738-0366','SEO','����Ư���� ���α� ��ȭ����','13','37.461241','126.680588','�ε����̽��ΰ�.jpg',now(),'��ð� : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D005','INDEP','��������','053-425-3553','GSD','�뱸������ �߱� ��ä�����','537','37.461241','126.680588','default.png',now(),'��ð� : 8:00~2:00','http://55cine.com');

-- roomTable ���ڵ� ����

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
values('L001_1','L001',1,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L001_2','L001',2,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L001_3','L001',3,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L002_1','L002',1,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L002_2','L002',2,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L002_3','L002',3,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L003_1','L003',1,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L003_2','L003',2,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD,seatImg,etc)
values('L003_3','L003',3,100,'4D','moving/images/seat4.jpg','���座�� �Ű����');
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


-- reviewTable�� reviewStarTable ������ _ 0911 ����
-- reviewStarTable ���ڵ� ����
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C001','member1',5,3,1,2,3,3,3,5,now(),'�¼��� ���������ϰ� �о ����մϴ�','172.168.0.20',10);
insert into reviewStarTable(no,cineCode,uid,pixel,sound,service,seat,around,snack,trans,wdate,s_e,ip,heart)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'L001','member2',4,2,2,3,2,2,5,now(),'�ڸ��տ� ���� �������� ������ �ִ��󱸿�','152.168.0.18',2);

-- noticeTable ���ڵ� ����
insert into  noticeTable(noticeno,title,s_e,uid,wdate,open)
values((SELECT ifnull(MAX(noticeno),0)+1 FROM noticeTable as notice),'����Ʈ�� ó�� �̿��Ͻô� �е�',' ','admin1',now(),'Y');

-- QnATable ���ڵ� ����
insert into  QnATable(qCode,qType,uid,title,content,wdate,ip,groupNo,groupNum,indent)
values((SELECT ifnull(MAX(qCode),0)+1 FROM QnATable as q),'q1','member1','���ž�� �ؿ�','�����ϴ� ����� �𸣰ڽ��ϴ�. �Ф�',now(),'172.168.0.20',0,0,0);

-- starTable
insert into starTable(sCode, mCode, uid, star, comment, wdate)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM starTable as star), '2', 'member1', '5', '�� �λ����� �� ����Ʈ ��ȭ', now());

-- couponTable ���ڵ� ����
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member1', '2018-08-10', '2019-08-10');

-- screenTable ���ڵ� ����
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

-- ticketTable ���ڵ� ����
insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018080711330601',now(),'member1',1,'A1,A2,A3,A4','adu,you,sen,kid',1);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018080711330602',now(),'member2',2,'D10,D11','you,sen',8);