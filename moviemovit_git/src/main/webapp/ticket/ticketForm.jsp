<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>

<%-- head 에 들어가는 태그 (link, style, meta 등) 여기 추가  --%>
<link rel="stylesheet" href="../css/ticket_style.css?ver=2" type="text/css" />

<%@ include file="../header2.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- -------------------- 달력 script ------------------------ -->
<script type="text/javascript">
//Calendar date 객체 생성하기
var Calendar = new Date();

// 오늘날짜
var t_year = Calendar.getFullYear();  //yyyy년도
var t_month = Calendar.getMonth();    //0~11 (1~12월 인덱스)
var t_today = Calendar.getDate();     //1~31 (1~31일)

//getDay() 메서드는 (일:0 ~ 토:6)을 반환하니 0번째 인덱스부터 일요일을 넣는다
var day_of_week= ['일','월','화','수','목','금','토'];

//getMonth() 메서드는 (1월:0 ~ 12월:11)을 반환하니 0번째 인덱스부터 1월을 넣는다
var month_of_year = ['1','2','3','4','5','6','7','8','9','10','11','12'];

// 달마다 바뀔 날짜
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
  var TD_end = "</td>";                           //테이블 만들기
  
  str = "<table id='cal_area' border=1 cellspacing=0 cellpadding=0 bordercolor=bbbbbb><tr><td style='text-align:center'>";
  
  str += "<input type='hidden' id='calYear' value='" + year + "'>";
  str += "<input type='hidden' id='calMonth' value='" + month_of_year[month] + "'>";
  
  str += "<div id='YM'><strong>" + "<div id='prev' onclick='prevCalendar()'>◀</div>";
  str += "<span>" + year + ". " + month_of_year[month] + "</span>";
  str += "<div id='next' onclick='nextCalendar()'>▶</div>" + "</strong></div>";
  
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

      // 일요일이면 <tr> 시작
      if(week_day == 0) {
        str += TR_start;
      }
      
      // 일,토,평일 색상클래스 추가
      switch(week_day) {
        case 0: // 일요일
          str += "<td class='sunday";
          break;
        case 6: // 토요일
          str += "<td class='saturday";
          break;
        default: // 평일
          str += "<td class='day";
          break;
      }//switch end
      
      // 오늘 날짜라면 class에 today 추가
      if(year==t_year && month==t_month && day==t_today) {
        str += " today";
      }//if end
      
      // onclick 함수 추가. 이때 월일이 한자리면 앞에 0 추가
      if(month+1<10) {
        if(day<10) str += "' onclick='javascript:SelDate(\""+year+"-0"+(month+1)+"-0"+day+"\")'>" + day + TD_end;
        else str += "' onclick='javascript:SelDate(\""+year+"-0"+(month+1)+"-"+day+"\")'>" + day + TD_end;
      } else {
        if(day<10) str += "' onclick='javascript:SelDate(\""+year+"-"+(month+1)+"-0"+day+"\")'>" + day + TD_end;
        else str += "' onclick='javascript:SelDate(\""+year+"-"+(month+1)+"-"+day+"\")'>" + day + TD_end;
      }//if end
    }//if end
    
    // 토요일이면 </tr> 끝
    if(week_day == 6) {
      str += TR_end;
    }//if end
    
    //다음 날짜로 넘어간다
    Calendar.setDate(Calendar.getDate() + 1);
    
  }//for end  
  str += "</table></td></tr></table>";
  
  str += "<img src='./img/calender_info.PNG' class='calenderinfo'>";
  
  document.getElementById("date_area").innerHTML = str;
  //document.write(str);
  
}
</script>
<!-- -------------------- 달력 script end ------------------------ -->

<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do'>
  <!-- POST 방식으로 보낼 데이터 -->
  <input type='hidden' id='sCode'     name='sCode'     value=''>
  <input type='hidden' id='auditType' name='auditType' value=''>
  
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
        <img class="closebtn" src="./img/closebtn.jpg" onmouseover="this.src='./img/closebtn_hover.jpg'" onmouseout="this.src='./img/closebtn.jpg'" onclick="closeSearch();">
        <!-- 검색하면 전체극장에서 목록 나옴 -->
      </th>

      <th>날짜선택</th>
      <th>영화정보</th>
    </tr>
    <!-------------------------------- 1행 타이틀 end --------------------------------------->

    <tr style="height: 60%;">
      <!-- -------------------------- movie_area : 영화선택  ----------------------------- -->
      <td id="movie_area">
        <div class="scrollBlind">
          <ul class="movie_list">
            <c:forEach var="movie" items="${movieList }">
              <!-- 활성화시 class 'on' -->
              <li class="SelMovieList" value="${movie.mCode }">
                ${movie.mName }
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
                <span>체인별&nbsp;</span>
              </a>
            </li>
          </ul>
        </div>
        <div class="cinema_list">
          <div class="nocinema">
            <strong>상영극장이 없습니다.</strong>
            <br>영화 또는 날짜를 선택해 주세요.
          </div>
          <div class="cinema_chain">
            <ul>
              <li class="cgvbtn on" value="C"><a title="CGV"></a></li>
              <li class="lottebtn" value="L"><a title="롯데시네마"></a></li>
              <li class="megabtn" value="M"><a title="메가박스"></a></li>
              <li class="indebtn" value="D"><a title="독립영화관"></a></li>
            </ul>
          </div>
          <div class="cinema_addr1">
            <a href="#" class="addr1selected">
              <span>전국(<strong>${cinemacntmap.all}</strong>)</span>
              <img src="./img/listbtn.gif" class="addr1selectedbtn">
            </a>
            <div class="addr1list">
              <ul>
                <li value="all" style='border-bottom: 1px dotted gray;'>전국(<strong>${cinemacntmap.all}</strong>)</li>
                <li value="SEO">서울(<strong>${cinemacntmap.SEO}</strong>)</li>
                <li value="GGD">경기도(<strong>${cinemacntmap.GGD}</strong>)</li>
                <li value="ICH">인천(<strong>${cinemacntmap.ICH}</strong>)</li>
                <li value="GWD">강원도(<strong>${cinemacntmap.GWD}</strong>)</li>
                <li value="CCD">충청도(<strong>${cinemacntmap.CCD}</strong>)</li>
                <li value="GSD">경상도(<strong>${cinemacntmap.GSD}</strong>)</li>
                <li value="JLD">전라도(<strong>${cinemacntmap.JLD}</strong>)</li>
                <li value="JJD">제주도(<strong>${cinemacntmap.JJD}</strong>)</li>
              </ul>
            </div>
          </div>
          <div class="main_list">
            <ul>
              <c:forEach var="cinema" items="${cinemalist }">
                <li value="${cinema.cineCode }">
                  <c:choose>
                    <c:when test="${cinema.brandName == 'CGV' }">CGV</c:when>
                    <c:when test="${cinema.brandName == 'LOTTE' }">롯데시네마</c:when>
                    <c:when test="${cinema.brandName == 'MEGABOX' }">메가박스</c:when>
                    <c:when test="${cinema.brandName == 'INDEP' }">독립영화관</c:when>
                  </c:choose>
                  - ${cinema.cineName}
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </td>
      <!-- ------------------------------ cinema_area : 극장선택 end ------------------------------ -->
    
    
      <!-- -------------------------- date_area : 날짜 선택 ----------------------------------- -->
      <td id="date_area">
        <script type="text/javascript">buildCalendar();</script>
      </td>
      <!-- -------------------------- date_area : 날짜 선택  end ------------------------------- -->
      

	  <!-- -------------------------- movieinfo_area : 영화정보 ----------------------------------- -->
	  <td id="movieinfo_area" rowspan="3" style="background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%); color: white;">
        <div class="section_result">
          <div id="btn_reset">
            <input type="image" class="initReserve" src="./img/btn_initReserve.PNG" alt="예매다시하기" onclick="javascript:InitReserveMovie('0')">
          </div>

          <div id="thumb_poster" class="thumb_poster">
            <input type="image" class="movie_poster" src="./img/bgr_poster.PNG">
          </div>

          <h3><span id="select_m_name">신과함께</span></h3>

          <!-- 예매 결과 -->
          <dl class="1st_result">
            <dt>
              <span class="space">극장</span>
            </dt>
            <dd>
              <span id="select_space_txt">롯데시네마 - 월드타워점</span>
            </dd>

            <dt>
              <span class="date">날짜</span>
            </dt>
            <dd>
              <span id="wdate">2018-10-01</span>
            </dd>

            <dt>
              <span class="people">인원</span>
            </dt>
            <dd>
              <span id="auditType">성인 1, 청소년 2</span>
              <input type="hidden" id="peocnt" name="peocnt" value="">
            </dd>

            <dt>
              <span class="price">금액</span>
            </dt>
            <dd>
              <span id="total">26000</span>
            </dd>
          </dl>

          <div id="btn_area">
            <input type="image" class="reserve"
              src="./img/btn_reserve.PNG" alt="예매하기" onclick="javascript:NextBtn();">
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
          <div class="screentime">
            
            <dl id="1">
              <dt>1 관</dt>
              <dd>
                <ul>
                  <li onclick="timeclick('1030');">10:30</li>
                  <li>13:40</li>
                  <li>17:10</li>
                  <li>21:00</li>
                </ul>
              </dd>
            </dl>
            <dl id="2">
              <dt>2 관</dt>
              <dd>
                <ul>
                  <li onclick="timeclick('1030');">10:30</li>
                  <li>13:40</li>
                  <li>17:10</li>
                  <li>21:00</li>
                </ul>
              </dd>
            </dl>
            <dl id="2">
              <dt>2 관</dt>
              <dd>
                <ul>
                  <li onclick="timeclick('1030');">10:30</li>
                  <li>13:40</li>
                  <li>17:10</li>
                  <li>21:00</li>
                </ul>
              </dd>
            </dl>
            <dl id="2">
              <dt>2 관</dt>
              <dd>
                <ul>
                  <li onclick="timeclick('1030');">10:30</li>
                  <li>13:40</li>
                  <li>17:10</li>
                  <li>21:00</li>
                </ul>
              </dd>
            </dl>
            
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
                    <li class="adult" id="adult" value="성인">0</li>
                    <li class="adult" id="adult" value="성인">1</li>
                    <li class="adult" id="adult" value="성인">2</li>
                    <li class="adult" id="adult" value="성인">3</li>
                    <li class="adult" id="adult" value="성인">4</li>
                    <li class="adult" id="adult" value="성인">5</li>
                  </ul>
                </td>
              </tr>

              <tr class="ticket_title">
                <th>청소년<span class="per_price">1매/8,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>
                    <li class="youth" id="youth" value="청소년">0</li>
                    <li class="youth" id="youth" value="청소년">1</li>
                    <li class="youth" id="youth" value="청소년">2</li>
                    <li class="youth" id="youth" value="청소년">3</li>
                    <li class="youth" id="youth" value="청소년">4</li>
                    <li class="youth" id="youth" value="청소년">5</li>
                  </ul>               
                </td>
              </tr>

              <tr class="ticket_title">
                <th>우대<span class="per_price">1매/6,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>
                 <li class="senior" id="senior" value="우대">0</li>
                 <li class="senior" id="senior" value="우대">1</li>
                 <li class="senior" id="senior" value="우대">2</li>
                 <li class="senior" id="senior" value="우대">3</li>
                 <li class="senior" id="senior" value="우대">4</li>
                 <li class="senior" id="senior" value="우대">5</li>
                  </ul>
                </td>
              </tr>

              <tr class="ticket_title">
                <th>어린이<span class="per_price">1매/5,000원</span></th>
              </tr>

              <tr class="ticket_data">
                <td>
                  <ul>         
                    <li class="kid" id="kid" value="어린이">0</li>
                    <li class="kid" id="kid" value="어린이">1</li>
                    <li class="kid" id="kid" value="어린이">2</li>
                    <li class="kid" id="kid" value="어린이">3</li>
                    <li class="kid" id="kid" value="어린이">4</li>
                    <li class="kid" id="kid" value="어린이">5</li>
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

<script src="../js/ticket_script.js?ver=2" charset="utf-8"></script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>