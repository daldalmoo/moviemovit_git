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
   <div class="header">People Update</div>
   <form class="cbp-mc-form" name='regForm' method='POST' action='./update.do' enctype="multipart/form-data" onsubmit="return confirm('수정하시겠습니까?')">
   <input type="hidden" name="peoCode" value="${dto.peoCode }">
   <table class="cbp-mc-column" style="text-align:center; margin:center;">
      <tr>
		<th>*이름</th>
		<td class="list">
			<input type="text" id="peoName" name="peoName" value="${dto.peoName }" required>&nbsp;
			<input class="cbp-mc-button"type="button" value="인물 중복확인" id="peopleCheck">
		</td>
	</tr>
	<tr>
		<th>*국적</th>
		<td class="list">
		   <input type="text" id="country" name="country" value="${dto.country }" readonly>
        </td>
	</tr>
	<tr>
		<th>*출생년도</th>
		<td class="list">
		  <input type="date" id="peoBirth" name="peoBirth" value="${dto.peoBirth }" required>
		</td>
	</tr>
	<tr>
		<th>*성별</th>
		<td class="list">
			<select id="gender" name="gender" required>
			  <option value="M" <c:if test="${dto.gender eq 'M' }"> selected </c:if>  >남성</option>
              <option value="W" <c:if test="${dto.gender eq 'W' }"> selected </c:if>  >여성</option>
            </select>
        </td>
	</tr>
	<tr>
		<th>*사진</th>
		<td class="list">
          <img class="img2" src="./storage/${dto.peoPic }">
        </td>
	</tr>
	<tr>
	   <th></th>
	   <td>
	      <input type="file" id="posterMF" name="posterMF" required>
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










