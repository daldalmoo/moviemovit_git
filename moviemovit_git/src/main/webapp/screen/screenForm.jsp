<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>

<%-- head 에 들어가는 태그 (link, style, meta 등) 여기 추가  --%>
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>
/*180827 경민 list 클래스 추가*/
.list {
	text-align: left;
	padding: 10px;
	margin: auto;
}
</style>

<%@ include file="../header2.jsp"%>
<%-- 본문시작 screenForm.jsp --%>

<form class="cbp-mc-form" id="screenForm" name="screenForm" method="post" action="./screeninsert.do">
	<span style="font-weight: bold">상영시간 등록</span><br>

	<!-- 상영시간 등록 폼 -->
	<table class="cbp-mc-column">
		<tr>
			<th>*영화관 브랜드</th>
			<td class="list">
				<select id="brandName" name="brandName">
					<option value="0">선택하세요</option>
					<option value="CGV">CGV</option>
					<option value="LOTTE">롯데시네마</option>
					<option value="MEGABOX">메가박스</option>
					<option value="INDEP">독립영화관</option>
				</select> 
			</td>
		</tr>
		<tr>
			<th>*지점명</th>
			<td class="list">
			    <div id="cineNameList"></div>
			</td>
		</tr>
		<tr>
			<th>*상영관</th>
			<td class="list">
				<input type="text" id="roomName" name="roomName" required>
			</td>
		</tr>
		<tr>
			<th>*영화이름</th>
			<td class="list">
				<input type="text" name="keyWord" id="keyWord"><br>
				<div id="mName"></div>	
			</td>
		</tr>
		<tr>
			<th>*상영날짜</th>
			<td class="list">
				<input type="date" id="sdate" name="sdate" required>
			</td>
		</tr>
		<tr>
			<th>*상영시작시간</th>
			<td class="list">
				<input type="text" name="stime" id="stime" placeholder="24시간제 ex)10시30분 → 1030" required>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="등록" id="btn_insert" />
		<input class="cbp-mc-submit" type="reset" value="다시입력" />
		<input class="cbp-mc-submit" type="button" value="취소" onclick="javascript:history.back()" />
	</div>

	<!-- 상영관 유효성 검사 -->
	<script src="js/jquery.js"></script>
	<script>
		/*브랜드에 따른 지점명*/
		//AJAX객체의 기본값 지정
		$.ajaxSetup({datatype:"text"});
		
		$("#brandName").change(function() {
			//alert("test");
			//alert($(this).val());
			var brandName = "brandName=" + $(this).val(); 
			//$.post(URL,data,function(data,status,xhr)
			/*
				- URL : 서버에 요청하는 명령어
				- ★data : 서버에 전송하는 값(변수1=값1&변수2=값2)
				- function : 콜백함수
			*/

			$.post("./cineNameList.do",brandName,cineNameList); //post() end
		});//change() end

		//Controller에서 out에 보낸 값을 cineMsg에 담아서 data로 받아옴
		function cineNameList(data) {
			//alert(data);
			$("#cineNameList").html(data);
		}; //cineNameList() end
		
		//--------------------------------------------------
		/*영화 검색*/
		$("#keyWord").keyup(function() {
			//alert("test");
			var keyWord = $("#keyWord").val();
			var params = "keyWord=" + keyWord;
			
			if($("#keyWord").val() == "") {//검색어가 존재하지 않으면
				$("#mName").hide(); //출력결과 숨기기
			}
			$.post("./movieNameList.do",params,movieNameList);
		});//keyup() end
		
		function movieNameList(data) {
			if(data.length>0) { //응답받은 내용이 있는지?					
				var result = data.split("|");
				var param = result[0];
				alert("param : " + param);
				var movieList = result[1].split(",");
				alert(movieList);
				var str = "";
				$.each(movieList, function(index,key) {
					str += "<a href='#keyWord'>" + key + "</a>";
					str += "<br>";
				}); //each() end
				$("#mName").html(str);
				$("#mName").show();
			} else {
				$("#mName").hide();
			}//if end
		}//movieNameList() end
		//-------------------------------------------------
		/*영화목록 중 영화이름 클릭하면 input 태그에 입력*/
		$("#mName").click(function() {
			alert("test");
			var mName = ("#mName").val();
			alert(mName);
			$("#keyWord").text(mName);
			$("#mName").hide();
		});//click() end
		
		//-------------------------------------------------
		//1) 상영관이 숫자인지
		//2) 영화명 적었는지
		//3) 상영시간 4글자인지
		
	</script>
	<!-- 상영관 유효성 끝 -->

</form>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>