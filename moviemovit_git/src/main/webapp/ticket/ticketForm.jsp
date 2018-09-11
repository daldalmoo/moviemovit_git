<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 bookForm.jsp : 회원들이 예매하는 폼 --%>

<!-- 통째로 갈아없을꺼임!!!!!!! -->

<head>
<link href="../css/ticketStyle.css" rel="stylesheet" type="text/css">
</head>

<!-- ------------------------------ 소스 복붙 ---------------------------------- -->
<style>

/* UI Object */
#wrap{width:100%}
#header{width:100%}
#container{*display:inline-block;_width /**/:100%;padding-right:200px;padding-left:200px}
#container:after{display:block;clear:both;content:''}
.snb{float:left;position:relative;left:-200px;width:180px;margin-right:-180px}
#content{float:left;width:100%}
.aside{float:left;position:relative;left:200px;width:182px;margin-left:-182px}
#footer{width:100%}

/* Layout Color - 실제 서비스 적용 후 아래 코드는 삭제 하세요 */
div{margin:0 0 10px;padding:10px 0;color:#2d2c2d;font-family:Tahoma;font-size:14px;font-weight:bold}
#wrap{position:relative;width:auto;padding:10px;border:1px solid #bdbdbd;background:#f7f7f7}
#header{width:auto;margin-top:10px;padding:10px;border:2px solid #bfbfbf;background:#e5e5e5}
#container{position:relative;border:2px solid #bfbfbf;background:#e5e5e5}
.snb{left:-190px;width:178px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}
#content{position:relative;height:200px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}
.aside{left:190px;width:178px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}
#footer{clear:both;width:auto;padding:10px;border:2px solid #bfbfbf;background:#e5e5e5}
/* //UI Object */
</style>

<!--ui object -->
<div id="wrap">
<p>#wrap</p>
<!--header -->
<div id="header">
<p>#header</p>
</div>
<!--//header -->
<!--container -->
<div id="container">
<p>#container</p>
<!--snb -->
<div class="snb">
<p>.snb</p>
</div>
<!--//snb -->
<!--content -->
<div id="content">
<p>#content</p>
</div>
<!--//content -->
<!--aside -->
<div class="aside">
<p>.aside</p>
</div>
<!--//aside -->
<div class="clear">
</div>
</div>
<!--//container -->
<!--footer -->
<div id="footer">
<p>#footer</p>
</div>
<!--//footer -->
</div>
<!--//ui object -->

<!-- ------------------------------ 소스 복붙 ---------------------------------- -->

<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do' onsubmit="return couponCheck(this)">
  <span style="color: red; font-weight: bold">* 필수입력</span><br>
  
  <table class="cbp-mc-column">
  <tr>
    <th>* 회원 아이디</th>
    <td>
      <input type="text" id="uid" name="uid" placeholder="검색하여 입력하세요 =>" required readonly> &nbsp;
      <input class="cbp-mc-button" type="button" value="ID검색" onclick="openPopup(this.form);">
    </td>
  </tr>
  <tr>
    <th>쿠폰 발행 날짜</th>
    <td>
      <input type="date" id="startDate" name="startDate" value=${startDate }>
    </td>
  </tr>
  <tr>
    <th>쿠폰 만료 날짜</th>
    <td>
      <input type="date" id="expDate" name="expDate" value=${expDate }>
    </td>
  </tr>
  </table>
  
  <br>
  <!-- 하단 버튼 -->
  <div class="cbp-mc-submit-wrap">
    <input class="cbp-mc-submit" type="submit" value="등록" />
    <input class="cbp-mc-submit" type="reset" value="다시입력" />
    <input class="cbp-mc-submit" type="button" value="취소" onclick="javascript:history.back()" />
  </div>
  
</form>


<script>
function openPopup(frm){
  //사용자 모니터 해상도 값
  var sx=parseInt(screen.width);
  var sy=parseInt(screen.height);
  var x=sx/3;
  var y=sy/2;
  
  // 팝업창 오픈 및 위치 이동
  var url = "uidSearch.do";
  var win=window.open(url,"uidSearch","width="+x+",height="+y);
  var movex = x;
  var movey = y/3;
  win.moveTo(movex, movey);
}

// 쿠폰 등록 전 유효성 검사
function couponCheck(f) {
  // 회원아이디 글자갯수가 5~10 사이인지?
  var uid = f.uid.value;
  uid = uid.trim(); //공백 지우기
  
  if(uid.length<5 || uid.length>10) {
   alert("아이디를 확인해주세요.");
   f.uid.value="";  //초기화
   f.uid.focus();   //커서 생성
   return false;
  }//if end
  
  return true;  // 유효성 검사 모두 통과
}//couponCheck
</script>


<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>