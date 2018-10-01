<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header1.jsp"%>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
.home-section{
padding-top:0px;}
</style> 
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
<div class="home-section text-center ">
<div class="title">QnA</div>
<form method="post" action="./admindelete.do">
	<input type="hidden" name="qCode" value="${dto.qCode }">
	<div class="content">
		<p>QnA 글을 삭제하시겠습니까?</p>
	</div>
	<div class="bottom">
		<input class="cbp-mc-submit" type="submit" value="삭제">
		<input class="cbp-mc-submit"type="button" value="목록" onclick="location.href='./adminlist.do'">
	</div>
</form>
</div>
</body>