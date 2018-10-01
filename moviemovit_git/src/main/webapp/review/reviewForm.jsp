<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%-- 본문시작 starList.jsp --%>
<!-- CSS -->
<link href="../css/rating.css" rel="stylesheet" type="text/css">

<!-- Core JavaScript Files -->
<script src="../js/rating.js"></script>

<style rel="stylesheet">
.header { /* 영화관목록  */
	background-color: #3366cc;
	color: white;
	font-size: 1.5em;
	padding: 1rem;
	text-align: center;
	text-transform: uppercase;
}

.starbox {
	width: 100%;
	height: 160PX;
	max-width: calc(100% - 65em);
	background-color: white;
	box-sizing: content-box;
	margin: 1em auto;
}

.scontainer {
	width: 100px;
	background-color: white;
	margin: auto;
}

/* 0912 찬홍 test */
.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin: center;
}

.star_rating a.on {
	color: #777;
}

/* 별점  0904*/
.table-users {
	border: 1px solid #327a81;
	border-radius: 10px;
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	max-width: calc(100% - 50em);
	margin: 1em auto;
	overflow: hidden;
	width: 100%;
}

table {
	width: 100%;
}

table td, table th {
	color: #2b686e;
	padding: 10px;
}

table td {
	text-align: center;
	vertical-align: middle;
}

table td:last-child {
	font-size: 0.95em;
	line-height: 1.4;
	text-align: center;
}

table th {
	background-color: #bfe1ff;
	font-weight: 300;
	text-align: center;
	font-weight: bold;
}

table tr:nth-child(2n) {
	background-color: white;
}

table tr:nth-child(2n+1) {
	background-color: #bfe1ff;
}

.box-image {
	width: 100%;
	height: 180px;
	/*   max-width: calc(100% - 85em);
 */
	background-color: white;;
	border: 8px solid #3366cc;
	box-sizing: content-box;
	margin: 1em auto;
}

/*공개,수정,삭제 스타일*/
.cbp-mc-button {
	background: #40bf80;
	border: none;
	color: #fff;
	width: auto;
	cursor: pointer;
	text-transform: uppercase;
	display: inline-block;
	padding: 5px 5px;
	font-size: 0.8em;
	border-radius: 2px;
	letter-spacing: 1px;
}

.cbp-mc-button:hover {
	background: #2b8256;
}
</style>


<%
  String uid = (String) session.getAttribute("s_id");
			//out.println("세션확인:" + uid);
			session.setAttribute("uid", uid);

			/* cineCode값 셋팅 및 넘기려고 */
			String cineCode = request.getParameter("cineCode");
			request.setAttribute("cineCode", cineCode);
%>

<div>
	<div>review</div>
</div>






<form name="reviewForm" method="POST" action="./reviewUpdatePro.do">
	<%-- <input type="hidden"  name="cineName" value="${dto.cineName }"> --%>
	<%-- <div class="box-image" >

			       <span class="thumb-image">
			         <img class="mimg" src="img/${dto.logoImg }" width="400" height="800"/>
			       </span>
		      </div> --%>

	<div class="starbox">
		<div style="width: 280PX; height: 150px; float: left;">
			<div class="scontainer">
				화질 <input type="radio" name="pixel" class="rating" value="1" /> <input
					type="radio" name="pixel" class="rating" value="2" /> <input
					type="radio" name="pixel" class="rating" value="3" /> <input
					type="radio" name="pixel" class="rating" value="4" /> <input
					type="radio" name="pixel" class="rating" value="5" />
			</div>
			<div class="scontainer">
				음향 <input type="radio" name="sound" class="rating" value="1" /> <input
					type="radio" name="sound" class="rating" value="2" /> <input
					type="radio" name="sound" class="rating" value="3" /> <input
					type="radio" name="sound" class="rating" value="4" /> <input
					type="radio" name="sound" class="rating" value="5" />
			</div>
			<div class="scontainer">
				좌석 <input type="radio" name="seat" class="rating" value="1" /> <input
					type="radio" name="seat" class="rating" value="2" /> <input
					type="radio" name="seat" class="rating" value="3" /> <input
					type="radio" name="seat" class="rating" value="4" /> <input
					type="radio" name="seat" class="rating" value="5" />
			</div>
			<div class="scontainer">
				매점 <input type="radio" name="snack" class="rating" value="1" /> <input
					type="radio" name="snack" class="rating" value="2" /> <input
					type="radio" name="snack" class="rating" value="3" /> <input
					type="radio" name="snack" class="rating" value="4" /> <input
					type="radio" name="snack" class="rating" value="5" />
			</div>
		</div>
		<div style="width: 150px; height: 150px; float: left;">
			<div class="scontainer">
				청결도 <input type="radio" name="clean" class="rating" value="1" /> <input
					type="radio" name="clean" class="rating" value="2" /> <input
					type="radio" name="clean" class="rating" value="3" /> <input
					type="radio" name="clean" class="rating" value="4" /> <input
					type="radio" name="clean" class="rating" value="5" />
			</div>
			<div class="scontainer">
				서비스 <input type="radio" name="service" class="rating" value="1" />
				<input type="radio" name="service" class="rating" value="2" /> <input
					type="radio" name="service" class="rating" value="3" /> <input
					type="radio" name="service" class="rating" value="4" /> <input
					type="radio" name="service" class="rating" value="5" />
			</div>
			<div class="scontainer">
				편의시설 <input type="radio" name="around" class="rating" value="1" />
				<input type="radio" name="around" class="rating" value="2" /> <input
					type="radio" name="around" class="rating" value="3" /> <input
					type="radio" name="around" class="rating" value="4" /> <input
					type="radio" name="around" class="rating" value="5" />
			</div>

			<div class="scontainer">
				교통 접근성 <input type="radio" name="trans" class="rating" value="1" />
				<input type="radio" name="trans" class="rating" value="2" /> <input
					type="radio" name="trans" class="rating" value="3" /> <input
					type="radio" name="trans" class="rating" value="4" /> <input
					type="radio" name="trans" class="rating" value="5" />
			</div>
		</div>
	</div>



	<!--<input type="text" name="s_e" id="s_e" value="하이하이"/> -->
	<!--<input type="number" name="heart" id="heart" value="486"/>-->
	<!--  지금 페이지에 해당하는 cineCode를 가지고 가려고 -->
	<input type="hidden" name="cineCode" id="cineCode" value="${cineCode }" />
	<input type="text" name="uid" id="uid" value="${uid }" />
  <input type="text" name="no" id="no" value="${rs.no }" />

	<%-- no값 안뜸
  <input type="text" name="no" id="no" value="${no }"/>
   --%>
	<br>
	<!-- <textarea rows="5" cols="50" name="s_e" id="s_e" > 안에 s_e내용가져오려다 포기하고 input</textarea> -->
	<input type="text" name="s_e" id="s_e" value="${rs.s_e }"
		style="width: 500px;">
	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-button" type="submit" value="평점등록" /> <input
			class="cbp-mc-button" type="button" value="뒤로가기" onclick="" />
	</div>

</form>


<script>
	$('.scontainer').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		return false;
	});

	$('.scontainer').rating(function(vote, event) {
		// write your ajax code here
		// For example;
		// $.get(document.URL, {vote: vote});
	});
</script>



<%-- 본문끝 --%>
