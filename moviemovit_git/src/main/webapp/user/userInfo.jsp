<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 joinForm.jsp --%>
<head>

<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>
/*180827 경민 list 클래스 추가*/
.list {
	text-align: left;
	padding: 10px;
	margin: auto;
}
</style>

</head>

<form class="cbp-mc-form" id="regForm" name="regForm">
	<!-- 회원정보 상세보기 -->
	<table class="cbp-mc-column">
		<tr>
			<th>*ID</th>
			<td class="list"><input type="text" id="uid" name="uid" value="${dto.uid }" readonly> 
			</td>
		</tr>
		<tr>
			<th>*Name</th>
			<td class="list">
				<input type="text" id="uname" name="uname" value="${dto.uname }" readonly>
			</td>
		</tr>
		<tr>
			<th>*Gender</th>
			<td class="list">
				<c:choose>
					<c:when test="${dto.gender=='W' }">
						<input type="text" id="gender" name="gender" value="여성" readonly>
					</c:when>
					<c:otherwise>
						<input type="text" id="gender" name="gender" value="남성" readonly>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>*Birth</th>
			<td class="list">
				<input type="text" name="birth" id="birth" value="${dto.birth }" readonly>
			</td>
		</tr>
		<tr>
			<th>*E-mail</th>
			<td class="list">
				<input type="text" name="email" id="email" value="${dto.email }" readonly>
			</td>
		</tr>
		<tr>
			<th>*Tel</th>
			<td class="list">
				<input type="text" name="phone" id="phone" value="${dto.phone }" readonly>
			</td>
		</tr>
		<tr>
			<th>Post</th>
			<td class="list">
				<input type="text" name="zipcode" id="zipcode" value="${dto.zipcode }" readonly>
			</td>
		</tr>
		<tr>
			<th>Address</th>
			<td class="list">
				<input type="text" name="addr1" id="addr1" value="${dto.addr1 }" readonly>
			</td>
		</tr>
		<tr>
			<th>Address_detail</th>
			<td class="list">
				<input type="text" name="addr2" id="addr2" value="${dto.addr2 }" readonly>
			</td>
		</tr>

	</table>

	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="button" value="회원수정" onclick="location.href='userUpdate.do?uid=${dto.uid}'" />
		<input class="cbp-mc-submit" type="button" value="회원탈퇴" onclick="location.href='userDelete.do?uid=${dto.uid}'"/>
	</div>
</form>
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>