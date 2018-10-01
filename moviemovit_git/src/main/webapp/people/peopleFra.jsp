<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>adminStart.jsp</title>
</head>
<frameset rows="210, *">
	<frame name="head" src="../header.jsp" scrolling="no" style="text-align:center">
	<frameset cols="200,*">
	<frame name="left" src="../admin/adminLmenu.jsp" noresize="noresize">
	<frame name="right" src="peoList.do">
</frameset>
</frameset>
</html>