<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- 통째로 갈아없을꺼임!!!!!!! -->

<head>

<!-- <link href="../css/ticketForm_content.css" rel="stylesheet" type="text/css"> -->

</head>

<!-- ------------------------------ 소스 복붙 ---------------------------------- -->
<style>
#container {
  *display: inline-block;
  _width: 100%;
  padding: 0px 200px 50px 200px;
}

#container:after {
  display: block;
  clear: both;
  content: '';
}

.movie_area {
  float: left;
  position: relative;
  left: -200px;
  width: 180px;
  margin-right: -180px;
}

#cinema_area {
  float: left;
  width: 60%
}

.aside {
  float: left;
  position: relative;
  left: 200px;
  width: 150px;
  margin-left: -182px;
}

/* Layout Color - 실제 서비스 적용 후 아래 코드는 삭제 하세요 */
#container {
  position: relative;
  margin: 10px 20px;
  border: 2px solid #bfbfbf;
  background: #e5e5e5
}

.movie_area {
  left: -190px;
  width: 400px;
  height: 200px;
  margin-top: 10px;
  border: 1px solid #bdbdbd;
  background: #fff;
  text-align: left
}

#cinema_area {
  position: relative;
  height: 200px;
  margin-top: 10px;
  border: 1px solid #bdbdbd;
  background: #fff;
  text-align: center
}

.aside {
  left: 190px;
  width: 400px;
  height: 200px;
  margin-top: 10px;
  border: 1px solid #bdbdbd;
  background: #fff;
  text-align: center
}

#screentime_area {
  position: relative;
  height: 200px;
  width: 96%;
  margin-top: 245px;
  left: -190px;
  border: 1px solid #bdbdbd;
  background: #fff;
  text-align: center
}

.rbottom {
  margin-left: 910px;
  width: 400px;
  height: 200px;
  margin-top: -200px;
  border: 1px solid #bdbdbd;
  background: #fff;
  text-align: center
}

.movieinfo {
  position: relative;
  left: -190px;
  width: 132%;
  height: 200px;
  margin-top: 15px;
  border: 1px solid #bdbdbd;
  background: #fff;
  text-align: center
}

/*********** 예매 view 페이지 css ***********/
/*********** 1) 영화선택 ***********/
.lst_movie {
  overflow: hidden;
  width: 266px;
  padding: 5px 0 6px;
}

.movie_area h2 {
  margin: 0px;
  padding: 0px;
}

ul li {
  list-style: none;
}

.lst_movie li {
  height: 18px;
  padding: 7px 0 0 9px;
  font-weight: bold;
  color: black;
  vertical-align: top;
  white-space: nowrap;
  margin-top: 5px;
}

.movie_area .movie_areaTitle {
  background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%);
  font-size: 12pt;
  font-weight: bold;
  color: white;
  text-align: center;
}

/*********** 2) 극장선택 ***********/
#cinema_area .cinema_title { /* 극장선택 타이틀 & 검색 부분 div */
  background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%);
}
#cinema_area .cinema_title span { /* 극장선택 글씨 */
  font-size: 12pt;
  font-weight: bold;
  color: white;
}
#cinema_area .cinema_title .refreshbtn { /* 새로고침 버튼 */
  position: relative;
  top: 12px;
  transform: translateY(-50%);
}
#cinema_area .cinema_title .searchbtn { /* 검색 버튼 */
  position: relative;
  top: 13.5px;
  transform: translateY(-50%);
}

#cinema_area .cinema_select { /* 극장선택 타이틀 & 검색 부분 div */
  ;
}
#cinema_area .cinema_select ul { /* 극장종류 리스트 */
  background: linear-gradient(to top, #e4e4e8 0%, #f3f3f4 100%);
  list-style: none;
  font-weight: bold;
  padding: 0px;
  margin: 0px;
}
#cinema_area .cinema_select ul li {
  display: inline;      /* 리스트를 가로로 */
  font-size: 10pt;
  font-weight: bold;
  letter-spacing: 1px;  /* 글자간격 */
  text-align: center;
  float: center;
  border-left: 1px solid #bcbcbc;
  padding-left: 1pt;
  padding-right: 1pt;
}
#cinema_area .cinema_select ul li:first-child {
  border-left: none;
}
#cinema_area .cinema_select ul li a {
  text-decoration: none;
  color: #4e5073;
}
#cinema_area .cinema_select ul li a:hover {
  color: #222538;
}
#cinema_area .cinema_select ul li .on {
  background-color: white;
  border: 1px solid #bcbcbc;
}
#cinema_area .cinema_select ul li span {
  margin-left: 5px;
}

#cinema_area .cinema_addr1 {  /* 극장의 대분류주소 선택 div */
  text-align: left;
  border-bottom: 2px dotted;
}
#cinema_area .cinema_addr1 ul { /* 극장종류 리스트 */
  list-style: none;
  margin: 0px;
  padding: 0px;
  padding-left: 15pt;
}

#cinema_area .cinema_list {  /* 극장의 대분류주소 선택 div */
  text-align: left;
}
#cinema_area .cinema_list ul { /* 극장 리스트 */
  list-style: none;
  margin: 0px;
  padding: 0px;
  padding-left: 15pt;
  font-size: 10pt;
}


/*********** 3) 날짜선택 ***********/




/*********** 4) 상영시간선택 ***********/
#screentime_area .screentime_title { /* 상영시간표 타이틀 부분 div */
  background: linear-gradient(to top, #e4e4e8 0%, #f3f3f4 100%);
  text-align: left;
  font-size: 10pt;
  font-weight: bold;
  padding-left: 10px;
  padding-top: 3px;
  padding-bottom: 2px;
}
#screentime_area .screentime_title .select { /* 상영시간표 타이틀 부분 div - 영화극장날짜 선택되면 */
  background: linear-gradient(to top, #3b3d58 0%, #5d607d 100%);
}
#screentime_area .cinemainfo {
  border-bottom: 1px;
  border-color: gray;
  width: 100%;
}
#screentime_area .cinemainfo_logo_empty {
  position: absolute;
  top: 25%;
  left: 3%;
  width: 55px;
  height: 45px;
  border: 1px solid #000;
  background-color: gray;
  opacity: .1;
  filter: alpha(opacity=10);
}
#screentime_area .screentime {
  top: 50%;
}


</style>

<form class="cbp-mc-form" name="regForm" method='POST'
	action='./create.do' onsubmit="return couponCheck(this)">

  <!--container -->
  <div id="container">
    <p>#container</p>

    
    <!-- -------------------------- movie_area : 영화선택  ----------------------------- -->
	<div class="movie_area">
		<h2>
			<p class="movie_areaTitle">영화선택</p>
		</h2>
		<ul id="1st_movie">
			<c:forEach var="movie" items="${movieList }">
				<li id="SelMovieList" value="${movie.mCode }">
					<a href="javascript:void(0);" onclick="SelMovieList(${movie.mCode})">${movie.mName }</a>
				</li>
			</c:forEach>
		</ul>
		<!-- 
			<select id="1st_movie" size="10">
			<c:forEach var="movie" items="${movieList }">
				<c:set var="mName" value="${movie.mName }" />
				<c:set var="mCode" value="${movie.mCode }" />
				<option id="mCode" value="${mCode }">${mName }</option>
			</c:forEach>	
			</select>
		 -->	
	</div>
	  <!-- -------------------------- movie_area : 영화선택 end -------------------------- -->
    
    
    <!-- ------------------------------ cinema_area : 극장선택 ------------------------------ -->
    <div id="cinema_area">
      <div class="cinema_title">
        <span>극장선택</span>
        <input type="image" class="refreshbtn" src="./img/refresh_btn.gif" alt="새로고침" onclick="javascript:ResetSelTheaterList('0');nclk(this, 'the.ref', '', 1)">
        <input type="text" id="txtTheater" title="극장검색" class="search">
        <input type="image" class="searchbtn" src="./img/btn_search.gif" alt="검색" onclick="javascript:TheaterSearchBtnClick();nclk(this, 'the.enter', '', 1);">
      </div>
      
      <div class="cinema_select">
        <!-- 활성화시 class 'on' -->
        <ul class="tab_menu">
          <li class="t_tab1">
            <a href="javascript:TabTheaterMode('1',0);" onclick="nclk(this, 'the.all', '', 1)" class="on">
              <span>전체극장</span>
            </a>
          </li>
          <li class="t_tab2">
            <a href="javascript:TabTheaterMode('1',1);" onclick="nclk(this, 'the.play', '', 1)" class="">
              <span>상영극장</span>
            </a>
          </li>
          <li class="t_tab3">
            <a href="javascript:TabTheaterMode('1',2);" onclick="nclk(this, 'the.chain', '', 1)" class="">
              <span>체인별</span>
            </a>
          </li>
        </ul>
      </div>
      
      <div class="cinema_addr1">
        <ul>
          <li>
            <span id="cinema_list_addr1">
              <a href="javascript:moreArea();" onclick="nclk(this, 'the.loc', '', 1);" class="">서울(<strong>5</strong>)
                <img src="./img/listbtn1.gif">
              </a>
            </span>
          </li>
        </ul>
      </div>
        
      <div class="cinema_list">
        <ul>
          <c:forEach var="cine" items="${cinelist }">
            <li>
              <a href="#">
                <input type="hidden" name="cineCode" value="${cine.cineCode }">
                <c:choose>
                  <c:when test="${cine.brandName == 'CGV' }">CGV</c:when>
                  <c:when test="${cine.brandName == 'LOTTE' }">롯데시네마</c:when>
                  <c:when test="${cine.brandName == 'MEGABOX' }">메가박스</c:when>
                  <c:when test="${cine.brandName == 'INDEP' }">독립영화관</c:when>
                </c:choose>
                - ${cine.cineName}
              </a>
            </li>
          </c:forEach>
        </ul>
      </div>
        
        
        
    </div>
    <!-- ------------------------------ cinema_area : 극장선택 end ------------------------------ -->
    
    
    <!--aside -->
    <div class="aside">
      <p>날짜선택</p>
    </div>
    <!-- aside end -->
    
    
    <!-- screentime_area : 상영시간선택 -->
    <div id="screentime_area">
      <div class="screentime_title">
        <span style="font-size: 12pt;">상영시간표</span>
        <input type="image" src="./img/screentimeicon.PNG" style="height:9px; margin-bottom:1px;">
        <span style="color:red;">영화/극장/날짜</span>
        <span> 를 선택해주세요</span>
      </div>
      <div class="cinemainfo">
        <span class="cinemainfo_logo_empty"></span>
        <span class="cinemainfo_name"></span>
      </div>
      <div class="screentime">
        - 관
      </div>
    </div>
    <!-- screentime_area : 상영시간선택 end -->
    
    
    <!-- rbottom -->
	  <div class="rbottom">
    	<p>인원선택</p>
   	</div>
    <!-- rbottom end -->
    
    
	  <!-- movieinfo -->
	  <div class="movieinfo">
		  <p>영화정보</p>
	  </div>
	  <!-- movieinfo end -->

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

<!-- --------------------- 예매하기 AJAX ----------------------- -->	
<script src="js/jquery.js"></script>
<script>

//영화선택
function SelMovieList(mCode) {
	//해당 영화를 상영하는 극장 출력
	$.post("./cinelist.do",mCode,cinelist);
};//SelMovieList() end

function theaterNameList(data) {
	alert("data");
}//theaterNameList() end



</script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>