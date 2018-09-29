// --------------------- 예매하기 AJAX File
$.ajaxSetup({datatype:"text"});

/* --------------- 좌석선택 ----------------------------- */
var accommodate = 2; //선택 인원(앞 예매페이지에서 받아와야함)
var seatcnt = 0;
var tempcnt = 0;
$(".seatline").click(function() {
	// 선택된 좌석 class="on", 이미 선택된 좌석이면 on class 지움
	if ($(this).hasClass("on") == true) {
		$(this).removeClass("on");
		--seatcnt;
		alert(seatcnt);
	} else {
		seatcnt++;
		if(accommodate >= seatcnt) {
			$(this).addClass("on");
			alert(seatcnt);
		} else {
			alert("선택인원을 초과했습니다.");
		}
			
	}// if end
});// click() end
/* --------------- 좌석선택 END ------------------------- */

