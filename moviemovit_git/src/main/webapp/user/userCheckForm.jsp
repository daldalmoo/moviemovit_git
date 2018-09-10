<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 userCheckForm.jsp --%>
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
	<h3>User Check</h3>
<form class="cbp-mc-form" name="checkForm" method="post" action="./userDelete.do">	
	<!-- 회원확인 폼 -->
	<table class="cbp-mc-column">	
	<tr>
		<td class="list">
			<input type="password" id="upw" name="upw" placeholder="password" required>
			<input type="hidden" name="uid" value="${dto.uid }">
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
			//1) 비밀번호 글자갯수가 5~10사이인지?
			var upw = $("#upw").val();
			upw = upw.trim();

			if (upw.length<5 || upw.length>10) {
				alert("비밀번호 글자갯수 확인해 주세요");
				$("#upw").focus(); //커서 생성
				return false;
			}
			//----------------------------------------------------------			
			//2) 비번에 특수문자 포함되어 있는지?
			var spe = upw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			if (spe < 0) {
				alert("특수문자를 혼합하여 입력해주세요.");
				$("#upw").focus();
				return false;
			}
			//----------------------------------------------
			var msg = "탈퇴한 경우 내용은 복구할 수 없습니다\n탈퇴하시겠습니까?";
			if(confirm(msg)) {
				$("checkForm").sumbmit();
			}
		});//click end
	</script>
	<!-- 회원확인 유효성 검사 끝 -->
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>