<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- 통째로 갈아없을꺼임!!!!!!! -->

<head>

<!-- <!-- <link href="../css/ticketForm_content.css" rel="stylesheet" type="text/css"> -->
<!-- <link rel="stylesheet" href="../css/normalize.css">
<link rel="stylesheet" href="../css/calstyle.css">
<link rel="stylesheet" href="../css/calstyle2.css" /> -->
<link rel="stylesheet" href="../css/mvcalstyle.css" />
</head>

<!-- ------------------------------ 소스 복붙 ---------------------------------- -->
<style>
/*********** 예매 view 페이지 css ***********/
/********* 티켓예매 테이블 형태로 *********************/
#ticketArea {
   border-collapse:collapse;
   border: 1px solid #000;
   width:90%;
   height:700px;
   margin:auto;
}
/*상단 타이틀*/
#ticketArea th{
  vertical-align:text-top;
  text-align:center;
  background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%);
  font-size: 12pt;
  font-weight: bold;
  color: white;
  height:3%;
  width:25%;
}

/*********** 1) 영화선택 ***********/
#ticketArea .1st_area{
  vertical-align: text-top;
  width:25%;
}

#movie_list { /*ul*/
    list-style: none;
	height: 400px;
	padding: 7px 0 0 9px;
	color: black;
	vertical-align: top;
	white-space: nowrap;
	margin-top: -8px;
    text-align: left;
    overflow-x: hidden;
    overflow-y: scroll;
}

#movie_list li {
    padding:0 0 5px 15px;
}

/*********** 2) 극장선택 ***********/
.refreshbtn { /* 새로고침 버튼 */
  position: relative;
  top: 12px;
  transform: translateY(-50%);
}

.searchbtn { /* 검색 버튼 */
  position: relative;
  top: 13.5px;
  transform: translateY(-50%);
}

#txtTheater { /* 극장 검색 */
  color: #000;
}

.cinema_select .tab_menu { /* 극장종류 리스트 */
  background: linear-gradient(to top, #e4e4e8 0%, #f3f3f4 100%);
  list-style: none;
  font-weight: bold;
  padding: 0px;
  margin-top: -208px;
  
}
.cinema_select ul li {
  display: inline;      /* 리스트를 가로로 */
  font-size: 10pt;
  font-weight: bold;
  letter-spacing: 1px;  /* 글자간격 */
  text-align: center;
  float: center;
  border-left: 1px solid #bcbcbc;
  padding-left: 1pt;
  padding-right: 1pt;
}
.cinema_select ul li:first-child {
  border-left: none;
}
.cinema_select ul li a {
  text-decoration: none;
  color: #4e5073;
}
.cinema_select ul li a:hover {
  color: #222538;
}
.cinema_select ul li .on {
  background-color: white;
  border: 1px solid #bcbcbc;
}
.cinema_select ul li span {
  margin-left: 5px;
}

.cinema_addr1 {  /* 극장의 대분류주소 선택 div */
  text-align: left;
  border-bottom: 2px dotted;
}
.cinema_addr1 ul { /* 극장종류 리스트 */
  list-style: none;
  margin: 0px;
  padding: 0px;
  padding-left: 15pt;
}

.cinema_list {  /* 극장의 대분류주소 선택 div */
  text-align: left;
}
.cinema_list ul { /* 극장 리스트 */
  list-style: none;
  margin: 0px;
  padding: 0px;
  padding-left: 15pt;
  font-size: 10pt;
}

/*********** 3) 날짜선택 ***********/

/*********** 4) 영화정보 **************/
.section_result {
  display:inline-block;
  position: relative;
}
/*예매 다시하기 버튼
.initReserve { 
  position: relative;
  transform: translateY(-50%);
  padding:0px;
}*/

.section_result #btn_reset{
  ;
}
.thumb_poster .movie_poster { /*영화 포스터*/
  width: 100%;
  height: 100%;
  margin:auto;
}
.section_result h3 {/*영화 제목*/
  color:white;
  font-size: 18px;
  line-height: 21px;
  letter-spacing: -1px;
  font-weight: bold;
}
dt {
  margin-left:50px;
  float: left;
}
dd, dt {
  line-height: 2;
}
.section_result .btn_area a {
  display: block;
  background: url("./img/btn_reserve.PNG");
}
/*********** 5) 상영시간선택 ***********/
.time_area {
  position: relative;
  top: 0;
}
.cinemainfo, .screentime{
  padding: 0 0 20px 20px;
  text-align: left;
  color:#6670bc;
}
.cinemainfo .cinema_logo {
  width:15%;
  height:15%;
  position: relative;
  top: 15px;
  margin: auto;
}
.cinemainfo .cinemainfo_name{
  vertical-align: bottom;
  color:black;
  font-weight: bold;
}

</style>

<form class="cbp-mc-form" name="regForm" method='POST'
	action='./create.do' onsubmit="return couponCheck(this)">
  <table id="ticketArea">
    <!-------------------------------- 1행 타이틀  --------------------------------------->
    <tr>
      <th>영화선택</th>
      
      <th style="text-align:left;padding-left:10px;">극장선택 
        <input type="image" class="refreshbtn" src="./img/refresh_btn.gif" alt="새로고침"
               onclick="javascript:ResetSelTheaterList('0');nclk(this, 'the.ref', '', 1)">
        <input type="text" id="txtTheater" title="극장검색" class="search">
        <input type="image" class="searchbtn" src="./img/btn_search.gif" alt="검색"
               onclick="javascript:TheaterSearchBtnClick();nclk(this, 'the.enter', '', 1);">
      </th>
     
      <th>날짜선택</th>
      <th>영화정보</th>
    </tr>
    <!-------------------------------- 1행 타이틀 end --------------------------------------->
    
    <tr style="height: 60%;">
      <!-------------------------------- 영화선택 --------------------------------------------------->
      <td class="1st_area">
        <div class="scrollBlind">
          <ul id="movie_list">
            <c:forEach var="movie" items="${movieList }">
              <li id="SelMovieList" value="${movie.mCode }"><a
                href="javascript:void(0);"
                onclick="SelMovieList(${movie.mCode})">${movie.mName }</a>
              </li>
            </c:forEach>
          </ul>
        </div>
      </td>
      <!-------------------------------- 영화선택 end ---------------------------------------------->
      
      <!-------------------------------- 극장선택 --------------------------------------------------->
      <td class="2nd_area">
        <div class="cinema_select">
          <!-- 활성화시 class 'on' -->
          <ul class="tab_menu">
            <li class="t_tab1">
              <a href="javascript:TabTheaterMode('1',0);" onclick="nclk(this, 'the.all', '', 1)" class="on">
              <span>전체극장</span></a></li>
              
            <li class="t_tab2"><a href="javascript:TabTheaterMode('1',1);" onclick="nclk(this, 'the.play', '', 1)" class=""> <span>상영극장</span>
            </a></li>
            <li class="t_tab3"><a
              href="javascript:TabTheaterMode('1',2);"
              onclick="nclk(this, 'the.chain', '', 1)" class=""> <span>체인별</span>
            </a></li>
          </ul>
        </div>

        <div class="cinema_list">
          <ul>
            <c:forEach var="cine" items="${cinelist }">
              <li><a href="#">
              <input type="hidden" name="cineCode" value="${cine.cineCode }"> <c:choose>
                    <c:when test="${cine.brandName == 'CGV' }">CGV</c:when>
                    <c:when test="${cine.brandName == 'LOTTE' }">롯데시네마</c:when>
                    <c:when test="${cine.brandName == 'MEGABOX' }">메가박스</c:when>
                    <c:when test="${cine.brandName == 'INDEP' }">독립영화관</c:when>
                  </c:choose> - ${cine.cineName}
              </a></li>
            </c:forEach>
          </ul>
        </div>
      </td>
      <!------------------------------- 극장선택 end ----------------------------------------------->
      
      <!-------------------------------- 날짜선택 --------------------------------------------------->
      <td id="3rd_area" style="border-left:1px solid black;"></td>
      <!-------------------------------- 날짜선택 end ----------------------------------------------->
      
      <!-------------------------------- 영화정보 --------------------------------------------------->
      <td rowspan="3" style="background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%);color:white;">
        <div class="section_result">
          <div id="btn_reset">
            <input type="image" class="initReserve" src="./img/btn_initReserve.PNG" alt="예매다시하기"
                   onclick="javascript:InitReserveMovie('0')">
          </div>
          
          <div id="thumb_poster" class="thumb_poster">
            <input type="image" class="movie_poster" src="./img/default.png">
          </div>
          
          <h3>
            <span id="select_m_name">영화제목</span>
          </h3>
          
          <!-- 예매 결과 --> 
          <dl class="1st_result">
            <dt>
              <span class="space">극장</span>
            </dt>
            <dd>
              <span id="select_space_txt">영화브랜드 지점</span>
            </dd>
            
            <dt>
              <span class="date">날짜</span>
            </dt>
            <dd>
              <span id="select_date_txt">yyyy.mm.dd(요일) 시:분</span>
            </dd>
            
            <dt>
              <span class="people">인원</span>
            </dt>
            <dd>
              <span id="select_people_txt">유형 인원</span>
            </dd>
            
            <dt>
              <span class="price">금액</span>
            </dt>
            <dd>
              <span class="total">총 금액</span>
            </dd>
          </dl>
          
          <div id="btn_area">
            <input type="image" class="reserve" src="./img/btn_reserve.PNG" alt="예매하기"
                   onclick="javascript:NextBtn();">
          </div>
        </div>

      </td>
      <!-------------------------------- 영화정보 end ----------------------------------------------->      
    </tr>
    <!-------------------------------- 1행 데이터 end ----------------------------------------------->

    <!-------------------------------- 2행 타이틀 --------------------------------------------------->
    <tr>
      <th colspan="2">상영시간표 ▶
        <span style="color: red;">영화/극장/날짜</span>
        <span>를 선택해주세요</span>
      </th>
      <th>인원선택</th>
    </tr>
    <!-------------------------------- 2행 타이틀 end ---------------------------------------------->
    
    <!-------------------------------- 2행 데이터 -------------------------------------------------->
    <tr style="height: 80%;">
      <!------------------------------- 상영시간표 ------------------------------------------------->
      <td colspan="2" style="vertical-align: top;">
        <div class="time_area">
          <div class="cinemainfo">
            <img src="./img/default.png" class="cinema_logo">
              <span class="cinemainfo_name">영화관-지점</span>
          </div>
          <hr>
          
          <div class="screentime">
            <dl id="st_time_lst1" class="num_time"></dl>
              <dt>ex)8관</dt>
              <dd>
                <ul></ul>
              </dd>
          </div>
        </div>
      </td>
      <!------------------------------- 상영시간표 end --------------------------------------------->
      
      <!------------------------------- 인원선택 -------------------------------------------------->
      <td style="border-left:1px solid black;">
      </td>
      <!------------------------------- 인원선택 end ---------------------------------------------->
      
    </tr>
    <!-------------------------------- 2행 데이터 end----------------------------------------------->
  </table>

  <br>
</form>
<!-- 예매 버튼 -->
<div class="cbp-mc-submit-wrap">
    <input class="cbp-mc-submit" type="submit" value="예매" /> <input
      class="cbp-mc-submit" type="reset" value="다시입력" /> <input
      class="cbp-mc-submit" type="button" value="취소"
      onclick="javascript:history.back()" />
</div>

<!-- --------------------- 예매하기 AJAX ----------------------- -->
<script src="../js/jquery.js"></script>
<script>

//영화선택
function SelMovieList(mCode) {
	//해당 영화를 상영하는 극장 출력
	//$.post("./cinelist.do",mCode,cinelist);
};//SelMovieList() end

function theaterNameList(data) {
	alert("data");
}//theaterNameList() end



</script>
<!-- --------------------- 예매하기 AJAX end ----------------------- -->

<!-- -------------------- 달력 script ------------------------ -->
<!-- <script src='../js/jquery.min.js'></script>
<script type="text/javascript" src="../js/index.js"></script> -->
<script>
//Calendar date 객체 생성하기
var Calendar = new Date();

//getDay() 메서드는 (일:0 ~ 토:6)을 반환하니 0번째 인덱스부터 일요일을 넣는다
var day_of_week= ['일','월','화','수','목','금','토'];

//getMonth() 메서드는 (1월:0 ~ 12월:11)을 반환하니 0번째 인덱스부터 1월을 넣는다
var month_of_year = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];

var year = Calendar.getFullYear();  //yyyy년도
var month = Calendar.getMonth();    //0~11 (1~12월 인덱스)
var today = Calendar.getDate();     //1~31 (1~31일)
var weekday = Calendar.getDay();    //0~6(일~토 인덱스)

Calendar.setDate(1);  //달력은 1일부터 표시

var DAYS_OF_WEEK = 7; //일주일은 7일
var DAYS_OF_MONTH = 31; //한달은 최대 31일
var str;

//tr
var TR_start = "<tr>";
var TR_end = "</tr>";

//td css클래스를 이용하여 요일마다 색을 다르게 준다
var TD_week_start = "<td class='week'>";        //일~토 나타낼 td
var TD_blank_start = "<td class='blank'>";      //blank(1일 이전의 날짜)
var TD_today_start = "<td class='today'>";      //오늘 날짜
var TD_day_start = "<td class='day'>";          //평일
var TD_saturday_start = "<td class='saturday'>";//토
var TD_sunday_start = "<td class='sunday'>";    //일
var TD_end = "</td>";                           //테이블 만들기

str = "<table id='date_area' border=1 cellspacing=0 cellpadding=0 bordercolor=bbbbbb><tr><td style='text-align:center'>";
str += "<strong>" + year + ". " + month_of_year[month] + "</strong>";
str += "<table class='calendar' border=0 cellspacing=0 cellpadding=2>";

//본격적인 tr시작. 맨첫줄은 요일
str += TR_start;  //요일 td

for(var i=0; i<DAYS_OF_WEEK; ++i) {
  //7번 돌아가면서 day_of_week의 값을 빼내온다
  str += TD_week_start + day_of_week[i] + TD_end;
}//for end

//요일이 끝나면 한줄 내려가기 위해</tr>
str += TR_end;

//1일이 시작하기 전까지의 이전 요일들을 blank
for(var i=0; i<Calendar.getDay(); ++i) {
  str += TD_blank_start + TD_end;
}//for end

//1일 시작
for(var i=0; i<DAYS_OF_MONTH; ++i) {
  //날짜가 i보다 클때만 표현! 날짜가 i보다 작다는건 다음 달로 넘어가서 1일이 되었다는 의미
  if(Calendar.getDate() > i) {
    var day = Calendar.getDate(); //날짜
    var week_day = Calendar.getDay(); //요일
    
    //만약 일요일이면 다음행
    if(week_day == 0) {
      str += TR_start;
    }
    
    //오늘 날짜라면
    if(day == today) {
      str += TD_today_start + day + TD_end;
    }else {
      switch(week_day) {
      case 0: // 일요일
        str += TD_sunday_start + day + TD_end;
        break;
      case 6: // 토요일
        str += TD_saturday_start + day + TD_end;
        str += TR_end; // 토요일이면 </tr>
        break;
      default: // 평일
        str += TD_day_start + day + TD_end;
        break;
      }
    }
  }//if end
  
  //다음 날짜로 넘어간다
  Calendar.setDate(Calendar.getDate() + 1);
}//for end

str += "</table></td></tr></table>";
//document.write(str);
document.getElementById("3rd_area").innerHTML = str;
</script>
<!-- -------------------- 달력 script end ------------------------ -->
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>