<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>

<%-- head 에 들어가는 태그 (link, style, meta 등) 여기 추가  --%>
<link rel="stylesheet" href="../css/seat_style.css?ver=3" type="text/css" />


<%@ include file="../header2.jsp"%>
<%-- 본문시작 ticketSeat.jsp : 좌석선택 --%>

<form class="cbp-mc-form" name="regForm" method='POST' action="./payment.do">
  <input type="hidden" id="peocnt" value="${peocnt }">
  <input type="hidden" id="sCode" value="${sCode }">
  <table id="seatArea">
    <!-------------------------------- 1행 타이틀  --------------------------------------->
    <tr>
      <th class="seat_title" colspan="2" style="width:80%;">좌석선택</th>
      <th style="width:20%;">영화정보</th>
    </tr>

    <tr style="width:80%;">
      <!-- -------------------------- seat_area : 좌석선택  ----------------------------- -->
      <td id="seat_area" colspan="2">
          <div class="screen_section">
            <img src="./img/front_screen.PNG" class="front_screen">
          </div>
          
          <div class="seatmap">
            <ul>
              <span class="seatNum">A</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">B</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">C</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">D</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">E</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">F</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">G</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">H</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">I</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">J</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">K</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>

            <ul>
              <span class="seatNum">L</span>
              <c:forEach var="seat" begin="1" end="18" step="1">
                <li class="seatline">${seat }</li>
              </c:forEach>
            </ul>
          </div>
          
          <div class="seat_info_img">
            <img src="./img/seatInfo.PNG" class="seat_img">
          </div>

      </td>      

    <!-- -------------------------- movieinfo_area : 영화정보 ----------------------------------- -->
    <td id="movieinfo_area" style="background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%); color: white;">
        <div class="section_result">
          <div id="thumb_poster" class="thumb_poster">
            <img src="${m_poster }" class="movie_poster">
            <input type="hidden" id="m_poster" name="m_poster" value="${m_poster }">
          </div>

          <h3>
            <span id="select_m_name">${m_name }</span>
            <input type="hidden" id="m_name" name="m_name" value="${m_name }">
          </h3>
          
          <dl class="1st_result">
            <dt>
              <span class="space">극장</span>
            </dt>
            <dd>
              <span id="select_space_txt">${cine_name }</span>
              <input type="hidden" id="cine_name" name="cine_name" value="${cine_name }">
            </dd>

            <dt>
              <span class="date">날짜</span>
            </dt>
            <dd>
              <span id="wdate">${s_date }</span>
              <input type="hidden" id="s_date" name="s_date" value="${s_date }">
            </dd>

            <dt>
              <span class="people">인원</span>
            </dt>
            <dd>
              <span id="select_people_txt">${auditData }</span>
              <input type="hidden" name="auditData" value="${auditData }">
              <input type="hidden" id="movieseat" name="movieseat" value="">
            </dd>

            <dt>
              <span class="price">금액</span>
            </dt>
            <dd>
              <span id="total">${totalprice }</span>
              <input type="hidden" id="totalprice" name="totalprice" value="${totalprice }">
            </dd>
          </dl>

          <div id="btn_area">
            <input type="image" class="reserve" src="./img/btn_reserve.PNG" alt="예매하기" onclick="javascript:NextBtn();">
          </div>
          
        </div>
      </td>
      <!-- -------------------------- movieinfo_area : 영화정보 end -------------------------------- -->
    </tr>

  </table>

</form>

<script src="../js/seat_script.js?ver=2" charset="utf-8"></script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>