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
<%-- 본문시작 userCheckForm.jsp --%>
<h3>User Check</h3>
<form class="cbp-mc-form" name="checkForm" method="post" action="./userUpdateForm.do">	
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
			$("checkForm").sumbmit();
		});//click end
	</script>
	<!-- 회원확인 유효성 검사 끝 -->
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>