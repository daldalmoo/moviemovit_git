<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 userUpdateForm.jsp --%>
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

<form class="cbp-mc-form" id="regForm" name="regForm" method="post" action="./userUpdateProc.do">
	<!-- 회원정보 수정 폼 -->
	<table class="cbp-mc-column">
		<tr>
			<th>*ID</th>
			<td class="list">
				<input type="text" id="uid" name="uid" value="${dto.uid }" readonly> 
			</td>
		</tr>
		<tr>
			<th>*Password</th>
			<td class="list">
				<input type="password" id="upw" name="upw" placeholder="특문포함 5~10글자 사이" required></td>
		</tr>
		<tr>
			<th>*Password_check</th>
			<td class="list">
				<input type="password" id="repasswd" name="repasswd"></td>
		</tr>
		<tr>
			<th>*Name</th>
			<td class="list">
				<input type="text" id="uname" name="uname" value="${dto.uname }">
			</td>
		</tr>
		<tr>
			<th>*Gender</th>
			<td class="list">
				<input type="radio" style="width: 5%;" id="gender" name="gender" value="W" <c:if test="${dto.gender == 'W' }">
				<c:out value="checked"></c:out></c:if>>여성
				<input type="radio" style="width: 5%;" id="gender" name="gender" value="M" <c:if test="${dto.gender == 'M' }">
				<c:out value="checked"></c:out></c:if>>남성
			</td>
		</tr>
		<tr>
			<th>*Birth</th>
			<td class="list">
				<input type="date" name="birth" id="birth" value="${dto.birth }">
			</td>
		</tr>
		<tr>
			<th>*E-mail</th>
			<td class="list">
				<input type="text" name="email" id="email" value="${dto.email }" readonly>
			</td>
		</tr>
		<tr>
			<th>*Tel</th>
			<td class="list">
				<input type="text" name="phone" id="phone" value="${dto.phone }">
			</td>
		</tr>
		<tr>
			<th>Post</th>
			<td class="list">
				<input type="text" name="zipcode" id="zipcode" value="${dto.zipcode }">&nbsp;
				<input class="cbp-mc-button" type="button" value="주소찾기" onclick="DaumPostcode()">
			</td>
		</tr>
		<tr>
			<th>Address</th>
			<td class="list">
				<input type="text" name="addr1" id="addr1" value="${dto.addr1 }">
			</td>
		</tr>
		<tr>
			<th>Address_detail</th>
			<td class="list">
				<input type="text" name="addr2" id="addr2" value="${dto.addr2 }">
			</td>
		</tr>

	</table>

	<!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="회원수정" id="bnt_update" />
		<input class="cbp-mc-submit" type="reset" value="다시입력" />
		<input class="cbp-mc-submit" type="button" value="취소" onclick="javascript:history.back()" />
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
					document.getElementById('addr1').value = fullAddr;

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_wrap.style.display = 'none';

					// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
					document.body.scrollTop = currentScroll;

					$('#addr2').focus();
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


	<!-- 회원수정 유효성 -->
	<script src="js/jquery.js"></script>
	<script>		
		/*회원수정 유효성 검사*/
		$("#btn_update").click(function() {
			//1) 비밀번호 글자갯수가 5~10사이인지?
			var upw = $("#upw").val();
			upw = upw.trim();

			if (upw.length<5 || upw.length>10) {
				alert("비밀번호 글자갯수 확인해 주세요");
				$("#upw").focus(); //커서 생성
				return false;
			}
			//----------------------------------------------------------			
			//2) 비번에 특수문자 포함되어 있는지?
			var spe = upw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			if (spe < 0) {
				alert("특수문자를 혼합하여 입력해주세요.");
				$("#upw").focus();
				return false;
			}
			//----------------------------------------------------------			
			//3) 첫번째 비번과 두번째 비번이 서로 일치하는지?
			var repasswd = $("#repasswd").val();
			repasswd = repasswd.trim();

			if (repasswd != upw) {
				alert("비밀번호가 일치하지 않습니다");
				$("#repasswd").focus();
				return false;
			}
			//----------------------------------------------------------			
			//4) 이름이 2~20글자 이내
			var uname = $("#uname").val();
			uname = uname.trim();

			if (uname.length<2 || uname.length>20) {
				alert("이름을 확인하세요");
				$("#uname").focus();
				return false;
			}
			//----------------------------------------------------------			
			//5) 성별 check 했는지?
			var gender = $(':input[name=gender]:radio:checked').val();
			if (!gender) {
				alert("성별을 체크해주세요");
				return false;
			}
			//----------------------------------------------------------			
			//5) 생년월일 8글자인지?
			var birth = $("#birth").val();
			if (birth.length < 10) {
				alert("생년월일 8글자를 입력하세요");
				$("#birth").val();
				return false;
			}		
			//----------------------------------------------------------			
			//9) 핸드폰 관련한 각 텍스트상자에 숫자형태의 글자가 입력되었는지 확인
			//	- isNaN('123')		→	false
			//	- isNaN('Hello')	→	true
			var tel = $("#phone").val();
			tel = tel.trim();

			if (tel.length > 11 || isNaN(tel)) {
				alert("핸드폰 번호를 확인하세요");
				$("#phone").focus();
				return false;
			}
			$("regForm").sumbmit();
		});//click end
	</script>
	<!-- 회원수정 유효성 검사 -->

</form>
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>