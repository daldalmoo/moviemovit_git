-- ------------------------- create table

-- userTable 생성
CREATE TABLE userTable (
	uid		  VARCHAR(20) 	NOT NULL PRIMARY KEY, -- 아이디
  upw		  VARCHAR(15)		NOT NULL, -- 비밀번호(특문 포함)
	uname	  VARCHAR(50) 	NOT NULL, -- 유저이름
	gender	CHAR(1)	      NOT NULL, -- 성별 
	birth	  VARCHAR(10)		NOT NULL, -- 생일
	email	  VARCHAR(100)	NOT NULL, -- 이메일
	phone	  VARCHAR(20)		NOT NULL, -- 전화번호
	zipcode VARCHAR(7)    NULL,     -- 우편번호, 101-101
	addr1	  VARCHAR(255)	NULL,	    -- 주소	1 
	addr2	  VARCHAR(255)	NULL,	    -- 주소	2(나머지주소)		
	grade	  VARCHAR(6)		DEFAULT 'SILVER' NOT NULL, -- 등급
	wdate	  DATETIME		  NOT NULL  -- 가입일
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- movieTable 생성
CREATE TABLE movieTable(
	mCode         INT           NOT NULL  PRIMARY KEY,
	poster        VARCHAR(255),
	mName         VARCHAR(100)  NOT NULL,
	genre	        VARCHAR(20)   NOT NULL,
	screen 	      VARCHAR(5)    NOT NULL,
	age		        INT		        NOT NULL,
	s_e		        VARCHAR(255)  NOT NULL,
	country       VARCHAR(20)   NOT NULL,
	director      VARCHAR(255)  NOT NULL,
	actor	        VARCHAR(255)  NOT NULL,
	DD		        VARCHAR(20)   NOT NULL,
	runningTime   INT		        NOT NULL,
	s_date	      VARCHAR(10) 	NOT NULL,
  e_date	      VARCHAR(10) 	NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- peopleTable 생성
CREATE TABLE peopleTable (
    peoCode    INT           NOT NULL PRIMARY KEY, -- 사람코드 
    peoName    VARCHAR(50)   NOT NULL, -- 사람이름
    country    VARCHAR(20)   NOT NULL, -- 국적
    peoBirth   CHAR(10)       NOT NULL,     -- 출생년도
    gender     CHAR(2)       NOT NULL, -- 성별
    peoPic     VARCHAR(255)  DEFAULT 'profile.png' NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- cinemaTable 생성
CREATE TABLE cinemaTable (
  cineCode   CHAR(4)       NOT NULL  PRIMARY KEY
 ,brandName  VARCHAR(10)   NOT NULL
 ,cineName   VARCHAR(50)   NOT NULL
 ,tel        VARCHAR(20)   NOT NULL
 ,addr1      CHAR(3)       NOT NULL
 ,addr2      VARCHAR(50)   
 ,addr3      VARCHAR(255)  
 ,wido       VARCHAR(20)   NOT NULL
 ,kyengdo    VARCHAR(20)   NOT NULL
 ,logoImg    VARCHAR(255)  NOT NULL
 ,wdate      DATETIME      NOT NULL
 ,etc        VARCHAR(255)  NOT NULL
 ,home       VARCHAR(100)  NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8;  -- 이클립스에서 한글 깨짐 처리

-- roomTable 생성
CREATE TABLE roomTable (
  roomCode  VARCHAR(20)   NOT NULL  PRIMARY KEY
 ,cineCode  CHAR(4)       NOT NULL
 ,roomName  INT           NOT NULL
 ,seatCnt   INT           NOT NULL
 ,DD        VARCHAR(30)   NOT NULL
 ,seatImg   VARCHAR(255)  NOT NULL
 ,etc       VARCHAR(255)
 ,FOREIGN KEY(cineCode) 
  REFERENCES cinemaTable(cineCode) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;  -- 이클립스에서 한글 깨짐 처리

-- reviewStarTable 생성
CREATE TABLE reviewStarTable(
  no        INT          NOT NULL  PRIMARY KEY
 ,cineCode  CHAR(4)      NOT NULL
 ,uid       VARCHAR(20)  NOT NULL
 ,pixel     INT          DEFAULT 0  NOT NULL
 ,sound     INT          DEFAULT 0  NOT NULL
 ,clean     INT          DEFAULT 0  NOT NULL
 ,service   INT          DEFAULT 0  NOT NULL
 ,seat      INT          DEFAULT 0  NOT NULL
 ,around    INT          DEFAULT 0  NOT NULL
 ,snack     INT          DEFAULT 0  NOT NULL
 ,trans     INT          DEFAULT 0  NOT NULL
 ,wdate     DATETIME     NOT NULL
 ,FOREIGN KEY(cineCode) 
  REFERENCES cinemaTable(cineCode) 
  ON DELETE CASCADE
 ,FOREIGN KEY(uid) 
  REFERENCES userTable(uid) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- reviewTable 생성
CREATE TABLE reviewTable(
  no        INT           NOT NULL  PRIMARY KEY
 ,cineCode  CHAR(4)       NOT NULL
 ,uid       VARCHAR(20)   NOT NULL
 ,s_e       VARCHAR(255)  NOT NULL
 ,wdate     DATETIME      NOT NULL
 ,ip        VARCHAR(20)   NOT NULL
 ,heart     INT           NOT NULL
 ,FOREIGN KEY(cineCode) 
  REFERENCES cinemaTable(cineCode) 
  ON DELETE CASCADE
 ,FOREIGN KEY(uid) 
  REFERENCES userTable(uid) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- noticeTable 생성
CREATE TABLE noticeTable(
  noticeno INT NOT NULL PRIMARY KEY,
  title    VARCHAR(100) NOT NULL,
  s_e      VARCHAR(255),
  uid      VARCHAR(20)  NOT NULL,
  wdate    DATETIME     NOT NULL,
  open     CHAR(1)      NOT NULL,
  FOREIGN KEY(uid) 
  REFERENCES userTable(uid) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- QnATable 생성
CREATE TABLE QnATable(
  qCode      INT NOT NULL PRIMARY KEY,
  qType      CHAR(2) NOT NULL,
  uid        VARCHAR(20) NOT NULL,
  title      VARCHAR(100) NOT NULL,
  content    VARCHAR(255) ,
  wdate      DATETIME NOT NULL,
  ip         VARCHAR(20) NOT NULL,
  groupNo    INT,               
  indent     INT,
  FOREIGN KEY(uid) 
  REFERENCES userTable(uid) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

--  starTable 생성
CREATE TABLE starTable(
	sCode 	 INT	       NOT NULL   PRIMARY KEY,
	mCode    INT  	     NOT NULL,
	uid	     VARCHAR(20) NOT NULL,
	star  	 INT		     NOT NULL,	
	comment  VARCHAR(100),
	wdate  	 DATETIME,
	FOREIGN KEY(mCode) 
  REFERENCES movieTable(mCode) 
	ON DELETE CASCADE,
	FOREIGN KEY(uid) 
  REFERENCES userTable(uid) 
	ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- couponTable 생성
CREATE TABLE couponTable(
	cCode	     INT    	   NOT NULL PRIMARY KEY,
	uid  	     VARCHAR(20) NOT NULL,
	startDate  VARCHAR(10) NOT NULL,
	expDate    VARCHAR(10) NOT NULL,
  FOREIGN KEY(uid)
  REFERENCES userTable(uid) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- screenTable 생성
CREATE TABLE screenTable (
  sCode		  INT	         NOT NULL PRIMARY KEY
 ,roomCode 	VARCHAR(20)	 NOT NULL
 ,sdate		  VARCHAR(10)	 NOT NULL
 ,stime		  VARCHAR(4)	 NOT NULL
 ,mCode		  INT	         NOT NULL
 ,FOREIGN KEY(roomCode)
  REFERENCES roomTable(roomCode) 
  ON DELETE CASCADE
 ,FOREIGN KEY(mCode)
  REFERENCES movieTable(mCode) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- bookTable 생성
CREATE TABLE bookTable (
  bCode		  VARCHAR(20)	NOT NULL PRIMARY KEY
 ,wdate 		DATETIME	  NOT NULL
 ,uid		    VARCHAR(20)	NOT NULL
 ,sCode		  INT        	NOT NULL
 ,cCode		  INT        	NOT NULL
 ,seat		  VARCHAR(30)	NOT NULL
 ,auditType	VARCHAR(30)	NOT NULL
 ,FOREIGN KEY(uid)
  REFERENCES userTable(uid) 
  ON DELETE CASCADE
 ,FOREIGN KEY(sCode)
  REFERENCES screenTable(sCode) 
  ON DELETE CASCADE
 ,FOREIGN KEY(cCode)
  REFERENCES couponTable(cCode) 
  ON DELETE CASCADE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;


