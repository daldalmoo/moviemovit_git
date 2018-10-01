<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>
<%
  //주소 값에서 cineCode 가져오기
			String roomCode = request.getParameter("roomCode");
			request.setAttribute("roomCode", roomCode);
%>
<%-- 본문시작 theaterForm.jsp --%>

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
<body>

<!-- 상영관 등록 FORM -->
<FORM class="cbp-mc-form" name='roomForm' method='POST' action='./roomUpdate.do'
      enctype="multipart/form-data">
	<span style="color: red; font-weight: bold">* 필수입력</span><br> 
	<input type="hidden" id="roomCode" name="roomCode" value="${roomCode}" />
	<table class="cbp-mc-column">
		<tr>
			<th>*총좌석수</th>
			<td class="list">
			<input type="number" id="seatCnt" name="seatCnt" value="${dto.seatCnt}">&nbsp;</td>
		</tr>
		<tr>
			<th>*상영관 정보</th>
			<td><input type="text" name="DD" id="DD" value="${dto.DD}"></td>
		</tr>
		<tr>
			<th>상영관 별칭</th>
			<td><input type="text" name="etc" id="etc" value="${dto.etc} "></td>
		</tr>
		<tr>
			<th>좌석 선택 이미지</th>
			<td class="seatImg">
			등록된 이미지: ${dto.seatImg}
			<input type="file" name="seatImgMF" id="seatImgMF" required></td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="등록" /> <input
			class="cbp-mc-submit" type="reset" value="다시입력" /> <input
			class="cbp-mc-submit" type="button" value="취소"
			onclick="javascript:history.back()" />
	</div>

</form>
</body>
</html>
