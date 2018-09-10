<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- session 값 제거 -->
<c:remove var="uid" scope="session"/>
<meta http-equiv="refresh" content="0;url=/myweb/member2/loginForm.do">