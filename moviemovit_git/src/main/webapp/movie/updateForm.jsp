<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 updateForm.jsp --%>

<!-- <style rel="stylesheet">
.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;        
}
img {        /* 영화 포스터 */
  height: 200px;
  width: 200px;
}
.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 50em);
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

</style> -->
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">
<style>
/*180827 경민 list 클래스 추가*/
.list {
	text-align:left;
	padding:10px;
	margin:auto;
}

.img2 {
    width:200px;
    heigth:200px;
}
</style>


<div class="table-users">
   <div class="header">Movie Update</div>
   <form class="cbp-mc-form" name='regForm' method='POST' action='./update.do' enctype="multipart/form-data" onsubmit="return confirm('수정하시겠습니까?')">
   <input type="hidden" name="mCode" value="${dto.mCode }">
   <table class="cbp-mc-column" style="text-align:center; margin:center;">
      <tr>
        <th>영화명</th>
        <td class="list"><input type="text" name="mName" value="${dto.mName }" required></td>
      </tr>
      <tr>
        <th>포스터</th>
        <td class="list">
        <img class="img2" src="./storage/${dto.poster }">
        </td>
      </tr>
      <tr>
        <th></th>
        <td class="list">
        <input type="file" class="cbp-mc-button" id="posterMF" name="posterMF" required>
        </td>
      </tr>
      <tr>
        <th>장르</th>
        <td class="list">
			<select id="genre" name="genre" required>
              <option value="romance" <c:if test="${dto.genre eq 'romance' }"> selected </c:if> >로맨스</option>
              <option value="crime" <c:if test="${dto.genre eq 'crime' }"> selected </c:if> >범죄/느와르</option>
              <option value="comedy" <c:if test="${dto.genre eq 'comedy' }"> selected </c:if> >코미디</option>
              <option value="FanSF" <c:if test="${dto.genre eq 'FanSF' }"> selected </c:if> >판타지/SF</option>
              <option value="action" <c:if test="${dto.genre eq 'action' }"> selected </c:if> >액션</option>
              <option value="thrillhorror" <c:if test="${dto.genre eq 'thrillhorror' }"> selected </c:if> >스릴러/공포</option>
              <option value="drama" <c:if test="${dto.genre eq 'drama' }"> selected </c:if> >드라마</option>
              <option value="docu" <c:if test="${dto.genre eq 'docu' }"> selected </c:if> >다큐</option>
              <option value="ani" <c:if test="${dto.genre eq 'ani' }"> selected </c:if> >애니메이션</option>
              <option value="etc" <c:if test="${dto.genre eq 'etc' }"> selected </c:if> >기타</option>
            </select>
		</td>
      </tr>
      <tr>
        <th>상영분류</th>
        <td class="list">
	      <select id="screen" name="screen" required>
            <option value="soon" <c:if test="${dto.screen eq 'soon' }"> selected </c:if> >상영예정</option>
            <option value="ing" <c:if test="${dto.screen eq 'ing' }"> selected </c:if> >상영중</option>
            <option value="end" <c:if test="${dto.screen eq 'end' }"> selected </c:if> >상영종료</option>
          </select>
      </tr>
      <tr>
        <th>관람등급</th>
        <td class="list">
			<select id="age" name="age" required>
              <option value="0" <c:if test="${dto.age eq '0' }"> selected </c:if> >전체 관람가</option>
              <option value="12" <c:if test="${dto.age eq '12' }"> selected </c:if> >12세</option>
              <option value="15" <c:if test="${dto.age eq '15' }"> selected </c:if> >15세</option>
              <option value="19" <c:if test="${dto.age eq '19' }"> selected </c:if> >청소년 관람불가</option>
            </select>
		</td>
      </tr>
      <tr>
        <th>줄거리</th>
        <td class="list">
          <textarea id="s_e" name="s_e">${dto.s_e }</textarea>
        </td>
      </tr>
      <tr>
        <th>나라</th>
        <td class="list"><input type="text" id="country" name="country"  value="${dto.country }" readonly></td>
      </tr>
      <tr>
        <th>감독</th>
        <td class="list"><input type="button" id="director" name="director"  value="${dto.director }" required></td>
      </tr>
      <tr>
        <th>주연배우</th>
        <td class="list"><input type="button" id="actor" name="actor"  value="${dto.actor }" readonly required></td>
      </tr>
      <tr>
        <th>영화타입</th>
        <td class="list">
	      <select id="DD" name="DD" required>
            <option <c:if test="${dto.DD eq '2D' }"> selected </c:if> >2D</option>
            <option <c:if test="${dto.DD eq '3D' }"> selected </c:if> >3D</option>
            <option <c:if test="${dto.DD eq '4D' }"> selected </c:if> >4D</option>
            <option <c:if test="${dto.DD eq 'IMAX' }"> selected </c:if> >IMAX</option>
          </select>
		</td>
      </tr>
      <tr>
        <th>상영시간</th>
        <td class="list">
	  		<input type="text" id="runningTime" name="runningTime" value="${dto.runningTime }" required>
	  	</td>
      </tr>
      <tr>
        <th>개봉일</th>
        <td class="list">
	  		<input type="date" id="s_date" name="s_date" value="${dto.s_date }" required>
	  	</td>
      </tr>
      <tr>
        <th>마감일</th>
        <td class="list">
	  		<input type="date" id="e_date" name="e_date" value="${dto.e_date }" required>
	  	</td>
      </tr>
           
   </table>
   
   <!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
	  <input class="cbp-mc-button" type='button' value="뒤로가기" onclick='javascript:history.back()'>	 
	  <input class="cbp-mc-button" type="reset" value="다시입력" />
	  <input class="cbp-mc-button" type="submit" value="수정"/>
	</div>
	</form>
</div>


<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>