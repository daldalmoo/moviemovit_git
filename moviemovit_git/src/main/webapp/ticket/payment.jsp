<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>

<%-- head 에 들어가는 태그 (link, style, meta 등) 여기 추가  --%>
<link rel="stylesheet" href="../css/pay_style.css?ver=1" type="text/css" />


<%@ include file="../header2.jsp"%>
<%-- 본문시작 payment.jsp : 결제수단 --%>

<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do'>
  <table id="paymentArea">
    <!-------------------------------- 1행 타이틀  --------------------------------------->
    <tr>
      <th class="pay_title" colspan="3" style="width:75%;">결제</th>
      <th style="width:20%;">영화정보</th>
    </tr>

    <tr style="width:80%;">
      <!-- -------------------------- paygroup : 할인선택 및 결제수단  ----------------------------- -->
      <td id="paygroup" colspan="3">
        <table id="paygroupTable">
          <tr><th id="groupTitle">할인선택</th></tr>
          <tr>
            <td id="couponData">
								<table style="margin:auto;">
									<tr>
										<th style="text-align: center">쿠폰코드</th>
									</tr>
	
									<tr >
											<td style="padding:10px;text-align: center;">
											   <input type="hidden" id="totalprice" name="totalprice" value="${totalprice }">
											   <c:forEach var="dto" items="${couponList }">
											     <input type="radio" id="cCode" name="coupon" value=${dto.cCode }>&nbsp;10% 할인 쿠폰<br>
											   </c:forEach>
											</td>
									</tr>
    
									<tr>
									 <th>결제금액</th>
									 <td style='padding: 10px;'>
									   <input type='text' id='oirprice' value="${totalprice }">원
									 </td>
								  </tr>
								  
								  <tr id="discountPrice"></tr>
									
								</table>
						</td>
          </tr>
          
          <tr>
            <th id="groupTitle">결제수단
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" id="payType" name="pay" value="credit">&nbsp;신용카드
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" id="payType" name="pay" value="phone">&nbsp;휴대폰 결제
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" id="payType" name="pay" value="deposit">&nbsp;무통장입금
            </th>
          </tr>
          
          <tr style="height: 40%;">
            <td id="payData">                        
            </td>            
          </tr>
          
        </table>
      </td>
      
      <!-- -------------------------- paygroup : 할인선택 및 결제수단 end -------------------------- -->       

    <!-- -------------------------- movieinfo_area : 영화정보 ----------------------------------- -->
    <td id="movieinfo_area" style="background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%); color: white;">
        <div class="section_result">
          <div id="btn_reset">
            <input type="image" class="initReserve" src="./img/btn_initReserve.PNG" alt="예매다시하기" onclick="javascript:InitReserveMovie('0')">
          </div>

          <div id="thumb_poster" class="thumb_poster">
            <input type="image" class="movie_poster" src="./img/bgr_poster.PNG">
          </div>

          <h3><span id="select_m_name">영화제목</span></h3>

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
              <span id="select_people_txt">${auditData }</span>
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

<script src="../js/pay_script.js?ver=1" charset="utf-8"></script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>