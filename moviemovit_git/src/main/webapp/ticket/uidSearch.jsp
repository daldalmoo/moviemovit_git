<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../user/auth.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>회원 아이디 검색</title>

<!-- CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
  type="text/css">
<link href="../css/nivo-lightbox.css" rel="stylesheet" />
<link href="../css/nivo-lightbox-theme/default/default.css"
  rel="stylesheet" type="text/css" />
<link href="../css/owl.carousel.css" rel="stylesheet" media="screen" />
<link href="../css/owl.theme.css" rel="stylesheet" media="screen" />
<link href="../css/animate.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet">
<link href="../color/default.css" rel="stylesheet">

<!-- Core JavaScript Files -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.easing.min.js"></script>
<script src="../js/jquery.sticky.js"></script>
<script src="../js/jquery.scrollTo.js"></script>
<script src="../js/stellar.js"></script>
<script src="../js/wow.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/nivo-lightbox.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../js/custom.js"></script>
<script src="../contactform/contactform.js"></script>

<script src="../js/script.js"></script>
<script src="../js/script_sh.js"></script>

<style type="text/css">
body{
  font-family:Arial, Helvetica, sans-serif;
  margin: auto;
  text-align: center;
}

/* search -------------------------------------- */
.searchform {
  display: inline-block;
  zoom: 1; /* ie7 hack for display:inline-block */
  *display: inline;
  border: solid 1px #d2d2d2;
  padding: 3px 5px;
  margin: auto;
  margin-top: 5%;
  
  -webkit-border-radius: 2em;
  -moz-border-radius: 2em;
  border-radius: 0.5em;

  -webkit-box-shadow: 0 1px 0px rgba(0,0,0,.1);
  -moz-box-shadow: 0 1px 0px rgba(0,0,0,.1);
  box-shadow: 0 1px 0px rgba(0,0,0,.1);

  background: #f1f1f1;
  background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
  background: -moz-linear-gradient(top,  #fff,  #ededed);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed'); /* ie7 */
  -ms-filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed'); /* ie8 */
}
.searchform input {
  font: normal 12px/100% Arial, Helvetica, sans-serif;
}
.searchform .searchfield {
  background: #fff;
  padding: 6px 6px 6px 8px;
  width: 202px;
  border: solid 1px #bcbbbb;
  outline: none;
  text-align: center;

  -webkit-border-radius: 2em;
  -moz-border-radius: 2em;
  border-radius: 0.5em;

  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,.2);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,.2);
  box-shadow: inset 0 1px 2px rgba(0,0,0,.2);
}
.searchform .searchbutton {
  color: #fff;
  border: solid 1px #494949;
  font-size: 11px;
  height: 27px;
  width: 40px;
  text-shadow: 0 1px 1px rgba(0,0,0,.6);

  -webkit-border-radius: 2em;
  -moz-border-radius: 2em;
  border-radius: 2em;

  background: #5f5f5f;
  background: -webkit-gradient(linear, left top, left bottom, from(#9e9e9e), to(#454545));
  background: -moz-linear-gradient(top,  #9e9e9e,  #454545);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#9e9e9e', endColorstr='#454545'); /* ie7 */
  -ms-filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#9e9e9e', endColorstr='#454545'); /* ie8 */
}


/* table -------------------------------------- */
table a:link {
  color: #666;
  font-weight: bold;
  text-decoration:none;
}
table a:visited {
  color: #999999;
  font-weight:bold;
  text-decoration:none;
}
table a:active,
table a:hover {
  color: #bd5a35;
  text-decoration:underline;
}
table {
  font-family:Arial, Helvetica, sans-serif;
  color:#666;
  font-size:12px;
  text-shadow: 1px 1px 0px #fff;
  background:#eaebec;
  border:#ccc 1px solid;
  margin: auto;
  margin-top: 10px;
  width: 250px;

  -moz-border-radius:3px;
  -webkit-border-radius:3px;
  border-radius:3px;

  -moz-box-shadow: 0 1px 2px #d1d1d1;
  -webkit-box-shadow: 0 1px 2px #d1d1d1;
  box-shadow: 0 1px 2px #d1d1d1;
}
table th {
  padding:15px;
  border-top:1px solid #fafafa;
  border-bottom:1px solid #e0e0e0;
  color: black;
  text-align: center;

  background: #ededed;
  background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
  background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child{
  padding-left:20px;
}
table tr:first-child th:first-child{
  -moz-border-radius-topleft:3px;
  -webkit-border-top-left-radius:3px;
  border-top-left-radius:3px;
}
table tr:first-child th:last-child{
  -moz-border-radius-topright:3px;
  -webkit-border-top-right-radius:3px;
  border-top-right-radius:3px;
}
table tr{
  text-align: center;
  padding-left:20px;
}
table tr td:first-child{
  text-align: left;
  padding-left:20px;
  border-left: 0;
}
table tr td {
  padding:12px;
  border-top: 1px solid #ffffff;
  border-bottom:1px solid #e0e0e0;
  border-left: 1px solid #e0e0e0;
  
  background: #fafafa;
  background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
  background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr:nth-child(2n+1) td {
  background: #f6f6f6;
  background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
  background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);    /* 테이블 격줄마다 색상*/
}
table tr:last-child td{
  border-bottom:0;
}
table tr:last-child td:first-child{
  -moz-border-radius-bottomleft:3px;
  -webkit-border-bottom-left-radius:3px;
  border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
  -moz-border-radius-bottomright:3px;
  -webkit-border-bottom-right-radius:3px;
  border-bottom-right-radius:3px;
}
table tr:hover td{
  background: #f2f2f2;
  background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
  background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);  
}
table input.selectbutton {
  color: #4c4c4c;
  border: solid 1px #494949;
  font-size: 13px;
  height: 23px;
  width: 30px;
  text-shadow: 0 1px 1px rgba(0,0,0,.6);

  -webkit-border-radius: 2em;
  -moz-border-radius: 2em;
  border-radius: 0.3em;

  background: #cacaca;
  background: -webkit-gradient(linear, left top, left bottom, from(#cacaca), to(#cacaca));
  background: -moz-linear-gradient(top,  #cacaca,  #cacaca);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#cacaca', endColorstr='#cacaca'); /* ie7 */
  -ms-filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#cacaca', endColorstr='#cacaca'); /* ie8 */
}
</style>

</head>

<body>

<form>

<div class="searchform">
  <input class="searchfield" type="text" value="ID 입력" onfocus="if (this.value == 'ID 입력') {this.value = '';}" onblur="if (this.value == '') {this.value = 'ID 입력';}" />
  <input class="searchbutton" type="button" value="검색" />
</div>

<div id="resulttable">
  <table>
    <tr>
      <th>회원 ID</th>
      <th>선택</th>
    </tr>
    
    <c:forEach var="uid" items="${list }">
      <tr>
        <td>${uid }</td>
        <td><input class="selectbutton" type='button' value='V'></td>
      </tr>
    </c:forEach>
  </table>
</div>

</form>


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

/* uid 검색 Ajax로 구현
 * (구버전? 잘 안쓴대서 다음 테이블은 잘 쓰는 방식으로 바꿀 예정)
 * String 자료형의 limit 값이 어느정돈지 몰라서 html 방식으로 받아옴
 * (+ String 길이제한이 매우 크므로 다음엔 text 방식으로 받아올 예정)
 */
$(".searchfield").keyup(function () {
  var searchfield = $(this).val();  // 입력된 검색값 가져오기
  //alert(searchfield);
  
  $.ajax({
    type: "POST",
    cache: false,
    url: "uidresult.do",
    dataType: "html",
    data: {  // 에디터박스의 데이터를 보내준다.  여러개 보낼때 , 
      searchfield: $('.searchfield').val()
    },//data end
    success: function(data) {  // DB 처리 성공 시 수행 내용 작성
      //alert("ajax 성공\n"+data);  // couponCont.java에서 out.println(resultList); 했던거 data로 받아옴
      
      $("#resulttable").html(data); // .html page 자체를 받아서 <div id="resulttable"></div>에 출력
      return true;
    },//success end
    error: function(request,status,error){  // 실패 시 수행 내용
      alert("ajax 실패\n"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      return false;
    }//error end
  });//ajax end
});//keyup end

</script>


</body>

</html>
