<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
  <tr>
    <th>회원 ID</th>
    <th>선택</th>
  </tr>
  
  <c:forEach var="uid" items="${resultList }">
    <tr>
      <td>${uid }</td>
      <td><input class="selectbutton" type='button' value='V'></td>
    </tr>
  </c:forEach>
</table>


<!-- jquery.js import -->
<script src="../js/jquery.js"></script>
<script>
/* 버튼 누르면 uid 값 가져와서 부모창에 입력하고 창 닫기 */
$(".selectbutton").click(function(){
  // 해당 줄의 uid 값 가져오기
  var uid = $(this).parent().prev().text();
  //alert(uid);
  
  // 부모창에 uid 입력
  opener.document.getElementById("uid").value = uid;
  window.close();
});
</script>