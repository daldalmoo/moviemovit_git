// --------------------- 예매하기 AJAX File
$.ajaxSetup({datatype:"text"});

/* --------------- 좌석선택 ----------------------------- */
var accommodate = $("#peocnt").val(); //선택 인원(앞 예매페이지에서 받아와야함)
var seatcnt = 0;
var tempcnt = 0;
var str = "";
var seatTemp = "";
var seatstr = "";
/*좌석선택하면 좌석선택정보에 띄우고 다시 클릭하면 그 정보 삭제하게하기!*/
$(".seatline").click(function() {
	seatNum = $(this).parents("ul").children(".seatNum").text(); //자리열
	seatLine = $(this).text(); //자리 번호
	// 선택된 좌석 class="on", 이미 선택된 좌석이면 on class 지움
	if ($(this).hasClass("on") == true) {
		$(this).removeClass("on");
		seatcnt--;
		seatstr = seatTemp;
		if(seatcnt == 1) {
			str = str.substring(0,2);
		} else if(seatcnt == 0) {
			str = "";
		} else {
			str = seatstr;
		}		
	} else {
		seatcnt++;
		if(accommodate >= seatcnt) {
			seatstr = seatNum + seatLine;
			$(this).addClass("on");
			if(seatcnt != 1) {
				seatstr = "," + seatstr;
			}
			seatTemp = str;
			str += seatstr;
		} else {
			seatcnt--;
			alert("선택인원을 초과했습니다.");
		}			
	}// if end
	  $("#movieseat").val(str);
	//alert("최종 str : " + str);
	//alert("seatTemp : " + seatTemp);
});// click() end
/* --------------- 좌석선택 END ------------------------- */

