<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header1.jsp"%>

<%-- head 에 들어가는 태그 (link, style, meta 등) 여기 추가  --%>
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="stylesheet" type="text/css">

<%@ include file="../header2.jsp"%>
<%-- 본문시작 --%>

<div class="title">공지사항 삭제</div>
<form method="post" action="./delete.do">
	<input type="hidden" name="qCode" value="${dto.qCode }">
	<div class="content">
		<p>QnA 글을 삭제하시겠습니까?</p>
	</div>
	<div class="bottom">
		<input class="cbp-mc-submit" type="submit" value="삭제">
		<input class="cbp-mc-submit"type="button" value="목록" onclick="location.href='./list.do'">
	</div>
</form>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>