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

<FORM class="cbp-mc-form" name='roomForm' method='POST' action='./roomForm.do'
      enctype="multipart/form-data">
	<span style="color: red; font-weight: bold">* 필수입력</span><br> 
	<input type="hidden" id="cineCode" name="cineCode" value="${cineCode}" />
	<table class="cbp-mc-column">
		<tr>
			<th>* 총좌석수</th>
			<td class="list"><input type="number" id="seatCnt" name="seatCnt" required>&nbsp;</td>
		</tr>
		<tr>
			<th>*상영관 정보 1</th>
			<td class="list"><select name="DD1" id="DD1" required>
					<option value="2D">2D</option>
					<option value="3D" selected>3D</option>
					<option value="4D">4D</option>
					<option value="IMAX">IMAX</option>
					<option value="ETC">기타상영관</option></select>
			<br>
            <div id="and1" style="display:none">
            <input id="DDand1" name="DDand1" type="text"/>
            </div>		
			</td>
		</tr>
		<tr>
            <th>상영관 정보 2</th>
            <td class="list"><select name="DD2" id="DD2">
                    <option value="0">선택안함</option>
                    <option value="2D">2D</option>
                    <option value="3D">3D</option>
                    <option value="4D">4D</option>
                    <option value="IMAX">IMAX</option>
                    <option value="ETC">기타상영관</option></select>
            <br>
            <div id="and2" style="display:none">
            <input id="DDand2" name="DDand2" type="text"></input>
            </div>      
            </td>
        </tr>
                <tr>
            <th>상영관 정보 3</th>
            <td class="list"><select name="DD3" id="DD3">
                    <option value="0">선택안함</option>
                    <option value="2D">2D</option>
                    <option value="3D">3D</option>
                    <option value="4D">4D</option>
                    <option value="IMAX">IMAX</option>
                    <option value="ETC">기타상영관</option></select>
            <br>
            <div id="and3" style="display:none">
            <input id="DDand3" name="DDand3" type="text"></input>
            </div>      
            </td>
        </tr>
		<tr>
			<th>상영관 별칭</th>
			<td><input type="text" name="etc" id="etc"></td>
		</tr>
		<tr>
			<th>좌석 선택 이미지</th>
			<td class="seatImg"><input type="file" name="seatImgMF" id="seatImgMF" required></td>
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
/*추가 입력창
 기타 상영관일 경우 상영관 형태를 적을 수 있도록 한다 */

// 첫번째 DD (=상영형태)
$("#DD1").change(function() {
	var roomtype1= $("#DD1 option:selected").val();
	var roomtype2= $("#DD2 option:selected").val();
	var roomtype3= $("#DD3 option:selected").val();
	if (roomtype1=="ETC") {
		$("#and1").show();
	}  else {
        $("#and1").hide();
	}
	
}); // DD1 END

//DD2 (=상영형태)
$("#DD2").change(function() {
	    var roomtype1= $("#DD1 option:selected").val();
	    var roomtype2= $("#DD2 option:selected").val();
	    var roomtype3= $("#DD3 option:selected").val();
    if (roomtype2=="ETC") {
        $("#and2").show();
    } else if (roomtype2==roomtype1) {
        alert("상영관 정보 1과 같은 값을 선택할 수 없습니다");
        // $("#DD2 option:contains('0')").prop('selected', 'selected');
        $("#DD2").val("0");
    } else {
        $("#and2").hide();
    }
}); // DD1 END

//DD3 (=상영형태)
$("#DD3").change(function() {
	 var roomtype1= $("#DD1 option:selected").val();
     var roomtype2= $("#DD2 option:selected").val();
     var roomtype3= $("#DD3 option:selected").val();
    if (roomtype3=="ETC") {
         $("#and3").show();
    } else if (roomtype3==roomtype1 || roomtype3==roomtype2) {
        alert("다른 상영관 정보와 같은 값을 선택할 수 없습니다");
        // $("#DD3 option:contains('0')").prop('selected', 'selected');
        $("#DD3").val("0");
    } else {
         $("#and3").hide();
    }
}); // DD1 END

</script>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>