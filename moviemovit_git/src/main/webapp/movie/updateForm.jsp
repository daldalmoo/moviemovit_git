<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>
<!-- <style rel="stylesheet">
.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;        
}
img {        /* 영화 포스터 */
  height: 200px;
  width: 200px;
}
.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 50em);
  margin: 1em auto;
  overflow: hidden;
  width: 100%;
}
table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
 table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: center;
} 
table th {
  background-color: #bfe1ff;
  font-weight: 300;
  text-align: center;
  font-weight: bold;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #bfe1ff;
}



/*공개,수정,삭제 스타일*/
.cbp-mc-button {
  background: #40bf80;
  border: none;
  color: #fff;
  width: auto;
  cursor: pointer;
  text-transform: uppercase;
  display: inline-block;
  padding: 5px 5px;
  font-size: 0.8em;  
  border-radius: 2px;
  letter-spacing: 1px;
}
.cbp-mc-button:hover {
  background: #2b8256;
}



@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }
  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  
  /* 사이즈 줄일때 나타나는 아이*/
  td:nth-child(2):before {
    content: '브랜드:';
  }
  td:nth-child(3):before {
    content: '지점:';
  }
  td:nth-child(4):before {
    content: '별점:';
  }
  td:nth-child(5):before {
    content: '주소:';
  }
  td:nth-child(6):before {
    content: '문의전화:';
  }
  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }
  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }
  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }
  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }
  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}

</style> -->
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">
<style>
/*180827 경민 list 클래스 추가*/
.list {
	text-align:left;
	padding:10px;
	margin:auto;
}

.img2 {
    width:200px;
    heigth:200px;
}
.home-section{
padding-top:0px;}
</style>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
<%-- 본문시작 updateForm.jsp --%>
<div class="home-section text-center ">
<div class="table-users">
   <div class="header">Movie Update</div>
   <form class="cbp-mc-form" name='regForm' method='POST' action='./update.do' enctype="multipart/form-data" onsubmit="return confirm('수정하시겠습니까?')">
   <input type="hidden" name="mCode" value="${dto.mCode }">
   <table class="cbp-mc-column" style="text-align:center; margin:center;">
      <tr>
        <th>영화명</th>
        <td class="list"><input type="text" name="mName" value="${dto.mName }" required></td>
      </tr>
      <tr>
        <th>포스터</th>
        <td class="list">
        <img class="img2" src="./storage/${dto.poster }">
        </td>
      </tr>
      <tr>
        <th></th>
        <td class="list">
        <input type="file" class="cbp-mc-button" id="posterMF" name="posterMF" required>
        </td>
      </tr>
      <tr>
        <th>장르</th>
        <td class="list">
			<select id="genre" name="genre" required>
              <option value="romance" <c:if test="${dto.genre eq 'romance' }"> selected </c:if> >로맨스</option>
              <option value="crime" <c:if test="${dto.genre eq 'crime' }"> selected </c:if> >범죄/느와르</option>
              <option value="comedy" <c:if test="${dto.genre eq 'comedy' }"> selected </c:if> >코미디</option>
              <option value="FanSF" <c:if test="${dto.genre eq 'FanSF' }"> selected </c:if> >판타지/SF</option>
              <option value="action" <c:if test="${dto.genre eq 'action' }"> selected </c:if> >액션</option>
              <option value="thrillhorror" <c:if test="${dto.genre eq 'thrillhorror' }"> selected </c:if> >스릴러/공포</option>
              <option value="drama" <c:if test="${dto.genre eq 'drama' }"> selected </c:if> >드라마</option>
              <option value="docu" <c:if test="${dto.genre eq 'docu' }"> selected </c:if> >다큐</option>
              <option value="ani" <c:if test="${dto.genre eq 'ani' }"> selected </c:if> >애니메이션</option>
              <option value="etc" <c:if test="${dto.genre eq 'etc' }"> selected </c:if> >기타</option>
            </select>
		</td>
      </tr>
      <tr>
        <th>상영분류</th>
        <td class="list">
	      <select id="screen" name="screen" required>
            <option value="soon" <c:if test="${dto.screen eq 'soon' }"> selected </c:if> >상영예정</option>
            <option value="ing" <c:if test="${dto.screen eq 'ing' }"> selected </c:if> >상영중</option>
            <option value="end" <c:if test="${dto.screen eq 'end' }"> selected </c:if> >상영종료</option>
          </select>
      </tr>
      <tr>
        <th>관람등급</th>
        <td class="list">
			<select id="age" name="age" required>
              <option value="0" <c:if test="${dto.age eq '0' }"> selected </c:if> >전체 관람가</option>
              <option value="12" <c:if test="${dto.age eq '12' }"> selected </c:if> >12세</option>
              <option value="15" <c:if test="${dto.age eq '15' }"> selected </c:if> >15세</option>
              <option value="19" <c:if test="${dto.age eq '19' }"> selected </c:if> >청소년 관람불가</option>
            </select>
		</td>
      </tr>
      <tr>
        <th>줄거리</th>
        <td class="list">
          <textarea id="s_e" name="s_e">${dto.s_e }</textarea>
        </td>
      </tr>
      <tr>
		<th>*나라</th>
		<td>
			<select id="country" name="country"  value="${dto.country }" required>
            <option value="가나">가나</option>
            <option value="가봉">가봉</option>
            <option value="가이아나">가이아나</option>
            <option value="감비아">감비아</option>
            <option value="과테말라">과테말라</option>
            <option value="그레나다">그레나다</option>
            <option value="그루지야">그루지야</option>
            <option value="기니">기니</option>
            <option value="나미비아">나미비아</option>
            <option value="나이지리아">나이지리아</option> 
            <option value="남아프리카공화국">남아프리카공화국</option> 
            <option value="네팔">네팔</option>
            <option value="노르웨이">노르웨이</option>
            <option value="뉴질랜드">뉴질랜드</option>
            <option value="니제르">니제르</option>
            <option value="니카라과">니카라과</option>
            <option selected value="대한민국">대한민국</option>
            <option value="덴마크">덴마크</option>
            <option value="도미니카연방">도미니카연방</option>
            <option value="도미니카공화국">도미니카공화국</option> 
            <option value="독일">독일</option>
            <option value="라오스">라오스</option>
            <option value="라트비아">라트비아</option>
            <option value="러시아">러시아</option>
            <option value="레바논">레바논</option>
            <option value="레소토">레소토</option>
            <option value="루마니아">루마니아</option>
            <option value="르완다">르완다</option>
            <option value="룩셈부르크">룩셈부르크</option>
            <option value="라이베리아">라이베리아</option>
            <option value="리비아">리비아</option>
            <option value="리투아니아">리투아니아</option>
            <option value="리첸쉬테인">리첸쉬테인</option>
            <option value="마다가스카르">마다가스카르</option>
            <option value="마케도니아">마케도니아</option>
            <option value="말라위">말라위</option>
            <option value="말레이지아">말레이지아</option> 
            <option value="말리">말리</option>
            <option value="몰타">몰타</option>
            <option value="멕시코">멕시코</option>
            <option value="모로코">모로코</option>
            <option value="모리셔스">모리셔스</option>
            <option value="모리타니">모리타니</option>
            <option value="모잠비크">모잠비크</option>
            <option value="몰도바">몰도바</option>
            <option value="몰디브">몰디브</option>
            <option value="몽고">몽고</option>
            <option value="미국">미국</option>
            <option value="미얀마">미얀마</option>
            <option value="바누아투">바누아투</option>
            <option value="바레인">바레인</option>
            <option value="바베이도스">바베이도스</option> 
            <option value="바하마">바하마</option>
            <option value="방글라데시">방글라데시</option> 
            <option value="벨라루스">벨라루스</option>
            <option value="베네수엘라">베네수엘라</option> 
            <option value="베넹">베넹</option>
            <option value="베트남">베트남</option>
            <option value="벨기에">벨기에</option>
            <option value="보스니아헤르체코비나">보스니아헤르체코비나</option>
            <option value="보츠와나">보츠와나</option>
            <option value="볼리비아">볼리비아</option>
            <option value="부르키나파소">부르키나파소</option>
            <option value="부탄">부탄</option>
            <option value="불가리아">불가리아</option>
            <option value="브라질">브라질</option>
            <option value="브룬디">브룬디</option>
            <option value="사우디아라비아">사우디아라비아</option>
            <option value="사이프러스">사이프러스</option>
            <option value="산마리노">산마리노</option>
            <option value="세네갈">세네갈</option>
            <option value="세이셸">세이셸</option>
            <option value="세인트루시아">세인트루시아</option>
            <option value="세인트빈센트그레나딘">세인트빈센트그레나딘 </option>
            <option value="세인트키츠네비스">세인트키츠네비스</option>
            <option value="솔로몬아일란드">솔로몬아일란드 </option>
            <option value="수리남">수리남</option>
            <option value="스리랑카">스리랑카</option>
            <option value="스와질랜드">스와질랜드</option>
            <option value="스웨덴">스웨덴</option>
            <option value="스페인">스페인</option>
            <option value="스위스">스위스</option>
            <option value="슬로바키아">슬로바키아</option>
            <option value="슬로베니아">슬로베니아</option>
            <option value="시에라리온">시에라리온 </option>
            <option value="싱가포르">싱가포르</option>
            <option value="아랍에미레이트연합국">아랍에미레이트연합국</option>
            <option value="아르메니아">아르메니아</option>
            <option value="아르헨티나">아르헨티나</option>
            <option value="아이슬란드">아이슬란드</option>
            <option value="아이티">아이티</option>
            <option value="아프가니스탄">아프가니스탄</option>
            <option value="안도라">안도라</option>
            <option value="앤티과바부다">앤티과바부다</option>
            <option value="알바니아">알바니아</option>
            <option value="알제리">알제리</option>
            <option value="앙골라">앙골라</option>
            <option value="에스토니아">에스토니아</option>
            <option value="에콰도르">에콰도르</option>
            <option value="엘살바도르">엘살바도르</option>
            <option value="영국">영국</option>
            <option value="예멘">예멘</option>
            <option value="오만">오만</option>
            <option value="오스트리아">오스트리아</option>
            <option value="온두라스">온두라스</option>
            <option value="요르단">요르단</option>
            <option value="우간다">우간다</option>
            <option value="우루과이">우루과이</option>
            <option value="우즈베크">우즈베크</option>
            <option value="우크라이나">우크라이나</option>
            <option value="이디오피아">이디오피아</option>
            <option value="이라크">이라크</option>
            <option value="이란">이란</option>
            <option value="이스라엘">이스라엘</option>
            <option value="이탈리아">이탈리아</option>
            <option value="이집트">이집트</option>
            <option value="인도네시아">인도네시아</option>
            <option value="일본">일본</option>
            <option value="자메이카">자메이카</option>
            <option value="잠비아">잠비아</option>
            <option value="중국">중국</option>
            <option value="중앙아프리카">중앙아프리카</option>
            <option value="지부티">지부티</option>
            <option value="짐바브웨">짐바브웨</option>
            <option value="차드">차드</option>
            <option value="체코">체코</option>
            <option value="체코슬로바키아">체코슬로바키아</option>
            <option value="칠레">칠레</option>
            <option value="카나다">카나다</option>
            <option value="카메룬">카메룬</option>
            <option value="카보베르데">카보베르데</option>
            <option value="카자흐">카자흐</option>
            <option value="카타르">카타르</option>
            <option value="캄보디아">캄보디아</option>
            <option value="케냐">케냐</option>
            <option value="코스타리카">코스타리카</option>
            <option value="코트디봐르">코트디봐르</option>
            <option value="콜롬비아">콜롬비아</option>
            <option value="콩고">콩고</option>
            <option value="쿠바">쿠바</option>
            <option value="쿠웨이트">쿠웨이트</option>
            <option value="크로아티아">크로아티아</option>
            <option value="키르키즈스탄">키르키즈스탄</option>
            <option value="키리바티">키리바티</option>
            <option value="타지키스탄">타지키스탄</option>
            <option value="탄자니아">탄자니아</option>
            <option value="터키">터키</option>
            <option value="토고">토고</option>
            <option value="통가">통가</option>
            <option value="튀니지">튀니지</option>
            <option value="트리니다드토바고">트리니다드토바고</option>
            <option value="파나마">파나마</option>
            <option value="파라과이">파라과이</option>
            <option value="파키스탄">파키스탄</option>
            <option value="파푸아뉴기니">파푸아뉴기니</option>
            <option value="페루">페루</option>
            <option value="포르투갈">포르투갈</option>
            <option value="폴란드">폴란드</option>
            <option value="프랑스">프랑스</option>
            <option value="피지">피지</option>
            <option value="필란드">필란드</option>
            <option value="필리핀">필리핀</option>
            <option value="헝가리">헝가리</option>
		  </select>
		</td>
	</tr>
	<tr>
		<th>*감독</th>
		<td class="list">
	      <input type="text" name="director" id="keyWord" value="${dto.director }" required><br>
		    <div id="peoName"></div>	
	    </td>
	</tr>
	<tr>
		<th>*주연배우</th>
		<td class="list">
	      <input type="text" name="actor" id="keyWord2" value="${dto.actor }" required><br>
		    <div id="peoName2"></div>
		</td>
	</tr>
      <tr>
        <th>영화타입</th>
        <td class="list">
	      <select id="DD" name="DD" required>
            <option <c:if test="${dto.DD eq '2D' }"> selected </c:if> >2D</option>
            <option <c:if test="${dto.DD eq '3D' }"> selected </c:if> >3D</option>
            <option <c:if test="${dto.DD eq '4D' }"> selected </c:if> >4D</option>
            <option <c:if test="${dto.DD eq 'IMAX' }"> selected </c:if> >IMAX</option>
          </select>
		</td>
      </tr>
      <tr>
        <th>상영시간</th>
        <td class="list">
	  		<input type="text" id="runningTime" name="runningTime" value="${dto.runningTime }" required>
	  	</td>
      </tr>
      <tr>
        <th>개봉일</th>
        <td class="list">
	  		<input type="date" id="s_date" name="s_date" value="${dto.s_date }" required>
	  	</td>
      </tr>
      <tr>
        <th>마감일</th>
        <td class="list">
	  		<input type="date" id="e_date" name="e_date" value="${dto.e_date }" required>
	  	</td>
      </tr>
           
   </table>
   
   <!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
	  <input class="cbp-mc-button" type='button' value="뒤로가기" onclick='javascript:history.back()'>	 
	  <input class="cbp-mc-button" type="reset" value="다시입력" />
	  <input class="cbp-mc-button" type="submit" value="수정"/>
	</div>
	</form>
</div>
</div>
</body>