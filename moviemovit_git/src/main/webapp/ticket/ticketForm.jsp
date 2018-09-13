<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- 통째로 갈아없을꺼임!!!!!!! -->

<head>
<!-- <link href="../css/ticketForm_content.css" rel="stylesheet" type="text/css"> -->
</head>

<!-- ------------------------------ 소스 복붙 ---------------------------------- -->
<style>
#container{*display:inline-block; _width:100%; padding:0px 200px 50px 200px;}
#container:after{display:block; clear:both; content:'';}
.snb{float:left; position:relative; left:-200px; width:180px; margin-right:-180px;}
#content{float:left; width:60%}
.aside{float:left; position:relative; left:200px; width:150px; margin-left:-182px;}

/* Layout Color - 실제 서비스 적용 후 아래 코드는 삭제 하세요 */
#container{position:relative; margin: 10px 20px; border:2px solid #bfbfbf;background:#e5e5e5}

.snb{left:-190px;width:400px;height:200px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}

#content{position:relative;height:200px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}

.aside{left:190px;width:400px;height:200px;margin-top:10px;border:1px solid #bdbdbd;background:#fff;text-align:center}

/*경민*/
.bottom {position:relative;height:200px;width:96%;margin-top:245px; left:-190px;border:1px solid #bdbdbd;background:#fff;text-align:center}

.rbottom{margin-left:910px;width:400px;height:200px;margin-top:-200px;border:1px solid #bdbdbd;background:#fff;text-align:center}

.movieinfo{position:relative;left:-190px;width:132%;height:200px;margin-top:15px;border:1px solid #bdbdbd;background:#fff;text-align:center}



/* 신혜 */
#content .theater_area {  /* 극장선택 타이틀 & 검색 부분 div */
  background:linear-gradient(to top, #3b3d58 0%, #5d607d 100%);
}
#content .theater_area .contentTitle {  /* 극장선택 글씨 */
  font-size:12pt;
  font-weight:bold;
  color:white;
}
#content .theater_area .refreshbtn {  /* 새로고침 버튼 */
  position:relative;
  top:12px;
  transform:translateY(-50%);
}
#content .theater_area .searchbtn {  /* 검색 버튼 */
  position:relative;
  top:13.5px;
  transform:translateY(-50%);
}

</style>

<form class="cbp-mc-form" name="regForm" method='POST' action='./create.do' onsubmit="return couponCheck(this)">

  <!--container -->
  <div id="container">
    <p>#container</p>
    
    <!--snb -->
    <div class="snb">
      <p>영화선택</p>
    </div>
    <!-- snb end -->
    
    
    <!-- ------------------------------ content : 극장선택 ------------------------------ -->
    <div id="content">
      <div class="theater_area">
        <span class="contentTitle">극장선택</span>
        <input type="image" class="refreshbtn" src="./img/refresh_btn.gif" alt="새로고침" onclick="javascript:ResetSelTheaterList('0');nclk(this, 'the.ref', '', 1)">
        <input type="text" id="txtTheater" title="극장검색" class="search">
        <input type="image" class="searchbtn" src="./img/btn_search.gif" alt="검색" onclick="javascript:TheaterSearchBtnClick();nclk(this, 'the.enter', '', 1);">
      </div>
        
        
        <!-- [D] 활성화시 a class 'on' -->
        <!-- <ul id="t_tab_menu" class="tab_menu">
          <li class="t_tab">
            <a href="javascript:TabTheaterMode('1', 0);" onclick="nclk(this, 'the.all', '', 1)" title="전체극장" class="on">
              <span class="blind">전체극장</span>
            </a>
          </li>
          <li class="t_tab2">
            <a href="javascript:TabTheaterMode('1',1);" onclick="nclk(this, 'the.play', '', 1)" title="상영극장" class="">
              <span class="blind">상영극장</span>
            </a>
          </li>
          <li class="t_tab3">
            <a href="javascript:TabTheaterMode('1',2);" onclick="nclk(this, 'the.chain', '', 1)" title="체인별" class="">
              <span class="blind">체인별</span>
            </a>
          </li>
        </ul> -->
        
    </div>
    <!-- ------------------------------ content : 극장선택 end ------------------------------ -->
    
    
    <!--aside -->
    <div class="aside">
      <p>날짜선택</p>
    </div>
    <!-- aside end -->
    
    <!-- bottom -->
    <div class="bottom">
    	<p>상영시간표</p>
    </div>
    <!-- bottom end -->
    
    <!-- rbottom -->
	<div class="rbottom">
    	<p>인원선택</p>
   	</div>
    <!-- rbottom end -->

    <!-- rside -->
    <div class="movieinfo">
    	<p>영화정보</p>
    </div>
    <!-- rside end -->

  </div>
  <!-- container end -->

  <br>
</form>
  <!-- 예매 버튼 -->
  <div class="cbp-mc-submit-wrap">
    <input class="cbp-mc-submit" type="submit" value="예매" />
    <input class="cbp-mc-submit" type="reset" value="다시입력" />
    <input class="cbp-mc-submit" type="button" value="취소" onclick="javascript:history.back()" />
  </div>


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