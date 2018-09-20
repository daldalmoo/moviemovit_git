// --------------------- 예매하기 AJAX File
$.ajaxSetup({datatype:"text"});

// 전역변수
var MCODE = "";
var CCODE = "";

/* ----------- 영화선택 부분 AJAX ---------------- */
// 영화목록 새로고침
function ResetMovie() {
  MCODE = "";
  $(".movie_area li").removeClass("on");
  
  if($(".t_tab2 a").hasClass("on")==true) {
    $("#cinema_area .nocinema").css('display','block');
    $("#cinema_area .cinema_addr1").css('display','none');
    $("#cinema_area .main_list").css('display','none');
  }//if end
}//ResetMovie() end

// 영화선택 -> 상영극장 가져오기
//function SelMovieList(mCode) {
$(".SelMovieList").click(function(){
  //alert("SelMovieList(mCode) 호출. mCode:" + mCode);
  
  // 선택된 영화목록만 class="on", 이미 선택된 영화라면 on class 지움
  if($(this).hasClass("on")==true) {
    $(this).removeClass("on");
    MCODE = "";
  } else {
    $(".movie_area li").removeClass("on");
    $(this).addClass("on");
    MCODE = $(this).val();  // 전역변수 할당
  }//if end
  
  /*
    $.post(URL,data,function(data,status,xhr)
    - URL : 서버에 요청하는 명령어
    - ★data : 서버에 전송하는 값(변수1=값1&변수2=값2)
    - function : 콜백함수
  */
  $.post("./cinemalist.do","mCode="+MCODE,mainList);  // 영화선택 -> 상영극장 가져오기
});//SelMovieList() end

/* ----------- 영화선택 부분 AJAX END ------------ */

/* ----------- 극장선택 부분 AJAX ---------------- */
// 극장목록 새로고침
function ResetCinema() {
  //alert("ResetCinema() 클릭");
  $(".t_tab1 a").addClass("on");
  $(".t_tab2 a").removeClass("on");
  $(".t_tab3 a").removeClass("on");

  $(".cinema_addr1_list a").html("서울");
  
  $.post("./cinemaRefresh.do","",mainList);
}//ResetCinema() end

// 극장종류 선택
function cinemaSelect(i) {
  //alert("cinemaSelect() 클릭");
  for(var j=1; j<=3; j++) {
    $(".t_tab"+j+" a").removeClass("on");
  }//for end
  $(".t_tab"+i+" a").addClass('on');
  
  if(i==1) {  // 전체극장
    $("#cinema_area .nocinema").css('display','none');
    $("#cinema_area .cinema_addr1").css('display','block');
    $("#cinema_area .main_list").css('display','block');
    $(".cinema_addr1_list a").html("서울");
    $.post("./cinemaRefresh.do","",mainList);
  } else if(i==2) {  // 상영극장
    //alert(MCODE);
    if(MCODE=="") {  /* 영화또는날짜 선택안됐을경우 display 처리 부분 */
      $("#cinema_area .nocinema").css('display','block');
      $("#cinema_area .cinema_addr1").css('display','none');
      $("#cinema_area .main_list").css('display','none');
    }//if end
  } else if(i==3) {  // 체인별
    ;
  }//if end
  
}//cinemaSelect() end

// 극장목록 보여주기
function mainList(data) {  // Controller에서 msg 값 data로 받아옴
  //alert("mainList() 호출. data:"+data);
  $(".main_list").html(data);
}//mainList() end
/* ----------- 극장선택 부분 AJAX END ------------ */


/* --------- 영화,극장,날짜 선택 -> 상영시간표 가져오기 AJAX --------- */
/*
function screentimeList(data) {  // Controller에서 msg 값 data로 받아옴
  alert("screentimeList() 호출. data:"+data);
  $(".screentime").html(data);
}//screentimeList() end
*/
/* --------- 영화선택 -> 상영극장 가져오기 AJAX END--------- */


