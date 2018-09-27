<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="net.utility.Utility"%>
<% //adminAuth.jsp%>
<%
// 관리자 페이지 로그인 상태 확인
String s_admin_id="", s_admin_pw="", s_admin_mlevel="";

if(session.getAttribute("s_admin_id")==null ||
   session.getAttribute("s_admin_pw")==null ||
   session.getAttribute("s_admin_mlevel")==null) {
    //로그인 하지 않았다면
    s_admin_id    ="guest";
    s_admin_pw    ="guest";
    s_admin_mlevel="E1"; //비회원 등급
    String root = Utility.getRoot();  // /myweb
%>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
      <meta charset="UTF-8">
    </head>
    <script>
    function jumpTo() {
    	//로그인하지 않았다면 로그인페이지로 이동
    	window.top.location.href="<%=root %>" + "/adminLogin.jsp";
    }
    </script>
	<body onload="jumpTo()"></body>
	</html>
<%    
}else{
    s_admin_id    =(String)session.getAttribute("s_admin_id");
    s_admin_pw    =(String)session.getAttribute("s_admin_pw");
    s_admin_mlevel=(String)session.getAttribute("s_admin_mlevel");
}//if end
%>



