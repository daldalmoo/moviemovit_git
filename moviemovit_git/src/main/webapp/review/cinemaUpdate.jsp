<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>


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
<body onload="selectboxes()">
<FORM class="cbp-mc-form" name='regForm' method='POST' action='./cinemaUpdate.do'
      enctype="multipart/form-data">
	<span style="color: red; font-weight: bold">* 필수입력</span><br>
    <input type="hidden" id="cineCode" name="cineCode" value="${dto.cineCode}">
	<!-- 영화관 등록 폼 -->
	<table class="cbp-mc-column">
		<tr>
			<th>*영화관 이름</th>
			<td class="list"><input type="text" id="cineName"
				name="cineName" value="${dto.cineName}" required></td>
		</tr>
		<tr>
			<th>*영화브랜드</th>
			<td class="list"><select name="brandName" id="brandName" required>
					<option value="LOTTE" >롯데시네마</option>
					<option value="CGV">CGV</option>
					<option value="MEGABOX">메가박스</option>
					<option value="INDEP">독립영화관</option>
			</select></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td class="list"><input type="text" name="tel" id="tel"
				value="${dto.tel}"></td>
		</tr>
		<tr>
			<th>*지역</th>
 			<td><select name="addr1" id="addr1" required>
					<option value="SEO" selected>서울</option>
					<option value="GGD">경기도</option>
					<option value="ICH">인천</option>
					<option value="KWD">강원도</option>
					<option value="CCD">충청도</option>
					<option value="KSD">경상도</option>
					<option value="JLD">전라도</option>
					<option value="JJD">제주도</option>
			</select></td> 
		</tr>
		<tr>
			<th>우편번호</th>
			<td class="list"><input type="text" name="zipcode" id="zipcode"
				readonly>&nbsp; <input class="cbp-mc-button" type="button"
				value="주소찾기" onclick="DaumPostcode()"></td>
		</tr>
		<tr>
			<th>영화관 주소</th>
			<td class="list"><input type="text" name="addr2" id="addr2" value="${dto.addr2}"
				readonly></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td class="list"><input type="text" name="addr3" id="addr3" value="${dto.addr3}" required>
			</td>
		</tr>
		<tr>
            <th>위도</th>
            <td class="list"><input type="text" name="wido" id="wido" value="${dto.wido}" required readonly> 
              &nbsp; <input class="cbp-mc-button" type="button" name="widokyeongdo" id="widokyeongdo" value="찾기"></td>
        </tr>
        <tr>
            <th>경도</th>
            <td class="list"><input type="text" name="kyengdo" id="kyengdo" value="${dto.kyengdo}" required readonly>
            </td>
        </tr>
		<tr>
			<th>홈페이지</th>
			<td class="list"><input type="text" name="home" id="home" value="${dto.home}" required>
			</td>
		</tr>
		<tr>
            <th>기타 정보</th>
            <td class="list"><input type="text" name="etc" id="etc" value="${dto.etc}" required>
            </td> 
        </tr>
		<tr>
			<th>영화관 이미지</th>
			
			<td class="list">
			등록된 이미지: ${dto.logoImg}
			<input type="file" name="logoImgMF" id="logoImgMF"></td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="등록" /> <input
			class="cbp-mc-submit" type="reset" value="다시입력" /> <input
			class="cbp-mc-submit" type="button" value="취소"
			onclick="javascript:history.back()" />
	</div>

	<!-- ----- DAUM 우편번호 API 시작 ----- -->
	<div id="wrap"
		style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
		<img
			src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
			id="btnFoldWrap"
			style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
			onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
<script src="js/jquery.js"></script>
<script>

// 위도 경도 삽입을 위한 geoCoding
$("#widokyeongdo").click (function geoCoding(addr) {
	
	var addr = $("#addr2").val();
    $.ajax({
      url:"./geoCoding.do" // geoCoding호출
      ,type:"post"
      ,data: {addr : addr} // 요청변수설정
      ,dataType:"text"
          ,success: function(data) {
                var map = data.split('&');
                var map_x = map[0];
                var map_y = map[1];
                
                document.getElementById('wido').value = map_x;  
                document.getElementById('kyengdo').value = map_y;
        },
        error:function(request,status,error){
          console.log("code:"+request.status+"\n"+"error:"+error);
        }
    });
});

// 셀렉트 옵션 자동 선택 (영화관브랜드, 주소1)
function selectboxes(){
   
	// 영화관 브랜드 선택 
    var selectbrand = '${dto.brandName}';
    // alert(selectbrand);

    if(selectbrand=="CGV"){
        $("#brandName").val("CGV").attr("selected", "selected");
    } else if(selectbrand=="LOTTE") {
        $("#brandName").val("LOTTE").attr("selected", "selected");
    } else if(selectbrand=="INDEP") {
        $("#brandName").val("INDEP").attr("selected", "selected");
    } else if(selectbrand=="MEGABOX") {
        $("#brandName").val("MEGABOX").attr("selected", "selected"); } 
    

    // 지역 선택
    
    var selectaddr1='${dto.addr1}';
    //alert(selectaddr1);
    
    if(selectaddr1=="SEO"){
        $("#addr1").val("SEO").attr("selected", "selected");
    } else if(selectaddr1=="GGD") {
        $("#addr1").val("GGD").attr("selected", "selected");
    } else if(selectaddr1=="ICH") {
       $("#addr1").val("ICH").attr("selected", "selected");
    } else if(selectaddr1=="KWD") {
       $("#addr1").val("KWD").attr("selected", "selected");
    }  else if(selectaddr1=="CCD") {
         $("#addr1").val("CCD").attr("selected", "selected");
    } else if(selectaddr1=="KSD") {
         $("#addr1").val("KSD").attr("selected", "selected");
    } else if(selectaddr1=="JLD") {
       $("#addr1").val("JLD").attr("selected", "selected"); 
     } else if(selectaddr1=="JJD") {
       $("#addr1").val("JJD").attr("selected", "selected"); } 

}

</script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}

		function DaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode({
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = data.address; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 기본 주소가 도로명 타입일때 조합한다.
					if (data.addressType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('addr2').value = fullAddr;

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_wrap.style.display = 'none';

					// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
					document.body.scrollTop = currentScroll;

					$('#addr3').focus();
				},
				// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
				onresize : function(size) {
					element_wrap.style.height = size.height + 'px';
				},
				width : '100%',
				height : '100%'
			}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}
	</script>
	<!-- ----- DAUM 우편번호 API 종료----- -->
</form>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>