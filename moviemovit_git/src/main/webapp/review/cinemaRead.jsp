<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 본문시작 template.jsp --%>

<style rel="stylesheet">


/* 0912 test 목록에 넣을 css */
.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  /* padding: 1rem; */
  text-align: center;
  text-transform: uppercase;        
}



/* 지도 */
/* .map{
  border: 2px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 80%;
}
 */


/* 영화관에 대한 8개항목 총 별점 */
.cinemaStar {
  border: 2px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 80%;
}
.cinemaStar img {
    width: 150px;
}
.cinemaStar table td:first-child{
    align: right;
    text-align: right;
    padding-right: 50px;
 }
.cinemaStar table td:nth-child(2n) {
  align: left;
  text-align: left;
  
}



/* 리뷰목록 불러온곳 */
.table-users {
  border: 2px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 80%;
}
.table-users img {
  width: 130px;
  /* max-width: calc(100% - 50em); */
}




 /* 각 요소별 별점에 적용 */
 .review {
    text-align: center;
    color:  black;
 }
 .review img {
    width: 165px;
    height: 30px;
    margin-right: 1rem;
 }
 


table {
  width: 100%;
} /*
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


 table th:first-child{
    width: 20%;
 }
 
 table th:last-child {
  width: 150px;
} 

 
 
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #bfe1ff;
}
*/



/* 0906버튼 */
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
 
 /* sj0831 */ 
.main-table {
  border: 2px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 80%;
}

/*
table {
  margin-left: 5%;
  margin-right: 5%;   0903 승지 추가 
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
}*/

 
 
}
</style>
<div class="main-table">
<c:set var="cineCode" value="${dto.cineCode}"/> 

<table>
    <tr>                                                                                          <!-- style="float: left; " -->        
       <td rowspan="10"><img src="img/${dto.logoImg }" width="400" height="270"></td>
  </tr> 
       <tr style="font-size: 2em;">
       <th colspan="2"> ${dto.brandName } &nbsp; ${dto.cineName }</th>
  </tr>
  <tr>
     <td colspan="3">
        <!-- dto.cineCode(영화관리스트의 cineCode) 와 reviewstar.cineCode(리뷰의 cineCode)가 일치할때 해당되는 별점 출력 -->
          <c:forEach var="reviewstar" items="${reviewstar }">
          <c:if test="${cineCode eq reviewstar.cineCode }">
               <%-- ${reviewstar.startotal } --%>
               <c:choose>
                      <c:when test="${reviewstar.startotal < 3 }">
                            <img src = "./img/star1.png" width="250">
                      </c:when>
                      <c:when test="${reviewstar.startotal < 5 }">
                            <img src = "./img/star2.png" width="250">
                      </c:when>
                      <c:when test="${reviewstar.startotal < 7 }">
                            <img src = "./img/star3.png" width="250">
                      </c:when>
                      <c:when test="${reviewstar.startotal < 9 }">
                            <img src = "./img/star4.png" width="250">
                      </c:when>
                      <c:when test="${reviewstar.startotal < 11 }">
                            <img src = "./img/star5.png" width="250">
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                    </c:choose>
                    
          <%--  </c:if>
          </c:forEach>   --%>
         
        </td>
  </tr>
  <tr>
    <th>극장주소</th>
    <td>&nbsp;&nbsp;   ${dto.addr2 } ${dto.addr3 }</td>
  </tr>
  <tr>
    <th>문의전화</th>
    <td>${dto.tel }</td>
  </tr>
  <tr>
    <th>홈페이지</th>
    <td><a href="${dto.home }">${dto.home }</a></td>
  </tr>
  <tr>
    <th>비고</th>
    <td>${dto.etc } </td>
  </tr>
</table>
</div>

<!-- 영화관에 대한 각 별점(8개) -->
<div class="cinemaStar">
<table>
                        <!-- 각 영화관별로 평가점수 가져오기 -->
                     <%--  <c:forEach var="reviewstar" items="${reviewstar }">
                      <c:if test="${cineCode == reviewstar.cineCode }"> --%>
                <br>
                <tr>
                   <td>화질 
                      <c:choose>
                      <c:when test="${reviewstar.pixel < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.pixel < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.pixel < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.pixel < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.pixel < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose> 
                            
                   </td> 
                   <td>청결도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:choose>
                      <c:when test="${reviewstar.clean < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.clean < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.clean < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.clean < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.clean < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                    </c:choose>
                   </td>
              </tr> 
              <tr>
                   <td>음향
                        <c:choose>
                      <c:when test="${reviewstar.sound < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.sound < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.sound < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.sound < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.sound < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose>
                   </td>
                 <td>서비스 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:choose>
                      <c:when test="${reviewstar.service < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.service < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.service < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.service < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.service < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose>
                 </td>
              </tr> 
              <tr>
                 <td>좌석 
                        <c:choose>
                      <c:when test="${reviewstar.seat < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.seat < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.seat < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.seat < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.seat < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose>
                 </td> 
                   <td>교통 접근성 &nbsp;&nbsp;&nbsp;
                        <c:choose>
                      <c:when test="${reviewstar.trans < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.trans < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.trans < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.trans < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.trans < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose>
                   </td>
              </tr>  
              <tr>
                <td>매점
                        <c:choose>
                      <c:when test="${reviewstar.snack < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.snack < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.snack < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.snack < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.snack < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose>
                </td> 
                <td>주변 편의시설
                        <c:choose>
                      <c:when test="${reviewstar.around < 3 }">
                            <img src = "./img/star1.png" >
                      </c:when>
                      <c:when test="${reviewstar.around < 5 }">
                            <img src = "./img/star2.png" >
                      </c:when>
                      <c:when test="${reviewstar.around < 7 }">
                            <img src = "./img/star3.png" >
                      </c:when>
                      <c:when test="${reviewstar.around < 9 }">
                            <img src = "./img/star4.png" >
                      </c:when>
                      <c:when test="${reviewstar.around < 11 }">
                            <img src = "./img/star5.png" >
                      </c:when>
                      <c:otherwise>
                             else값  
                      </c:otherwise>
                            </c:choose>
                </td>
              </tr>
              
  </c:if>
  </c:forEach>
</table>
<br>
</div>  <!-- 영화관별 평가보기 끝 -->
            
                
   <a href="./create.do?cineCode=${dto.cineCode }" > ${dto.brandName }  ${dto.cineName }영화관 평가 등록하기 </a>
   <!-- <input class="cbp-mc-button" type="button" value=" 나도 평가 등록하기!! " onclick="location.href='reviewForm.jsp'" > -->



<!-- 각 영화관에 달린 리뷰 -->
<div class="table-users">
   <div class="header">리뷰 목록</div>
<table>
      <tr style="background-color: #bfe1ff;">
         <th>아이디공간</th>
         <th> 평가 </th>
         <th> 관리자</th>
      </tr> 
      
       <c:forEach var="sdto" items="${list }"> 
       
       <!-- 리뷰에 있는 cineCode와 지금 보여지는 cineRead의 cineCode가 일치하는 리뷰만 출력 -->
       <c:if test="${sdto.cineCode eq dto.cineCode }">
       <tr>
         <td> ${sdto.uid }</td>
         <td> 
                     화질 <c:if test="${sdto.pixel==0 }"><img src="./img/star0.png"></c:if>
                   <c:if test="${sdto.pixel==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.pixel==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.pixel==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.pixel==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.pixel==5 }"><img src="./img/star5.png"></c:if>    
                   청결도<c:if test="${sdto.clean==0 }"><img src="./img/star0.png"></c:if>
               <c:if test="${sdto.clean==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.clean==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.clean==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.clean==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.clean==5 }"><img src="./img/star5.png"></c:if>
             <br>
             
            음향 <c:if test="${sdto.sound==0 }"><img src="./img/star0.png"></c:if>
                 <c:if test="${sdto.sound==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.sound==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.sound==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.sound==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.sound==5 }"><img src="./img/star5.png"></c:if>           
         서비스<c:if test="${sdto.service==0 }"><img src="./img/star0.png"></c:if>
                 <c:if test="${sdto.service==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.service==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.service==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.service==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.service==5 }"><img src="./img/star5.png"></c:if> 
             <br>
             
             
                      좌석 <c:if test="${sdto.seat==0 }"><img src="./img/star0.png"></c:if>
             <c:if test="${sdto.seat==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.seat==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.seat==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.seat==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.seat==5 }"><img src="./img/star5.png"></c:if>    
         주변 편의시설<c:if test="${sdto.around==0 }"><img src="./img/star0.png"></c:if>
                     <c:if test="${sdto.around==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.around==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.around==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.around==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.around==5 }"><img src="./img/star5.png"></c:if> 
             <br>
             
             
            매점<c:if test="${sdto.snack==0 }"><img src="./img/star0.png"></c:if>
                 <c:if test="${sdto.snack==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.snack==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.snack==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.snack==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.snack==5 }"><img src="./img/star5.png"></c:if>  
             교통<c:if test="${sdto.trans==0 }"><img src="./img/star0.png"></c:if>
                 <c:if test="${sdto.trans==1 }"><img src="./img/star1.png"></c:if>
                 <c:if test="${sdto.trans==2 }"><img src="./img/star2.png"></c:if>
                 <c:if test="${sdto.trans==3 }"><img src="./img/star3.png"></c:if>
                 <c:if test="${sdto.trans==4 }"><img src="./img/star4.png"></c:if>
                 <c:if test="${sdto.trans==5 }"><img src="./img/star5.png"></c:if>  
                 <br>
                <p style="line-height: 1.4;">${sdto.s_e }</p><hr> </td>
         <td>
            <input class="cbp-mc-button" type="button" value="수정" onclick="location.href='./update.do?cCode=${sdto.cineCode }'"/>
            <input class="cbp-mc-button" type="button" value="삭제" onclick="location.href='./delete.do?cCode=${sdto.cineCode }'"/>
         
         </td> 
         </tr>
   </c:if>
   </c:forEach>
   </table>
</div>


 
<!-- 지도 표시 -->
<div>
        <!--  지도생성                                                                                      테두리 설정 -->
        <div id="map" style="width:400px;height:270px; border: 2px solid #327a81; border-radius: 10px; margin-left: 10%"></div>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c0accc753a3f17e942b62e44cbe2426"></script>
            <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
              mapOption = { 
                    center: new daum.maps.LatLng(37.5014774, 127.0258279), // 지도의 중심좌표
                    level: 4 // 지도의 확대 레벨
                };
                
            var map = new daum.maps.Map(mapContainer, mapOption);
            
            var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
                imageSize = new daum.maps.Size(34, 39), // 마커이미지의 크기입니다
                imageOption = {offset: new daum.maps.Point(20, 62)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new daum.maps.LatLng(37.5014774, 127.0258279); // 마커가 표시될 위치입니다
               
            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
              position: markerPosition,
              image: markerImag  // 마커이미지 설정 
            });
            
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);  
            
            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            var content = '<div class="customoverlay">' +
                '  <a href="http://map.daum.net/link/map/11394059" target="_blank">' +
                '    <span class="title">CGV강남</span>' +
                '  </a>' +
                '</div>';
            
            // 커스텀 오버레이가 표시될 위치입니다 
            var position = new daum.maps.LatLng(37.5014774, 127.0258279);  
            
            // 커스텀 오버레이를 생성합니다
            var customOverlay = new daum.maps.CustomOverlay({
                map: map,
                position: position,
                content: content,
                yAnchor: 1 
            });     ssas
            
</script>   
</div>          



<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>