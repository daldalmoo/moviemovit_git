<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>

<link rel="stylesheet" href="../css/ticket_style.css" type="text/css" />

<%@ include file="../header2.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- -------------------- 달력 script ------------------------ -->
<script type="text/javascript">
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

var DAYS_OF_WEEK = 7; //일주일은 7일
var DAYS_OF_MONTH = 31; //한달은 최대 31일
var str;

//이전달 달력
function prevCalendar() {
  month--;
  if(month<0) { 
    year--;
    month=11;
    //Calendar.setFullYear(year);
    //year--;
    //month = 11;
  }
  //Calendar.setMonth(month);
  buildCalendar();
}

//다음달 달력
function nextCalendar() { 
  month++;
  if(month>11) { 
    year++;
    //Calendar.setFullYear(year);
    month = 0;
  }
  //Calendar.setMonth(month);
  buildCalendar();
}

/*180919 경민 달력 해야할일
다음달로 넘어가는데 2019로 바뀌고 다시 전달로 넘어갈때 12월까지는 정상인데
11월부터 삐꾸남.
전달로 계속 뒤로가다가 2017바뀌고 다시 다음달인 2018.1은정상임
*/

//현재달 달력
function buildCalendar() {
  Calendar.setFullYear(year);
  Calendar.setMonth(month);
  Calendar.setDate(1);  //달력은 1일부터 표시
    
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
  
  str = "<table id='cal_area' border=1 cellspacing=0 cellpadding=0 bordercolor=bbbbbb><tr><td style='text-align:center'>";
  str += "<strong>" + "<div id='prev' onclick='prevCalendar()'>◀</div>" + year + ". " + month_of_year[month] + "<div id='next' onclick='nextCalendar()'>▶</div>" + "</strong>";
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
  document.getElementById("date_area").innerHTML = str;
  //document.write(str);
  
}
</script>
<!-- -------------------- 달력 script end ------------------------ -->

<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do'>
  <table id="ticketArea">
    <!-------------------------------- 1행 타이틀  --------------------------------------->
    <tr>
      <th class="movie_title">
        영화선택
        <img class="refreshbtn" src="./img/refreshbtn.jpg" onmouseover="this.src='./img/refreshbtn_hover.png'" onmouseout="this.src='./img/refreshbtn.jpg'" onclick="ResetMovie();">
      </th>
      
      <th class="cinema_title">
        <span>극장선택</span>
        <img class="refreshbtn" src="./img/refreshbtn.jpg" onmouseover="this.src='./img/refreshbtn_hover.png'" onmouseout="this.src='./img/refreshbtn.jpg'" onclick="ResetCinema();">
        &nbsp;
        <input type="text" class="searchtxt" placeholder=" 극장검색">
        <img class="searchbtn" src="./img/searchbtn.gif" onmouseover="this.src='./img/searchbtn_hover.png'" onmouseout="this.src='./img/searchbtn.gif'" onclick="SearchCinema();">
        <!-- 검색하면 전체극장에서 목록 나옴 -->
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
              <!-- 활성화시 class 'on' -->
              <li class="SelMovieList" value="${movie.mCode }">
                ${movie.mName }
                <%-- <a href="javascript:SelMovieList(${movie.mCode});">${movie.mName }</a> --%>
              </li>
            </c:forEach>
          </ul>
        </div>
      </td>
      <!-- -------------------------- movie_area : 영화선택 end -------------------------- -->


      <!-- ------------------------------ cinema_area : 극장선택 ------------------------------ -->
      <td id="cinema_area">
        <div class="cinema_select">
          <ul class="tab_menu">
            <li class="t_tab1">
              <!-- 활성화시 class 'on' -->
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
          <div class="nocinema">
            <strong>상영극장이 없습니다.</strong>
            <br>영화 또는 날짜를 선택해 주세요.
          </div>
          <div class="cinema_addr1">
            <a href="javascript:addr1Select();" class="addr1Selected">서울(<strong>5</strong>)
              <img src="./img/listbtn.gif" class="addr1Selectedbtn">
            </a>
            <div class="addr1list">
              <ul>
                <li value="SEO">서울</li>
                <li value="GGD">경기도</li>
                <li value="ICH">인천</li>
                <li value="KWD">강원도</li>
                <li value="CCD">충청도</li>
                <li value="KSD">경상도</li>
                <li value="JLD">전라도</li>
                <li value="JJD">제주도</li>
              </ul>
            </div>
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
      <td id="date_area"><script type="text/javascript">buildCalendar();</script></td>
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
          <div id="price_lst">
          
            <table id="price_lst_area">
              <tr class="ticket_title">
                <th>성인<span class="per_price">1매/10,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>
                    <li class="dimmed">0</li>
                    <li class="dimmed">1</li>
                    <li class="dimmed">2</li>
                    <li class="dimmed">3</li>
                    <li class="dimmed">4</li>
                    <li class="dimmed">5</li>
                  </ul>
                </td>
              </tr>

              <tr class="ticket_title">
                <th>청소년<span class="per_price">1매/8,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>
                    <li class="dimmed">0</li>
                    <li class="dimmed">1</li>
                    <li class="dimmed">2</li>
                    <li class="dimmed">3</li>
                    <li class="dimmed">4</li>
                    <li class="dimmed">5</li>
                  </ul>
                </td>
              </tr>

              <tr class="ticket_title">
                <th>경로우대<span class="per_price">1매/6,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>
                    <li class="dimmed">0</li>
                    <li class="dimmed">1</li>
                    <li class="dimmed">2</li>
                    <li class="dimmed">3</li>
                    <li class="dimmed">4</li>
                    <li class="dimmed">5</li>
                  </ul>
                </td>
              </tr>

              <tr class="ticket_title">
                <th>아이<span class="per_price">1매/5,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>
                    <li class="dimmed">0</li>
                    <li class="dimmed">1</li>
                    <li class="dimmed">2</li>
                    <li class="dimmed">3</li>
                    <li class="dimmed">4</li>
                    <li class="dimmed">5</li>
                  </ul>
                </td>
              </tr>

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
<!-- --------------------- 예매하기 AJAX ----------------------- -->	
<script src="../js/jquery.js"></script>
<script>
  $.ajaxSetup({datatype:"text"});
  
  // 전역변수
  var MCODE = "";
  var CCODE = "";
  
  /* ----------- 영화선택 부분 AJAX ------------ */
  // 영화목록 새로고침
  function ResetMovie() {
    MCODE = "";
    $(".movie_area li").removeClass("on");
    
    if($(".t_tab2 a").hasClass("on")==true) {
      $("#cinema_area .nocinema").css('display','block');
      $("#cinema_area .cinema_addr1").css('display','none');
      $("#cinema_area .main_list").css('display','none');
    }//if end
  }//ResetMovie() end
  
  // 영화선택 -> 상영극장 가져오기
  //function SelMovieList(mCode) {
  $(".SelMovieList").click(function(){
    //alert("SelMovieList(mCode) 호출. mCode:" + mCode);
    
    // 선택된 영화목록만 class="on", 이미 선택된 영화라면 on class 지움
    if($(this).hasClass("on")==true) {
      $(this).removeClass("on");
      MCODE = "";
    } else {
      $(".movie_area li").removeClass("on");
      $(this).addClass("on");
      MCODE = $(this).val();  // 전역변수 할당
    }//if end
    
    /*
      $.post(URL,data,function(data,status,xhr)
      - URL : 서버에 요청하는 명령어
      - ★data : 서버에 전송하는 값(변수1=값1&변수2=값2)
      - function : 콜백함수
    */
    $.post("./cinemalist.do","mCode="+MCODE,mainList);  // 영화선택 -> 상영극장 가져오기
  });//SelMovieList() end
  
  /* ----------- 극장선택 부분 AJAX ------------ */
  // 극장목록 새로고침
  function ResetCinema() {
    //alert("ResetCinema() 클릭");
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
      $("#cinema_area .nocinema").css('display','none');
      $("#cinema_area .cinema_addr1").css('display','block');
      $("#cinema_area .main_list").css('display','block');
      $(".cinema_addr1_list a").html("서울");
      $.post("./cinemaRefresh.do","",mainList);
    } else if(i==2) {  // 상영극장
      //alert(MCODE);
      if(MCODE=="") {  /* 영화또는날짜 선택안됐을경우 display 처리 부분 */
        $("#cinema_area .nocinema").css('display','block');
        $("#cinema_area .cinema_addr1").css('display','none');
        $("#cinema_area .main_list").css('display','none');
      }//if end
    } else if(i==3) {  // 체인별
      ;
    }//if end
    
  }//cinemaSelect() end
  
  // 극장목록 보여주기
  function mainList(data) {  // Controller에서 msg 값 data로 받아옴
    //alert("mainList() 호출. data:"+data);
    $(".main_list").html(data);
  }//mainList() end
  /* ----------- 극장선택 부분 AJAX END ------------ */
  
  
  /* --------- 영화,극장,날짜 선택 -> 상영시간표 가져오기 AJAX --------- */
  /*
  function screentimeList(data) {  // Controller에서 msg 값 data로 받아옴
    alert("screentimeList() 호출. data:"+data);
    $(".screentime").html(data);
  }//screentimeList() end
  */
  /* --------- 영화선택 -> 상영극장 가져오기 AJAX end--------- */
 
</script>
<!-- --------------------- 예매하기 AJAX end ----------------------- -->
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>