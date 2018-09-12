<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- 통째로 갈아없을꺼임!!!!!!! -->

<head>
<!-- <link href="../css/ticketStyle.css" rel="stylesheet" type="text/css"> -->
</head>

<!-- ------------------------------ 소스 복붙 ---------------------------------- -->
<style>
#container{*display:inline-block; _width:100%; padding:0px 200px 50px 200px;}
#container:after{display:block; clear:both; content:'';}
.snb{float:left; position:relative; left:-200px; width:180px; margin-right:-180px;}
#content{float:left; width:100%}
.aside{float:left; position:relative; left:200px; width:182px; margin-left:-182px;}

/* Layout Color - 실제 서비스 적용 후 아래 코드는 삭제 하세요 */
#container{position:relative; margin: 10px 20px; border:2px solid #bfbfbf;background:#e5e5e5}
.snb{left:-190px;width:178px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}
#content{position:relative;height:200px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}
.aside{left:190px;width:178px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}
</style>


<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do' onsubmit="return couponCheck(this)">

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
  </div>
  <!--//container -->

  <br>
  <!-- 예매 버튼 -->
  <div class="cbp-mc-submit-wrap">
    <input class="cbp-mc-submit" type="submit" value="예매" />
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
</script>


<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>