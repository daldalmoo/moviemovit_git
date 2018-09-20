<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header1.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style rel="stylesheet">
.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;        
}
.cinemaimg img {        /* 영화관 목록안의 영화관이미지 0913 지영변경*/
   height: 100px;
  width: 150px;
}
.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
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
  
   .review {
    text-align: left;
    color:  black;
    
 }
 
 /* 0913 별 사이즈 조정 */
 .startotal img {
    height: 30px !important;
 }
}
</style>


<%@ include file="../header2.jsp"%>

<%
String cineCode = request.getParameter("cineCode");
request.setAttribute("cineCode", cineCode);
%>

<table>
        <tr></tr>
    <tr>
        <th style="background-color: lightgray; color: gray; text-align: center;">브랜드</th>
        <td style="background-color:white; text-align: left; color: gray;">
            <input type="checkbox" name="categorybox" value="CGV" onclick="cate()"/><label for="CGV">CGV</label>
            &nbsp;  &nbsp;  &nbsp; 
            <input type="checkbox" name="categorybox" value="LOTTE" onclick="cate()"><label for="LOTTE">롯데시네마</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input type="checkbox" name="categorybox" value="MEGABOX" onclick="cate()" class="checkSelect""><label for="MEGABOX">메가박스</label>
            &nbsp;  &nbsp;  &nbsp;
            <input type="checkbox" name="categorybox" value="INDEP" onclick="cate()" class="checkSelect"><label for="INDEP">독립영화관</label>
        </td>
    </tr>   
    <tr> 
        <th style="background-color:lightgray; color: gray; text-align: center;"> 지역별</th>
        <td style="background-color:white; text-align: left; color: gray;">
           
            <input  type="checkbox" name="addrbox" value="SEO" id="SEO" onclick="cate()"><label for="brand_3">서울</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" name="addrbox" value="3" id="brand_3" onclick="cate()"><label for="brand_3">경기</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" name="addrbox" value="4" id="brand_3" onclick="cate()"><label for="brand_3">인천</label>
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" name="addrbox" value="5" id="brand_3" onclick="cate()""><label for="brand_3">강원</label>
            &nbsp;  &nbsp;  &nbsp; 
            <input  type="checkbox" name="addrbox" value="6" id="brand_3" onclick="cate()""><label for="brand_3">충청</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" name="addrbox" value="7" id="brand_3" onclick="cate()"><label for="brand_3">경상</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" name="addrbox" value="8" id="brand_3" onclick="cate()"><label for="brand_3">전라</label> 
           &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" name="addrbox" value="9" id="brand_3" onclick="cate()"><label for="brand_3">제주</label>
           </td> 
        </tr>

</table>

<div class="table-users">
   <div class="header">영화관 목록</div>
<div id="resulttable">
   <table class="reviewtable">
      <tr>
         <th>영화관</th> 
         <th>브랜드</th>
         <th>지점</th>
         <th>별점</th>
         <th>주소</th>
         <th width="230">문의전화</th>
         <th>수정버튼</th>
      </tr> 
      
       <c:forEach var="dto" items="${list }"> 
           <tr class="brandtest">
         <td>
           <div class="cinemaimg">
         <c:choose>
               <c:when test="${dto.logoImg == '' || empty dto.logoImg}">
               <img src="img/default.png" alt="" /></td>
               </c:when>
               <c:otherwise>
               <img src="img/${dto.logoImg}" alt="" /></td>
               </c:otherwise> 
           </c:choose> 
           </div>
           </td> 
           <td>
           <c:choose>
               <c:when test="${dto.brandName == 'CGV'}">
               CGV
               </c:when>
               <c:when test="${dto.brandName == 'LOTTE'}">
               롯데시네마
               </c:when>
               <c:when test="${dto.brandName == 'INDEP'}">
               독립영화관
               </c:when>
               <c:when test="${dto.brandName == 'MEGABOX'}">
               메가박스
               </c:when>
           </c:choose>
           </td>
           <td>${dto.cineName }</td>
        <td>
         <!-- 별점별 이미지출력 -->
          <div class="startotal">
             <c:choose>
                      <c:when test="${dto.startotal == 0}">
                      <img src = "./img/star0.png" width="150">
                      </c:when>
                      <c:when test="${dto.startotal < 3 }">
                      <img src = "./img/star1.png" width="150">
                      </c:when>
                      <c:when test="${dto.startotal < 5}">
                            <img src = "./img/star2.png" width="150">
                      </c:when>
                      <c:when test="${dto.startotal < 7}">
                            <img src = "./img/star3.png" width="150">
                      </c:when>
                      <c:when test="${dto.startotal < 9}">
                            <img src = "./img/star4.png" width="150">
                      </c:when>
                      <c:when test="${dto.startotal < 11} ">
                            <img src = "./img/star5.png" width="150">
                      </c:when>
                      <c:when test="${dto.startotal eq '' || empty dto.startotal }">
                      <img src = "./img/star0.png" width="150">
                      </c:when>
                </c:choose>  
          </div> 
          </td>
           <td>
            <a href="./cinemaRead.do?cineCode=${dto.cineCode }" >${dto.addr2}  ${dto.addr3}</a></td>
           <td>${dto.tel}</td>
           <td>
               <input class="cbp-mc-button" type="button" value="상영관" onclick="location.href='./roomList.do?cineCode=${dto.cineCode }'"/>
               <input class="cbp-mc-button" type="button" value="수정" onclick="location.href='./cinemaUpdate.do?cineCode=${dto.cineCode }'"/>
               <input class="cbp-mc-button" type="button" value="삭제" onclick="location.href='./cinemaDelete.do?cineCode=${dto.cineCode }'"/>
             </td>
         </tr>  
     </c:forEach>
   </table>
</div> 
</div>
<!-- 게시판 하단의 페이징 버튼 -->
<div class="pager">
        <ul>
               <c:if test="${ pageMaker.cri.page > 10 }">
                       <li><a href="moviemovit/review/cinemaList.do?page=${ pageMaker.startPage - 1 }">◀</a></li>
               </c:if>
               <!-- startpage랑 endpage -->
                       <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
                              <c:choose>
                                      <c:when test="${ i > pageMaker.endPage }">
                                             <li>${ i }</li>
                                      </c:when>
                                      <c:when test="${ i == pageMaker.cri.page }">
                                             <li class="selected">[${ i }]</li>
                                      </c:when>
                                      <c:otherwise>
                                             <li><a href="/moviemovit/review/cinemaList.do?page=${ i }">${ i }</a></li>
                                      </c:otherwise>
                              </c:choose>
                       </c:forEach>
                <!--  디스플레이 하고 싶은 페이지 개수 < 실제 페이지의 끝자리 -->
               <c:if test="${ pageMaker.displayPageNum < pageMaker.endPage }">
                       <li><a href="/moviemovit/review/cinemaList.do?page=${ pageMaker.endPage + 1 }">▶</a></li>
               </c:if>
        </ul>
</div>  

<form id="form_search" method="get" action="/moviemovit/review/search.do"> 
<select id="sch_type" name="sch_type"> 
<option value="cineName">영화관이름</option> 
<input type="text" id="sch_value" name="sch_value" value="${mapSearch.sch_value}"/> 
<button type="button" onclick="search();">검색</button> </form> 

<script src="../js/jquery.js"></script>
<script> 
// 검색
function search() { var sch_value = jQuery('#form_search #sch_value').val(); 
if (sch_value == '') { alert('검색어를 입력하세요.'); } 
else { jQuery('#form_search').submit(); } } 
//jQuery('#form_search #sch_type option').val('${mapSearch.sch_type}');
jQuery('#form_search #sch_type value').val('${mapSearch.sch_type}'); 
/*
 일단 체크 된 값들을 받아오기 > 받아온 다음  
 select해서 list를 다시 만들어서 받아오는 것보다
 카테고리박스가 체크된 값들 중에서 brandName이랑 일치하는 것을 for문으로 돌려서 받기...?
 
 */
function cate() {
    var checkArr = new Array();
    $("input[name='categorybox']:checked").each(function(i) {
        checkArr.push($(this).val());
    });
        var checkArr2 = new Array();
        $("input[name='addrbox']:checked").each(function(i) {
            checkArr2.push($(this).val());
    });
    //값 확인 
    alert(checkArr);
    alert(checkArr2);

    //AJAX 시작
    $.post("./category.do", { "checkArr" : checkArr, "checkArr2" : checkArr2}, categorize, "html");
    
    function categorize(result) {
        //2단계 : 서버에서 응답받은 값 받기
        $("#resulttable").html(result); 
        alert('완료');
    }//CheckIdProc() end
    
    
/*         $.ajax({
            type: "POST",
            cache: false,
            url: "category.do",
            dataType: "html",
            data: { "checkArr" : checkArr, "checkArr2" : checkArr2},
            success: function(data) {  
              $("#resulttable").html(data); 
              alert('완료');
              return true;},
              error : function(request,status,error) {
                  alert(JSON.stringify(request,status,error));
              }
          });//ajax end */
          
 }  // cate is ended
     
// 전체 체크 박스
$(function(){ 
    //전체선택 체크박스 클릭 
    $("#allCheck").click(function(){ 
        //만약 전체 선택 체크박스가 체크된상태일경우 
        if($("#allCheck").prop("checked")) { 
            //해당화면에 전체 checkbox들을 체크해준다
            $("input[type=checkbox]").prop("checked",true); 
            // 전체선택 체크박스가 해제된 경우 
            } else { 
                //해당화면에 모든 checkbox들의 체크를해제시킨다. 
                $("input[type=checkbox]").prop("checked",false); } }) })
</script>

<input class="cbp-mc-button" type="button" value="영화관 등록" onclick="location.href='cinemaForm.do'"/>


<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>