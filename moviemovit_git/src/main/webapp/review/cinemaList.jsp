<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 본문시작 template.jsp --%>


<style rel="stylesheet">
.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;        
}
img {        /* 영화관 목록안의 영화관이미지 */
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
}
</style>

<table>
        <tr></tr>
    <tr>
    <form id="form_category" method="get" action="/moviemovit/review/cate.do">
        <th style="background-color: lightgray; color: gray; text-align: center;">브랜드</th>
        <td style="background-color:white; text-align: left; color: gray;">
            <input type="checkbox" name="categorybox" value="all" class="checkSelect"><label for="all">모두</label>
            &nbsp;  &nbsp;  &nbsp;
            <input type="checkbox" name="categorybox" value="CGV" class="checkSelect"><label for="CGV">CGV</label>
            &nbsp;  &nbsp;  &nbsp; 
            <input type="checkbox" name="categorybox" value="LOTTE" class="checkSelect""><label for="LOTTE">롯데시네마</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input type="checkbox" name="categorybox" value="MEGABOX" class="checkSelect""><label for="MEGABOX">메가박스</label>
            &nbsp;  &nbsp;  &nbsp;
            <input type="checkbox" name="categorybox" value="INDEP" class="checkSelect"><label for="INDEP">독립영화관</label>
        </td>
    </tr>
    <button type="submit" id="button_cate" onclick="cate();">검색</button>
    </form>
    <tr>
        <th style="background-color: lightgray; color: gray; text-align: center;"> 지역별</th>
        <td style="background-color:white; text-align: left; color: gray;">
            <input  type="checkbox" value="1" id="brand_3" onclick=""><label for="brand_3">모두</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="2" id="brand_3" onclick=""><label for="brand_3">서울</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="3" id="brand_3" onclick=""><label for="brand_3">경기</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="4" id="brand_3" onclick=""><label for="brand_3">인천</label>
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="5" id="brand_3" onclick=""><label for="brand_3">강원</label>
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="6" id="brand_3" onclick=""><label for="brand_3">충청</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="7" id="brand_3" onclick=""><label for="brand_3">경상</label> 
            &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="8" id="brand_3" onclick=""><label for="brand_3">전라</label> 
           &nbsp;  &nbsp;  &nbsp;
            <input  type="checkbox" value="9" id="brand_3" onclick=""><label for="brand_3">제주</label>
           </td> 
        </tr>

</table>

<div class="table-users">
   <div class="header">영화관 목록</div>

   <table>
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
           <c:choose>
               <c:when test="${dto.logoImg == '' || dto.logoImg eq null}">
               <img src="img/default.png" alt="" /></td>
               </c:when>
               <c:otherwise>
               <img src="${dto.logoImg}" alt="" /></td>
               </c:otherwise> 
           </c:choose>
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
           <c:forEach var="reviewstar" items="${reviewstar }">
           <c:choose>
              <c:when test="${dto.cineCode == reviewstar.cineCode}">
               ${reviewstar.startotal}
               </c:when>
               <c:otherwise> </c:otherwise> 
            </c:choose>
            </c:forEach> 
           </td>
           <td>
            <a href="./cinemaRead.do?cineCode=${dto.cineCode }" >${dto.addr2}  ${dto.addr3}</a></td>
           <td>${dto.tel}</td>
           <td>
               <input class="cbp-mc-button" type="button" value="수정" onclick="location.href='./cinemaUpdate.do?cineCode=${dto.cineCode }'"/>
               <input class="cbp-mc-button" type="button" value="삭제" onclick="location.href='./cinemaDelete.do?cineCode=${dto.cineCode }'"/>
             </td>
         </tr>  
     </c:forEach>
   </table>
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




/*  function cate() {
    
    alert("1");
    var checkArr = new Array();
    $("input[name='categorybox']:checked").each(function(i) {
        checkArr.push($(this).val());
    };  */
    
    
</script>


<input class="cbp-mc-button" type="button" value="영화관 등록" onclick="location.href='cinemaForm.do'"/>


<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>