<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 loginForm.jsp --%>
<head>

<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>

.list {
	text-align:left;
	padding:10px;
	margin:auto;
}

</style>

</head>
	<h3>Login</h3>
<!-- 로그인 안했을 때 -->
<c:if test="${empty session.s_id }">
<%
	
	Cookie[] cookies = request.getCookies();
	String c_id = "";
	if(cookies!=null) { //쿠기가 존재한다면
		for(int idx=0; idx<cookies.length; idx++) {
			Cookie cookie = cookies[idx]; //쿠키를 하나씩 추출
			if(cookie.getName().equals("c_id")==true) { //쿠키변수 c_id에 값이 있다면
				c_id = cookie.getValue(); //쿠키의 값을 c_id변수
			}
		}//for end
	}//if end
	
%>
<form class="cbp-mc-form" name="loginForm" method="post" action="./loginproc.do">	
	<!-- 로그인 폼 -->
	<table class="cbp-mc-column">	
	<tr>
		<td class="list">
			<input type="text" id="uid" name="uid" value="<%=c_id%>" placeholder="id" required>
		</td>
	</tr>
	<tr>
		<td class="list">
			<input type="password" id="upw" name="upw" placeholder="password" required>
		</td>
	</tr>
	<tr>
		<td class="list">
			<input class="cbp-mc-submit"type="submit" id="bnt_login" value="로그인" style="width:70%">	
		</td>
	</tr>
		
	<!-- 하단 버튼 -->
	<tr>
		<td class="list">
			<input type="checkbox" name="c_id" style="width:5%" value="SAVE" <%if(!c_id.isEmpty()){out.print("checked");} %>>아이디저장
				&nbsp;|&nbsp;
			<a href="./findUserId.do">아이디찾기</a>
				&nbsp;|&nbsp;
			<a href="./findUserPw.do">비밀번호 찾기</a>
		</td>
	</tr>
	</table>
</form>

	<script src="js/jquery.js"></script>
	<script>
		/*로그인 유효성 검사*/
		$("#btn_login").click(function() {
			//1) 아이디 글자갯수가 5~10 사이인지?
			var uid = $("#uid").val();
			uid = uid.trim(); //공백 지우기

			if (uid.length<5 || uid.length>10) {
				alert("아이디 글자갯수 확인해 주세요");
				$("#uid").focus(); //커서 생성
				return false;
			}
			
			//----------------------------------------------------------
			//2) 비밀번호 글자갯수가 5~10사이인지?
			var upw = $("#upw").val();
			upw = upw.trim();

			if (upw.length<5 || upw.length>10) {
				alert("비밀번호 글자갯수 확인해 주세요");
				$("#upw").focus(); //커서 생성
				return false;
			}		

			$("loginForm").sumbmit();
		});//click end
	</script>
	<!-- 로그인 유효성 검사 끝 -->
</c:if>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>