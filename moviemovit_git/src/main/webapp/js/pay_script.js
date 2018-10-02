// --------------------- 예매하기 AJAX File
$.ajaxSetup({datatype:"text"});

/* --------------- 결제수단 ----------------------------- */
$("#groupTitle input").click(function() {
	var payType = $(this).val();
	var str = "";
	//alert(payType);
	if(payType == 'credit') {
		//alert("credit");		
		str += "<table style='margin:auto;'>";
		str += "   <tr>";
		str += "     <th>카드종류</th>";
		str += "     <td style='padding:10px;'>";
		str += "         <select name='cardType'>";
		str += "			<option value=''>카드 선택</option>";
		str += "			<option value='1'>신한카드</option>";
		str += "			<option value='2'>KB국민카드</option>";
		str += "			<option value='3'>카카오뱅크카드</option>";
		str += "			<option value='4'>우리카드</option>";
		str += "			<option value='5'>하나카드</option>";
		str += "			<option value='6'>현대카드</option>";
		str += "			<option value='7'>삼성카드</option>";
		str += "			<option value='8'>NH카드</option>";
		str += "			<option value='9'>시티카드</option>";
		str += "			<option value='10'>K뱅크</option>";
		str += "		 </select>";
		str += "     </td>";
		str += "   </tr>";
		
		str += "   <tr>";
		str += "     <th>카드 번호</th>";
		str += "     <td style='padding:10px;'>";
		str += "       <input type='text' size='5' id='cardNum1'>-";
		str += "       <input type='text' size='5' id='cardNum2'>-";
		str += "       <input type='text' size='5' id='cardNum3'>-";
		str += "       <input type='text' size='5' id='cardNum4'>";
		str += "     </td>";
		str += "   </tr>";
		
		str += "   <tr>";
		str += "     <th>유효기간</th>";
		str += "     <td style='padding:10px;'>";
		str += "       <input type='text' size='5' id='cardMonth' placeholder='10'> 월";
		str += "       <input type='text' size='5' id='cardYear' placeholder='18'> 년";
		str += "     </td>";
		str += "   </tr>";
		
		str += "   <tr>";
		str += "     <th>법정생년월일(6자리)</th>";
		str += "     <td style='padding:10px;'>";
		str += "       <input type='text' size='20' id='birth' placeholder='ex)181002'>";
		str += "     </td>";
		str += "   </tr>";
		
		str += " </table>";
		$("#payData").html(str);
	} else if(payType == 'phone') {
		//alert("phone");
		str += "<table style='margin:auto;'>";
		str += "   <tr>";
		str += "     <th>통신사</th>";
		str += "     <td style='padding:10px;'>";
		str += "         <select name='phonebrand'>";
		str += "			<option value=''>통신사 선택</option>";
		str += "			<option value='skt'>SKT</option>";
		str += "			<option value='kt'>KT</option>";
		str += "			 <option value='lg'>LGU+</option>";
		str += "		 </select>";
		str += "     </td>";
		str += "   </tr>";
		
		str += "   <tr>";
		str += "     <th>휴대폰 번호</th>";
		str += "     <td style='padding:10px;'>";
		str += "       <input type='text' id='phoneNum' placeholder='-없이 입력해주세요'>";
		str += "     </td>";
		str += "   </tr>";
		str += " </table>";
		$("#payData").html(str);
	} else if(payType == 'deposit') {
		//alert("deposit");
		str += "<table style='margin: auto'>";
		str += " <tr>";
		str += "	<th>입금자명</th>";
		str += "		<td style='padding:10px;'>";
		str += " 			<input type='text' id='accName'>";
		str += "		</td>";
		str += " </tr>";
		  
		str += " <tr>";
		str += " 	<th>입금계좌</th>";
		str += " 		<td style='padding:10px;'>";
		str += "    		<select name='account'>";
		str += "      			<option value=''>계좌선택</option>";
		str += "    			<option value='1'>국민은행 123456-78-910112</option>";
		str += "   				<option value='2'>신한은행 123456-78-910112</option>";
		str += "  				<option value='3'>하나은행 123456-78-910112</option>";
		str += "  			</select>";
		str += " 		</td>";
		str += " </tr>";
		str += "</table>";
		$("#payData").html(str);
	} 
});//click() end
/* --------------- 결제수단 END ------------------------- */

/* --------------- 쿠폰선택 ----------------------------- */
$("#cCode").click(function() {
	var disprice = $("#totalprice").val();
	disprice = disprice * 0.9;
	
	var str = "";
	str += "     <th>쿠폰적용 금액</th>";
	str += "     <td style='padding:10px;'>";
	str += "       <input type='text' id='disprice' value='"+ disprice +"'>원";
	str += "     </td>";
	$("#discountPrice").html(str);
	$("#total").empty();
	$("#total").text(disprice);
});//click() end
/* --------------- 쿠폰선택 END ------------------------- */

