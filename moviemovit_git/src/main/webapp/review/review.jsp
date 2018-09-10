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
/* 0905 th 첫번째 요소 스타일넣기*/
 table th:first-child{
    width: 20%;
 }
 
/* 0905 th 마지막 요소 스타일넣기 */
 table th:last-child {
  width: 150px;
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


<div class="table-users">
   <div class="header">리뷰 목록</div>

   <table>
      <tr>
         <th>아이디공간</th>
         <th> 평가 </th>
         <th> 관리자</th>
      </tr> 
      
       <c:forEach var="dto" items="${list }"> 
      <c:forEach var="reviewstar" items="${reviewstar }">
      
       <tr class="brandtest">
         <td> ${reviewstar.clean }</td>
         <td> 내용임 </td>
         
             <td>
                <input class="cbp-mc-button" type="button" value="공개" onclick=""/>
                <input class="cbp-mc-button" type="button" value="수정" onclick=""/>
                <input class="cbp-mc-button" type="button" value="삭제" onclick=""/>
             </td>
         </tr> 
   </c:forEach>
   </c:forEach>
   </table>
   
</div>



<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>