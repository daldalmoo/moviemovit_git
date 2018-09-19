<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<head>
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
  border-collapse: collapse;
  border: 1px solid #000;
  width: 90%;
  height: 700px;
  margin: auto;
}
/*상단 타이틀*/
#ticketArea th {
  vertical-align: text-top;
  text-align: center;
  background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%);
  font-size: 12pt;
  font-weight: bold;
  color: white;
  height: 3%;
  width: 25%;
  border: 1px solid #000;
}

#ticketArea>tbody>tr>td {
  border: 1px solid #000;
}

/* 극장선택 타이틀 부분 th 시작 */
.cinema_title .refreshbtn { /* 새로고침 버튼 */
  cursor: pointer;
  width: 19px;
  height: 22px;
  padding-bottom: 3px;
}
.cinema_title .searchtxt{ /* 검색창 */
  text-align: center;
}
.cinema_title .searchbtn { /* 검색 버튼 */
  cursor: pointer;
  width: 22px;
  height: 25px;
  padding-bottom: 3px;
}
/* 극장선택 타이틀 - placeholder 속성 */
.cinema_title ::-webkit-input-placeholder {  /* 크롬 */
  font-size: 15px;
}
.cinema_title :-moz-placeholder {    /* 파이어폭스 */
  font-size: 15px;
}
.cinema_title ::-moz-placeholder {
  font-size: 15px;
}
.cinema_title :-ms-input-placeholder {   /* 익스 */
  font-size: 15px;
}
/* 극장선택 타이틀 부분 th 끝 */

/*********** 1) 영화선택 ***********/
#ticketArea .1st_area {
  vertical-align: text-top;
  width: 25%;
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
  padding: 0 0 5px 15px;
}

/*********** 2) 극장선택 ***********/
#cinema_area .cinema_select ul {     /* 극장 종류 div */
  background: linear-gradient(to top, #e4e4e8 0%, #f3f3f4 100%);
  list-style: none;
  font-weight: bold;
  padding: 0px;
  margin: 0px;
  margin-top: -209px;
}
#cinema_area .cinema_select ul li {
  display: inline;      /* 리스트를 가로로 */
  font-size: 11pt;
  font-weight: bold;
  letter-spacing: 1px;  /* 글자간격 */
  text-align: center;
  float: center;
  border-left: 1px solid #bcbcbc;
  padding-left: 1pt;
  padding-right: 1pt;
}
#cinema_area .cinema_select ul li:first-child {
  border-left: none;
}
#cinema_area .cinema_select ul li a {
  text-decoration: none;
  color: gray;
}
#cinema_area .cinema_select ul li a:hover {
  color: #000;
}
#cinema_area .cinema_select ul li .on {
  background-color: white;
  border: 1px solid #bcbcbc;
  color: #000;
}
#cinema_area .cinema_select ul li span {
  margin-left: 5px;
}

#cinema_area .cinema_addr1 {   /* 극장 대분류주소 div */
  text-align: left;
  border-bottom: 2px solid;
  font-size: 11pt;
}
#cinema_area .cinema_addr1 ul {
  list-style: none;
  margin: 0px;
  padding: 1px 0px 1px 0px;
  padding-left: 15pt;
}

#cinema_area .main_list {  /* 극장 리스트 div */
  text-align: left;
}
#cinema_area .main_list ul {
  list-style: none;
  margin: 0px;
  padding: 0px;
  padding-left: 15pt;
  font-size: 11pt;
}
#cinema_area .main_list ul .on{
  font-weight: bold;
}

/*********** 3) 날짜선택 ***********/

/*********** 4) 영화정보 **************/
.section_result {
  display: inline-block;
  position: relative;
}
/*예매 다시하기 버튼
.initReserve { 
  position: relative;
  transform: translateY(-50%);
  padding:0px;
}*/
.section_result #btn_reset {;
  
}

.thumb_poster .movie_poster { /*영화 포스터*/
  width: 100%;
  height: 100%;
  margin: auto;
}

.section_result h3 { /*영화 제목*/
  color: white;
  font-size: 18px;
  line-height: 21px;
  letter-spacing: -1px;
  font-weight: bold;
}

dt {
  margin-left: 50px;
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

.cinemainfo, .screentime {
  padding: 0 0 20px 20px;
  text-align: left;
  color: #6670bc;
}

.cinemainfo .cinema_logo {
  width: 15%;
  height: 15%;
  position: relative;
  top: 15px;
  margin: auto;
}

.cinemainfo .cinemainfo_name {
  vertical-align: bottom;
  color: black;
  font-weight: bold;
}

/*********** 6) 인원선택 ***********/
.select_people {
  margin:auto;
}
.ticket {
  width: 300px;  
}
.ticket ul {
  margin: 0;
  padding: 0;
}
.ticket ul li {
  list-style: none;
}
.ticket dt {
  position: relative;
  margin-bottom: 3px;
  font-weight: bold;
  color: #b2b6c3;
  margin: 0;
  padding: 0;
}
.ticket dt em {
  position: absolute;
  top: 2px;
  right: 0;
  font-size: 11px;
  font-weight: normal;
  color: #ceced5;
}
.ticket dd {
  overflow: hidden;
  zoom:1;
  margin:0;
  padding:0;
}
.ticket dd li.dimmed {
  display: inline-block;
  width: 25px;
  height: 30px;
  padding-top: 2px;
  background-position: -90px -63px;
  color: #d0d0d8;
}
.ticket dd li {
  margin: 0 1px 0 0;
  padding: 0;
  float: left;
  background:;
  font-family: tahoma;
  font-size: 11px;
  font-weight: bold;
  text-align: center;
}
</style>


<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do'>
  <table id="ticketArea">
    <!-------------------------------- 1행 타이틀  --------------------------------------->
    <tr>
      <th>영화선택</th>
      
      <th class="cinema_title">
        <span>극장선택</span>
        <img class="refreshbtn" src="./img/refreshbtn.jpg" onmouseover="this.src='./img/refreshbtn_hover.png'" onmouseout="this.src='./img/refreshbtn.jpg'" onclick="ResetCinema();">
        &nbsp;
        <input type="text" class="searchtxt" placeholder=" 극장검색">
        <img class="searchbtn" src="./img/searchbtn.gif" onmouseover="this.src='./img/searchbtn_hover.png'" onmouseout="this.src='./img/searchbtn.gif'" onclick="SearchCinema();">
      </th>

      <th>날짜선택</th>
      <th>영화정보</th>
    </tr>
    <!-------------------------------- 1행 타이틀 end --------------------------------------->

    <tr style="height: 60%;">
      <!-- -------------------------- movie_area : 영화선택  ----------------------------- -->
      <td class="movie_area">
        <div class="scrollBlind">
          <ul id="movie_list">
            <c:forEach var="movie" items="${movieList }">
              <li id="SelMovieList" value="${movie.mCode }">
                <a href="javascript:void(0);" onclick="SelMovieList(${movie.mCode})">${movie.mName }</a>
              </li>
            </c:forEach>
          </ul>
        </div>
      </td>
      <!-- -------------------------- movie_area : 영화선택 end -------------------------- -->


      <!-- ------------------------------ cinema_area : 극장선택 ------------------------------ -->
      <td id="cinema_area">
        <div class="cinema_select">
          <!-- 활성화시 class 'on' -->
          <ul class="tab_menu">
            <li class="t_tab1">
              <a href="javascript:cinemaSelect(1)" class="on">
                <span>전체극장</span>
              </a>
            </li>
            <li class="t_tab2">
              <a href="javascript:cinemaSelect(2);" class="">
                <span>상영극장</span>
              </a>
            </li>
            <li class="t_tab3">
              <a href="javascript:cinemaSelect(3);" class="">
                <span>체인별</span>
              </a>
            </li>
          </ul>
        </div>
        
        <div class="cinema_list">
          <div class="cinema_addr1">
            <ul>
              <li>
                <span class="cinema_addr1_list">
                  <a href="javascript:moreArea();" onclick="nclk(this, 'the.loc', '', 1);" class="">서울(<strong>5</strong>)
                    <img src="./img/listbtn1.gif">
                  </a>
                </span>
              </li>
            </ul>
          </div>
          <div class="main_list">
            <ul>
              <c:forEach var="cinema" items="${cinemalist }">
                <li>
                  <a href="#">
                    <input type="hidden" name="cineCode" value="${cinema.cineCode }">
                    <c:choose>
                      <c:when test="${cinema.brandName == 'CGV' }">CGV</c:when>
                      <c:when test="${cinema.brandName == 'LOTTE' }">롯데시네마</c:when>
                      <c:when test="${cinema.brandName == 'MEGABOX' }">메가박스</c:when>
                      <c:when test="${cinema.brandName == 'INDEP' }">독립영화관</c:when>
                    </c:choose>
                    - ${cinema.cineName}
                  </a>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </td>
      <!-- ------------------------------ cinema_area : 극장선택 end ------------------------------ -->
    
    
      <!-- -------------------------- date_area : 날짜 선택 ----------------------------------- -->
      <td id="date_area"></td>
      <!-- -------------------------- date_area : 날짜 선택  end ------------------------------- -->
      

	  <!-- -------------------------- movieinfo_area : 영화정보 ----------------------------------- -->
	  <td id="movieinfo_area" rowspan="3" style="background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%); color: white;">
        <div class="section_result">
          <div id="btn_reset">
            <input type="image" class="initReserve" src="./img/btn_initReserve.PNG" alt="예매다시하기" onclick="javascript:InitReserveMovie('0')">
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
            <input type="image" class="reserve"
              src="./img/btn_reserve.PNG" alt="예매하기"
              onclick="javascript:NextBtn();">
          </div>
        </div>

      </td>
      <!-- -------------------------- movieinfo_area : 영화정보 end -------------------------------- -->
    </tr>
    <!-------------------------------- 1행 데이터 end ----------------------------------------------->


    <!-------------------------------- 2행 타이틀 --------------------------------------------------->
    <tr>
      <th colspan="2">상영시간표 ▶ <span style="color: red;">영화/극장/날짜</span>
        <span>를 선택해주세요</span>
      </th>
      <th>인원선택</th>
    </tr>
    <!-------------------------------- 2행 타이틀 end ---------------------------------------------->


    <!-------------------------------- 2행 데이터 -------------------------------------------------->
    <tr style="height: 80%;">
      <!-- -------------------------- screentime_area : 상영시간 선택 ----------------------------------- -->
      <td id="screentime_area" colspan="2" style="vertical-align: top;">
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
      <!-- -------------------------- screentime_area : 상영시간 선택 end -------------------------------- -->
      
      
      <!-- -------------------------- people_area : 인원 선택 ----------------------------------- -->
	  <td id="people_area" style="border-left: 1px solid black;">
        <div id="select_people">
          <div id="price_1st">
            <table>
            </table>
          </div>
        </div>
      </td>
      <!-- -------------------------- people_area : 인원 선택 end ----------------------------------- -->
      
    </tr>
    <!-------------------------------- 2행 데이터 end----------------------------------------------->
  </table>

  <br>
</form>
<!-- 예매 버튼 -->
<div class="cbp-mc-submit-wrap">
	<input class="cbp-mc-submit" type="submit" value="예매" />
	<input class="cbp-mc-submit" type="reset" value="다시입력" />
	<input class="cbp-mc-submit" type="button" value="취소" onclick="javascript:history.back()" />
</div>

<!-- --------------------- 예매하기 AJAX ----------------------- -->	
<script src="../js/jquery.js"></script>
<script>
  var MCODE = "";
  
  /* ----------- 극장선택 부분 AJAX ------------ */
  // 극장목록 새로고침
  $.ajaxSetup({datatype:"text"});
  
  function ResetCinema() {
    alert("ResetCinema() 클릭");
    $(".t_tab1 a").addClass("on");
    $(".t_tab2 a").removeClass("on");
    $(".t_tab3 a").removeClass("on");

    $(".cinema_addr1_list a").html("서울");
    
    $.post("./cinemaRefresh.do","",mainList);
  }//ResetCinema() end
  
  // 극장종류 선택
  function cinemaSelect(i) {
    //alert("cinemaSelect() 클릭");
    for(var j=1; j<=3; j++) {
      $(".t_tab"+j+" a").removeClass("on");
    }//for end
    $(".t_tab"+i+" a").addClass('on');
    
    if(i==1) {  // 전체극장
      $(".cinema_addr1_list a").html("서울");
      $.post("./cinemaRefresh.do","",mainList);
    } else if(i==2) {  // 상영극장
      //alert(MCODE);
      if(MCODE=="") {
        var msg = "<div style='color:black; padding-top:100px;'>"
        msg += "  <strong>상영극장이 없습니다.</strong>";
        msg += "  <br>영화 또는 날짜를 선택해 주세요.";
        msg += "</div>"
        $(".cinema_list").html(msg);
      }
    } else if(i==3) {  // 체인별
      ;
    }//if end
    
  }//cinemaSelect() end
  
  //영화선택 -> 상영극장 가져오기
  function SelMovieList(mCode) {
    //alert("SelMovieList(mCode) 호출. mCode:" + mCode);
    MCODE = "mCode=" + mCode;
    /*
      $.post(URL,data,function(data,status,xhr)
      - URL : 서버에 요청하는 명령어
      - ★data : 서버에 전송하는 값(변수1=값1&변수2=값2)
      - function : 콜백함수
    */
    $.post("./cinemalist.do",MCODE,mainList);
  };//SelMovieList() end
  
  // 극장목록 보여주기
  function mainList(data) {  // Controller에서 msg 값 data로 받아옴
    //alert("mainList() 호출. data:"+data);
    $(".main_list").html(data);
  }//cineList() end
  /* ----------- 극장선택 부분 AJAX END ------------ */
  
  
  /* --------- 영화,극장,날짜 선택 -> 상영시간표 가져오기 AJAX --------- */
  /*
  function screentimeList(data) {  // Controller에서 msg 값 data로 받아옴
    alert("screentimeList() 호출. data:"+data);
    $(".screentime").html(data);
  }//cineList() end
  */
  /* --------- 영화선택 -> 상영극장 가져오기 AJAX end--------- */
  
  
  
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
document.getElementById("date_area").innerHTML = str;
</script>
<!-- -------------------- 달력 script end ------------------------ -->
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>