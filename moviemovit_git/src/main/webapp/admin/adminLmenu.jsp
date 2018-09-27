<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../user/auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<meta charset="UTF-8">
<title>adminLmenu.jsp</title>
<style>
a:link    { text-decoration:none; color:black;}
a:visited { text-decoration:none; color:black;}
a:hover   { text-decoration:underline; color:blue;}
a:active  { text-decoration:underline; color:black;}
</style>
</head>
<body>
 <div align="center"> 
 <i class="fa fa-cogs fa-3x" aria-hidden="true"></i>
 <br/>
 <table width="100%">
  <tr>
    <td align=center><strong>관 / 리 / 자 / 메 / 뉴</strong></td>
  </tr>
  <tr>
    <td height=3 bgcolor=#808080></td>
  </tr>
  <tr>
    <td align="right"><a href="adminLogout.jsp" target="_top">로그아웃</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="../notice/noticeFra.jsp" target="sub"><i class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 공지사항</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="../qna/qnaFra.jsp" target="sub"><i class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 문의</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="../user/userFra.jsp" target="sub"><i class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 회원</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="../movie/movieFra.jsp" target="_blank"><i class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 영화</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="" target="_blank"><i class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 영화관</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  </table>
</div>  
</body>
</html>