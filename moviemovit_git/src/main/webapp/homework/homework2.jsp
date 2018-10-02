﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../header1.jsp"%> 

<style rel="stylesheet">
.header {
  background-color: #fed513; /* 테이블 이름 배경 색상 (COUPON LIST) */
  color: black; /* 테이블 이름 글자 색상 (COUPON LIST) */
  font-weight: bold;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
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

table tr:nth-child(2n) {
  background-color: white;
}

table tr:nth-child(2n+1) {
  background-color: #feed9a; /* 테이블 격줄마다 색상 */
}

table th, table td {
  color: #2b686e;
  padding: 10px;
}

table th {
  background-color: #feed9a; /* 테이블 컬럼명 색상 (Picture, Name, ...) */
  font-weight: 300;
  color: black;
  font-weight: bold;
  text-align: center;
}

table td {
  text-align: center;
  vertical-align: middle;
}

table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
}

td:nth-child(3), td:nth-child(4) {
  min-width: 100px;
}

@media screen and (max-width: 564px) {
  table, tr, td {
    display: block;
  }
  tbody {
    display: table;
    width: 100%;
    text-align: left;
  }
  tr {
    position: relative;
  }
  tr:first-child {
    display: none;
  }
  table td {
    position: relative;
    color: #2b686e;
    padding: 5px;
  }
  td:before {
    position: relative;
    color: #2b686e;
  }
  td:nth-child(1):before {
    content: '쿠폰코드 : ';
  }
  td:nth-child(2):before {
    content: '회원아이디 : ';
  }
  td:nth-child(3):before {
    content: '발급일 : ';
  }
  td:nth-child(4):before {
    content: '만료일 : ';
  }
} /* media(564px) end */
.cbp-mc-submit-wrap {
  text-align: right;
  padding-top: 0px;
  padding-right: 20px;
  clear: both;
}

.cbp-mc-submit-wrap input.cbp-mc-submit {
  background: #40bf80; /* 쿠폰 등록 버튼 색상 */
  border: 0px solid #327a81;
  color: #fff;
  font-weight: bold;
  width: auto;
  cursor: pointer;
  text-transform: uppercase;
  display: inline-block;
  padding: 15px 30px;
  font-size: 1.1em;
  border-radius: 2px;
  letter-spacing: 1px;
}

.cbp-mc-submit-wrap input.cbp-mc-submit:hover {
  background: #2b8256; /* 쿠폰 등록 버튼 마우스 오버시 색상 */
}

.listbutton {
  background: #40bf80; /* 공개 수정 삭제 버튼 색상 */
  border: 0px solid #feed9a;
  color: #fff;
  font-weight: bold;
  width: auto;
  cursor: pointer;
  text-transform: uppercase;
  display: inline-block;
  font-size: 1.1em;
  border-radius: 2px;
  letter-spacing: 1px;
}

.listbutton:hover {
  background: #2b8256; /* 공개 수정 삭제 버튼 마우스 오버시 색상 */
}
</style>

<%@ include file="../header2.jsp"%>

<h5>등급별 쿠폰 사용 상위 TOP3</h5>
<c:set var="total" value='0'/>
<c:forEach var="dto" items="${dto }">
<c:set var="total" value="${dto.cnt + total }"/>
</c:forEach>

<c:set var="tot" value='0'/>
<c:forEach var="sdto" items="${sdto }">
<c:set var="tot" value="${sdto.cnt + tot }"/>
</c:forEach>

<div class="cbp-mc-submit-wrap"></div>
<div class="table-users">
  <table>
    <tr>
      <th>등급명</th>
      <th>비율</th>
    </tr>
    <c:forEach var="dto" items="${dto }">
      <tr>
        <td>${dto.grade}</td>
        <td> 
        <fmt:formatNumber value="${dto.cnt/total*100}" pattern=".0"/>%</td>
      </tr>
      </c:forEach>
  </table>
  
</div>
<h5>등급별 구매 상위 TOP3</h5>
<div class="cbp-mc-submit-wrap"></div>
<div class="table-users">
    <table>
        <tr>
            <th>등급명</th>
            <th>비율</th>
        </tr>
        <c:forEach var="sdto" items="${sdto }">
            <tr>
                <td>${sdto.grade}</td>
                <td> 
                <fmt:formatNumber value="${sdto.cnt/tot*100}" pattern=".0"/>%</td>
            </tr>
            </c:forEach>
    </table>
</div>


<%@ include file="../footer.jsp"%>