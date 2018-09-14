<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<th>이름</th>
		<th>나라</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>사진</th>
		<!-- <th>선택</th> -->
	</tr>

	<c:forEach var="dto" items= "${resultList }">
		<tr>
			<td>${dto.peoName }</td>
			<td>${dto.country }</td>
			<td>${dto.peoBirth }</td>
			<td>${dto.gender }</td>
			<td><img class="mimg" src="./storage/${dto.peoPic }"></td>
			<!-- <td><input class="selectbutton" type='button' value='V'></td> -->
		</tr>
	</c:forEach>
</table>


<!-- jquery.js import -->
<!-- <script src="../js/jquery.js"></script>
<script>
/* 버튼 누르면 peoName 값 가져와서 부모창에 입력하고 창 닫기 */
$(".selectbutton").click(function(){
  // 해당 줄의 uid 값 가져오기
  var peoName = $(this).parent().prev().text();
  alert(peoName);
  
  // 부모창에 uid 입력
  opener.document.getElementById("peoName").value = peoName;
  window.close();
});
</script> -->