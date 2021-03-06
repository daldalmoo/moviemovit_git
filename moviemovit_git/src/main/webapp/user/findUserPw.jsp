<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>
<%-- 외부파일 또는 <style> 태그 여기 추가  --%>
<link rel="stylesheet" href="../css/ticket_style.css" type="text/css" />
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>

.list {
  text-align:left;
  padding:10px;
  margin:auto;
}

</style>
<%@ include file="../header2.jsp"%>
<%-- 본문시작 findUserPw.jsp --%>
<h3>Find User Pw</h3>
<form class="cbp-mc-form" name="findForm" method="post" action="./findUserPwProc.do">
	<span style="color: red; font-weight: bold">*회원가입 시 등록한 아이디와 이름과 Email 주소를 입력해 주세요*</span><br>
	<span style="color: red; font-weight: bold">*아이디는 해당 이메일로 전송됩니다*</span><br>	
	<!-- 비밀번호 찾기 폼 -->
	<table class="cbp-mc-column">
	<tr>
		<td class="list">
			<input type="text" id="uid" name="uid" placeholder="아이디" required>
		</td>
	</tr>	
	<tr>
		<td class="list">
			<input type="text" id="uname" name="uname" placeholder="이름" required>
		</td>
	</tr>	
	<tr>
		<td class="list">
			<input type="text" id="email" name="email" placeholder="Daum, Nate 계정 E-mail 주소입력" required>
		</td>
	</tr>
	<tr>
		<td class="list">
			<input class="cbp-mc-submit" type="submit" id="btn_check" value="입력" style="width:70%">	
		</td>
	</tr>
	</table>
</form>

	<!-- 회원확인 폼 -->
	<script src="js/jquery.js"></script>
	<script>
		$("#btn_check").click(function() {
			var uid = $("#uid").val();
			uid = uid.trim();
			
			if(uid.length<5 || uid.length>10) {
				alert("아이디를 확인하세요");
				$("#uid").focus();
				return false;
			}
			
			var uname = $("#uname").val();
			uname = uname.trim();

			if (uname.length<2 || uname.length>20) {
				alert("이름을 확인하세요");
				$("#uname").focus();
				return false;
			}
			
			var email = $("#email").val();
			email = email.trim();

			//검색문자열의 값이  없다면 음수값 반환
			if (email.indexOf("@") < 0) {
				alert("이메일을 확인하세요");
				$("#email").focus();
				return false;
			}
			
			//다음, 네이트 계정인지 확인
			if(email.indexOf("daum") < 0 && email.indexOf("hanmail") < 0 && email.indexOf("nate") < 0 ) {
				alert("이메일은 Daum, Nate 계정만 가능합니다");
				$("#email").focus();
				return false;
			}
			
			$("findForm").sumbmit();
		});//click end
	</script>
	<!-- 회원확인 유효성 검사 끝 -->
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>