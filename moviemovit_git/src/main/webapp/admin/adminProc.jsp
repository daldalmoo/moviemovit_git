<%-- <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../member/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>adminProc.jsp</title>
</head>
<body>
	<div style="text-align: center;">
	* 관리자페이지 로그인 결과 *<br>
<%
	String adminid=request.getParameter("adminid").trim();
	String adminpw=request.getParameter("adminpw").trim();
	
	dto.setId(adminid);
	dto.setPasswd(adminpw);
	
	String mlevel = dao.loginProc(dto);
	
	if(mlevel==null) {
	  out.println("<p>아이디와 비밀번호를 다시 확인해 주세요!</p>");
	  out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else {
	  //로그인 성공을 하더라도 A1, B1 등급만 관리자페이지 입장 가능
	  if(mlevel.equals("A1") || mlevel.equals("B1")) {
	    session.setAttribute("s_admin_id", adminid);
	    session.setAttribute("s_admin_pw", adminpw);
	    session.setAttribute("s_admin_mlevel", mlevel);
	    response.sendRedirect("adminStart.jsp");      
	  }else if(mlevel.equals("C1") || mlevel.equals("D1")){
		  out.println("<p>등업 후 로그인 가능합니다!</p>");
		  out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	  }else {
		  out.println("<p>관리자 페이지 입장 불가!</p>");
		  out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	  }//if end
	}//end
%>
	</div>
</body>
</html> --%>