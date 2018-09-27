<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../user/auth.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//adminLogout.jsp
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	session.removeAttribute("s_grade");
%>
<script>
	alert("관리자 페이지 로그아웃!");
	location.href="../index.do";
</script>
<%-- <c:remove var="uid" scope="session"/> --%>
