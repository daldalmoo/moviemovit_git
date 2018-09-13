<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 ticketForm.jsp : 회원들이 예매하는 폼 --%>

<!-- 통째로 갈아없을꺼임!!!!!!! -->

<head>
<!-- <link href="../css/ticketStyle.css" rel="stylesheet" type="text/css"> -->

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

#content {
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

#content {
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

/*경민*/
.bottom {
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

/*예매 view 페이지 css*/
/*1) 영화선택*/
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

.blind {
	height: 30px;
	padding: 0 0 0 0px;
	font-weight: bold;
	color: white;
	vertical-align: top;
	white-space: nowrap;
	background-color: black;
	text-align: center;
	margin: 0 0 15px;
}

/* 3) 날짜선택*/
</style>

<form class="cbp-mc-form" name="regForm" method='POST'
	action='./create.do' onsubmit="return couponCheck(this)">

	<!--container -->
	<div id="container">
		<p>#container</p>

		<!--영화선택 -->
		<div class="movie_area">
			<h2>
				<p class="blind">영화선택</p>
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
		<!-- snb end -->

		<!--content -->
		<div id="content">
			<h2>
				<p class="blind">극장선택</p>
			</h2>
			<ul class="2nd_theater">
				<li id="theater"></li>
			</ul>

		</div>
		<!-- content end -->

		<!--aside -->
		<div class="aside">
			<h2>
				<p class="blind">날짜선택</p>
			</h2>

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

<!-- --------------------- 예매하기 AJAX ----------------------- -->	
<script src="js/jquery.js"></script>
<script>

//영화선택
function SelMovieList(mCode) {
	//해당 영화를 상영하는 극장 출력
	$.post("./theaterNameList.do",mCode,theaterNameList);
};//SelMovieList() end

function theaterNameList(data) {
	alert("data");
}//theaterNameList() end

</script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>