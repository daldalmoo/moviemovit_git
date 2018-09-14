<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>adminLogin.jsp</title>
</head>
<body>
<div align="center">
<form method="post" action="adminProc.jsp">
<table border=1>
<tr>
  <td colspan=2 align=center>* 관리자페이지 로그인 *</td>
</tr>
<tr>
  <td>아이디</td>
  <td><input type="text" name="adminid" size=20></td>
</tr>
<tr>
  <td>비밀번호</td>
  <td><input type="password" name="adminpw" size=20></td>
</tr>
<tr>
  <td colspan=2 align=center>
    <input type="submit" value="확인">
    <input type="reset"  value="취소">
  </td>
</tr>
</table>
</form>
</div>
</body>
</html>