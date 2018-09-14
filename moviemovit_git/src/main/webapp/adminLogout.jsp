<%@ page contentType="text/html; charset=UTF-8"%> 
<%
	//adminLogout.jsp
	session.removeAttribute("s_admin_id");
	session.removeAttribute("s_admin_pw");
	session.removeAttribute("s_admin_mlevel");
%>
<script>
	alert("관리자 페이지 로그아웃!");
	location.href="adminLogin.jsp";
</script>