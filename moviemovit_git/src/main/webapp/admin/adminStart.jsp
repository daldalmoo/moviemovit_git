<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../user/auth.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>adminStart.jsp</title>
</head>
<frameset rows="210, *">
	<frame name="head" src="../header.jsp" scrolling="no" >
	<frameset cols="200,*">
	<frame name="left" src="adminLmenu.jsp" noresize="noresize">
	<frame name="right" src="../user/adminlist.do">
</frameset>
</frameset>
</html>
