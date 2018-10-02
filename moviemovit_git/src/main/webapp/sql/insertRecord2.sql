-- ------------------------- insert record

show variables like 'c%'
ALTER DATABASE myjava DEFAULT CHARACTER SET utf8;
alter Database myjava collate = 'utf8_general_ci';


-- userTable 傾坪球 諮脊
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member1', 'me1234!', '奄井肯', 'W', '19940426', 'cheerup_km@naver.com', '01012345678',now(), 'ADMIN');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member2', 's1234!', '酔重駁', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SELLER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member3', 's1234!', '酔重駁', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member4', 's1234!', '酔重駁', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member5', 's1234!', '酔重駁', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'SILVER');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member6', 's1234!', '酔重駁', 'W', '19911020', 'sh@naver.com', '01012345678',now(), 'F');

INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member7', 's1234!', '酔重駁', 'W', '19911021', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member8', 's1234!', '酔重駁', 'W', '19911022', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member9', 's1234!', '酔重駁', 'W', '19911023', 'sh@naver.com', '01012345678',now(), 'SILVER');

INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member10', 's1234!', '酔重駁', 'W', '20011024', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member11', 's1234!', '酔重駁', 'W', '20011025', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member12', 's1234!', '酔重駁', 'W', '19751026', 'sh@naver.com', '01012345678',now(), 'SILVER');

INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member13', 's1234!', '酔重駁', 'W', '19751027', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member14', 's1234!', '酔重駁', 'W', '19751028', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member15', 's1234!', '酔重駁', 'W', '19751029', 'sh@naver.com', '01012345678',now(), 'SILVER');

INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member16', 's1234!', '酔重駁', 'W', '19811030', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member17', 's1234!', '酔重駁', 'W', '19811031', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member18', 's1234!', '酔重駁', 'W', '19811101', 'sh@naver.com', '01012345678',now(), 'SILVER');

INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member19', 's1234!', '酔重駁', 'W', '19811102', 'sh@naver.com', '01012345678',now(), 'VIP');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member20', 's1234!', '酔重駁', 'W', '19811103', 'sh@naver.com', '01012345678',now(), 'GOLD');
INSERT INTO userTable(uid,upw,uname,gender,birth,email,phone,wdate,grade)
VALUES('member21', 's1234!', '酔重駁', 'W', '19811104', 'sh@naver.com', '01012345678',now(), 'SILVER');

-- movieTable 傾坪球 諮脊
load data local infile 'D:/movie.csv'
into table movieTable
fields terminated by ','
lines TERMINATED BY '\n';

-- peopleTable 傾坪球 諮脊
load data local infile 'D:/people.csv'
into table peopleTable
fields terminated by ','
lines TERMINATED BY '\n';

-- cinemaTable 傾坪球 諮脊
-- 走慎 2018/08/31 呪舛 
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C001','CGV','勺督','1544-1122','SEO','辞随獣 勺督姥 中肯稽 66','亜窮督戚崎虞戚覗','37.477633','127.1249435','cWang.jpg',now(),'錘慎獣娃 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('L001','LOTTE','杉球展趨繊','1544-8855','SEO','辞随獣 勺督姥 臣顕波稽 300','茎汽杉球侯 5F','37.513689','127.1044541','lWord.jpg',now(),'錘慎獣娃 : 8:00~2:00','http://www.lottecinema.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M001','MEGABOX','勺督督滴馬搾神','1544-0070','SEO','辞随獣 勺督姥 勺督企稽 111','馬搾神祢牽走神','37.4776339','127.124934','mSongpa.jpg',now(),'錘慎獣娃 : 8:00~2:00','http://www.megabox.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C002','CGV','税舛採','1544-1122','GGD','井奄亀 税舛採獣 汝鉢稽 525','税舛採肯切蝕紫','37.7334609','127.6805888','default.png',now(),'錘慎獣娃 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('D001','INDEP','慎鉢因娃爽照','032-427-6777','ICH','昔探 耕蓄筈姥 耕蓄筈企稽','716','37.461241','126.680588','default.png',now(),'錘慎獣娃 : 8:00~2:00','http://www.indiespace.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('C003','CGV','据爽','1544-1122','GWD','悪据亀 据爽獣','辞据企 171','37.3448535','127.9308469','default.png',now(),'錘慎獣娃 : 8:00~2:00','http://www.cgv.co.kr');
insert into cinemaTable(cineCode,brandName,cineName,tel,addr1,addr2,addr3,wido,kyengdo,logoImg,wdate,etc,home)
values('M002','MEGABOX','薦爽','1544-0070','JJD','薦爽亀 薦爽獣 掻肖稽14掩','18','33.5116003','126.5226707','default.png',now(),'錘慎獣娃 : 8:00~2:00','http://www.megabox.co.kr');

load data local infile 'D:/cinema.csv'
into table cinemaTable
fields terminated by ','
lines TERMINATED BY '\n';

-- roomTable 傾坪球 諮脊
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_1','C001',1,187,'2D');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_2','C001',2,183,'2D');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_3','C001',3,310,'2D');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_4','C001',4,235,'2D');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_5','C001',5,153,'2D');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_6','C001',6,78,'2D');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_7','C001',7,72,'4DX');
insert into roomTable(roomCode,cineCode,roomName,seatCnt,DD)
values('C001_8','C001',8,263,'2D');


-- reviewTable引 reviewStarTable 杯団像 _ 0911 渋走
-- reviewStarTable 傾坪球 諮脊
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'L001','member1',5,3,1,2,3,3,3,5,now(),'疎汐戚 賑重賑重馬壱 覚嬢辞 畷照杯艦陥','172.168.0.20');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'L001','member3',4,2,2,3,2,2,5,now(),'切軒蒋拭','152.168.0.18');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'L001','member4',5,5,5,5,5,5,5,3,now(),'覚壱 凹拐馬壱 格巷格巷 疏紹嬢推!!!','152.168.0.19');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C001','member5',1,3,1,4,4,1,5,2,now(),'橡嬬戚 JMT~','172.168.0.25');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C001','member7',3,5,5,3,5,3,3,5,now(),'仙号庚税紫 赤製~製狽,短衣 角蟹 疏製','152.168.0.53');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C001','member8',2,2,5,5,1,4,3,2,now(),'益撹 益係陥.短衣引辞搾什澗 疏生蟹 陥献闇 紺稽','152.168.0.21');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'M026','member9',1,3,1,4,4,1,5,2,now(),'疎汐戚 賑重賑重馬壱 覚嬢辞 畷照杯艦陥','172.168.0.1');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'M026','member10',3,5,5,5,5,3,4,2,now(),'切軒蒋拭 橡嬬 恭嬢遭惟 焼送亀 赤希虞姥推','152.168.0.2');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'M026','member11',2,3,5,3,3,3,3,3,now(),'覚壱 凹拐馬壱 格巷格巷 疏紹嬢推!!!','152.168.0.3');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'M026','member9',1,2,1,4,4,1,5,5,now(),'食奄 橡嬬 股生形壱 推 慎鉢淫 人?Dせせせせせせ','172.168.4.1');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'M026','member10',4,4,5,4,5,3,1,2,now(),'疏製ぞ','152.168.4.2');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'M026','member11',3,5,2,3,4,5,3,4,now(),'汽戚闘馬君 曽曽 亜澗汽 蟹孜走 省製','152.168.4.3');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C006','member12',1,1,1,1,1,1,1,1,now(),'舌貝馬蟹, 是持岨 重井床室推 穿端旋生稽 紺稽;;;;;','172.168.4.1');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C006','member13',5,3,2,4,5,3,4,5,now(),'短衣亀 焼習錘暗 皐壱澗 疏陥','152.168.41.2');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'C006','member14',4,4,3,4,5,5,1,4,now(),'鎧析 暁 人醤走 勧刊貝劃','152.168.22.3');

insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'D022','member12',5,5,5,5,4,1,4,1,now(),'羨悦失 皐檎 且君亜奄 疏精 員 昔汽 羨悦失戚 焼襲革食','172.168.4.1');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'D022','member13',5,5,4,4,5,2,4,5,now(),'爽痕拭 阻陥 酵弘淫 ~~','152.168.12.2');
insert into reviewStarTable(no,cineCode,uid,pixel,sound,clean,service,seat,around,snack,trans,wdate,s_e,ip)
values((SELECT IFNULL(MAX(no),0)+1 FROM reviewStarTable as rst),'D022','member14',5,5,3,4,5,5,5,4,now(),'託展壱 榎号人辞 疏製','152.168.4.31');

-- noticeTable 傾坪球 諮脊
insert into  noticeTable(noticeno,title,s_e,uid,wdate,open)
values((SELECT ifnull(MAX(noticeno),0)+1 FROM noticeTable as notice),'紫戚闘研 坦製 戚遂馬獣澗 歳級',' ','admin1',now(),'Y');

-- QnATable 傾坪球 諮脊
insert into  QnATable(qCode,qType,uid,title,content,wdate,ip,groupNo,groupNum,indent)
values((SELECT ifnull(MAX(qCode),0)+1 FROM QnATable as q),'q1','member1','森古嬢胸惟 背推','森古馬澗 号狛聖 乞牽畏柔艦陥. ばば',now(),'172.168.0.20',0,0,0);

-- starTable
insert into starTable(sCode, mCode, uid, star, comment, wdate)
values((SELECT IFNULL(MAX(sCode),0)+1 FROM starTable as star), '2', 'member1', '5', '鎧 昔持拭辞 沙 今什闘 慎鉢', now());

-- couponTable 傾坪球 諮脊
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member1', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member2', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member3', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member3', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member4', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member4', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member5', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member5', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member7', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member7', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member8', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member8', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member9', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member9', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member10', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member10', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member10', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member11', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member11', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member12', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member12', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member12', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member12', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member12', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member13', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member13', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member14', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member14', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member15', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member15', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member16', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member16', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member17', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member17', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member17', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member17', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)

values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member18', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member18', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member19', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member19', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member20', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member20', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member20', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member20', '2018-08-10', '2019-08-10');

insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member21', '2018-08-10', '2019-08-10');
insert into couponTable(cCode,uid,startDate,expDate)
values((SELECT IFNULL(MAX(cCode),0)+1 FROM couponTable as coupon), 'member21', '2018-08-10', '2019-08-10');

-- screenTable 傾坪球 諮脊
load data local infile 'D:/screen.csv'
into table screenTable
fields terminated by ','
lines TERMINATED BY '\n';

-- ticketTable 傾坪球 諮脊
-- ticketTable 傾坪球 諮脊 (鰍杉析獣歳段+森古授辞)
insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092810201001',now(),'member3',3,'C1,C2,C3,C4','adu,you,sen,kid',3);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092810201002',now(),'member4',4,'D2','sen',5);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092810201003',now(),'member5',5,'E8','kid',7);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092810201004',now(),'member7',6,'F10,F11,F12','adu,you,sen',9);
--

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302001',now(),'member8',7,'F13','you',11);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302002',now(),'member9',8,'G16','kid',13);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302003',now(),'member10',8,'G16,G17,G18','you,sen,kid',15);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302004',now(),'member11',9,'G1,G2','adu,sen',18);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302005',now(),'member12',9,'H1,H2,H3,H4','adu,you,sen,kid',20);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302006',now(),'member13',12,'H9','adu',25);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302007',now(),'member14',12,'I1,I2','you,sen',27);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092911302008',now(),'member15',12,'I8,I9','sen,kid',29);
--
insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018093012401501',now(),'member16',4,'I12,I13,I14','adu,you,sen',31);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018093012401502',now(),'member17',4,'I3','kid',33);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018093012401503',now(),'member18',2,'I10','you',37);
--

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('20108100113502501',now(),'member19',2,'J6,J7,J8','adu,sen,kid',39);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('20108100113502502',now(),'member20',2,'J11,J12,J13','adu,you,sen',41);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('20108100113502503',now(),'member20',2,'J14','you',42);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('20108100113502504',now(),'member12',2,'J16','sen',21);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('20108100113502505',now(),'member17',2,'K2,K3','you,sen',34);
--
insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103001',now(),'member21',2,'K7,K8,K9,K10','adu,you,sen,kid',45);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103002',now(),'member10',1,'L14,L15,L16','adu,you,sen',16);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103003',now(),'member12',2,'L1','sen',22);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103004',now(),'member3',3,'L2,L3','you,sen',4);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103005',now(),'member4',4,'L7,L8','adu,sen',6);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103006',now(),'member5',5,'A6','sen',8);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103007',now(),'member7',6,'A10,A11','adu,sen',10);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103008',now(),'member8',7,'A14,A15','sen,kid',12);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103009',now(),'member9',8,'B4','kid',14);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103010',now(),'member10',8,'C16','adu',17);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103011',now(),'member11',9,'C5,C6,C7','you,sen,kid',19);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092714103012',now(),'member12',9,'C8,C9','adu,sen',23);
--
insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293530',now(),'member13',12,'D13,D14','you,sen',26);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293531',now(),'member14',12,'D15,D16','adu,kid',28);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293532',now(),'member15',12,'D10,D11','you,sen',30);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293533',now(),'member16',4,'E7','you',32);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293534',now(),'member17',4,'E8','sen',36);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293535',now(),'member18',2,'F4,F5,F6','adu,you,sen',38);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293536',now(),'member19',2,'F8,F9,F10,F11','adu,you,sen,kid',40);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293537',now(),'member20',2,'F15','kid',43);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293538',now(),'member20',2,'F16','you',44);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293539',now(),'member12',2,'G4,G5,G6','adu,sen,kid',24);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293540',now(),'member17',2,'G8,G9,G11','you,sen,kid',36);

insert into ticketTable(tCode,wdate,uid,sCode,seat,auditType,cCode)
values('2018092615293541',now(),'member21',2,'H16','adu',46);
