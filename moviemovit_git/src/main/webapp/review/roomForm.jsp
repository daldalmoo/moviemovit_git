<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%
  //주소 값에서 cineCode 가져오기
			String cineCode = request.getParameter("cineCode");
			request.setAttribute("cineCode", cineCode);
%>
<%-- 본문시작 theaterForm.jsp --%>
<head>

<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>
/*180827 경민 list 클래스 추가*/
.list {
	text-align: left;
	padding: 10px;
	margin: auto;
}
</style>
</head>
<!-- 상영관 등록 FORM -->

<FORM class="cbp-mc-form" name='roomForm' method='POST'
	action='./roomForm.do'>
	<span style="color: red; font-weight: bold">* 필수입력</span><br> <input
		type="hidden" id="cineCode" name="cineCode" value="${cineCode}" />
	<table class="cbp-mc-column">
		<tr>
			<th>* 총좌석수</th>
			<td class="list"><input type="number" id="cineName"
				name="cineName" required>&nbsp;</td>
		</tr>
		<tr>
			<th>*상영관 정보 1</th>
			<td class="list"><select name="brandName" id="brandName" required>
					<option value="LOTTE">2D</option>
					<option value="CGV" selected>3D</option>
					<option value="MEGABOX">4D</option>
					<option value="INDEP">IMAX</option>
					<option value="ETC" id="andsoon1">기타상영관</option></select>
			<br>
            <div id="and1" style="display:none"></div>		
			</td>
		</tr>
		<tr>
            <th>상영관 정보 2</th>
			<td class="list"><select name="brandName" id="brandName" required>
					<option value="LOTTE">2D</option>
					<option value="CGV" selected>3D</option>
					<option value="MEGABOX">4D</option>
					<option value="INDEP">IMAX</option>
					<option value="ETC" id="andsoon2">기타상영관</option>
			</select><br>
			<div id="and2" style="display:none">
			<input type="text" name="etc" id="etc"></div>
			</td>
		</tr>
		<tr>
            <th>상영관 정보 3</th>
			<td class="list"><select name="brandName" id="brandName" required>
					<option value="LOTTE">2D</option>
					<option value="CGV" selected>3D</option>
					<option value="MEGABOX">4D</option>
					<option value="INDEP">IMAX</option>
					<option id="andsoon" id="andsoon3">기타상영관</option>
			</select><br>
            <div id="and3" style="display:none"></div>
			</td>
		</tr>
			<th>상영관 별칭</th>
			<td><input type="text" name="etc" id="etc">
			</td>
		</tr>
		<tr>
			<th>좌석 선택 이미지</th>
			<td class="seatImg"><input type="file" name="seatImgMF"
				id="seatImgMF"></td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="등록" /> <input
			class="cbp-mc-submit" type="reset" value="다시입력" /> <input
			class="cbp-mc-submit" type="button" value="취소"
			onclick="javascript:history.back()" />
	</div>

</form>

<script src="../js/jquery.js"></script>
<script>
/*추가 입력창*/

$("#andsoon1").change(function() {
	$("and1").toggle();
});

$("#andsoon2").change(function() {
    $("and2").toggle();
});

$("#andsoon3").change(function() {
    $("and3").toggle();
});

</script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>