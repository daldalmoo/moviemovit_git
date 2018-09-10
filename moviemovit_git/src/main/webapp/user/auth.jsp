<%@ page contentType="text/html; charset=UTF-8"%> 
<%
	//loginForm의 모양은 로그인의 유무에 따라 달라진다
	//이를 판단하는 기준은 session의 값!
	//항상 갖고다녀야하는 부분이기때문에 공통페이지로 include하기!
	
	//auth.jsp 로그인 상태 확인
	String s_id="", s_passwd = "", s_grade="";

	if(session.getAttribute("s_id")==null ||
	   session.getAttribute("s_passwd")==null || 
	   session.getAttribute("s_grade") == null) {
	  //로그인 하지 않았을 때(OR 연산자 쓰는게 좋음)
	  
	  //※회원가입시 'guest'라는 글자는 못쓰도록 js에서 처리해줘야함!
	  s_id = "guest";
	  s_passwd = "guest";
	  s_grade = "guest";
	}else {
	  //로그인 했을 때(AND 연산자 쓰는게 좋음)
	  s_id = (String)session.getAttribute("s_id");
	  s_passwd = (String)session.getAttribute("s_passwd");
	  s_grade = (String)session.getAttribute("s_grade");
	}//if end
	
%>