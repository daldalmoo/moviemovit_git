<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>공지사항 삭제</title> 
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head> 
<body>
<div class="title">공지사항 삭제</div>
<form method="post" action="./delete.do">
	<input type="hidden" name="noticeno" value="${dto.noticeno }">
	<div class="content">
		<p>공지사항 글을 삭제하시겠습니까?</p>
	</div>
	<div class="bottom">
		<input class="cbp-mc-submit" type="submit" value="삭제">
		<input class="cbp-mc-submit"type="button" value="목록" onclick="location.href='./list.do'">
	</div>
</form>

</body> 
</html> 
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>