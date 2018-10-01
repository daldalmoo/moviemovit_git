
// --------------------- 예매하기 AJAX File
$.ajaxSetup({datatype:"text"});
   
// 전역변수
var MCODE = 0;    // 선택된 영화코드. DB에서 int mCode는 1부터 입력됨. 0일 경우 선택영화 없음
var CINETAB = 1;  // 선택된 극장종류 : 1 전체극장, 2 상영극장, 3 체인별
var CINEADDR1 = "all";// 선택된 극장주소1 : 전국
var CLMD = "C";   // 선택된 극장체인
var CINECODE = "";// 선택된 극장코드
var CINEINFONAME = "";
var SDATE = "";   // 선택된 날짜

// 페이지 로드가 끝난 후 실행
$(document).ready(function() {
  calendarClassReady();  // 선택가능날짜 class="ready" 처리
});

/******************* 영화선택 부분 AJAX *******************/
// 영화목록 새로고침
function ResetMovie() {
  MCODE = 0;
  $("#movie_area li").removeClass("on");
  
  // 극장리스트 스타일 복귀
  $("#cinema_area .main_list li").css({'font-weight':'normal','color':'black','pointer-events':'auto'});
  
  // 상영극장 클릭되어 있으면 극장없음 띄우기
  if(CINETAB==2) {
    $("#cinema_area .nocinema").css('display','block');
    $("#cinema_area .cinema_addr1").css('display','none');
    $("#cinema_area .cinema_chain").css('display','none');
    $("#cinema_area .main_list").css('display','none');
  }//if end

  // 날짜목록 호출
  calendarClassReady();

  // 상영시간표 호출
  screentimeView();
  
}//ResetMovie() end

// 영화선택시 호출
$("#movie_area .SelMovieList").click(function(){
  //alert("SelMovieList click 됨. $(this).val():" + $(this).val());
  if($(this).hasClass("on")==true) {  // 이미 선택된 영화라면 on class 지움
    ResetMovie();
  } else {  // 영화를 선택했을 때
    $("#movie_area li").removeClass("on");
    $(this).addClass("on");
    MCODE = $(this).val();  // 전역변수 할당
    
    // 해당하는 극장의 주소1 목록 가져오기
    addr1List();
    
    // 극장목록 가져오기
    if(CINETAB==1) {  // 전체극장
      cinetab1mainlist();
    } else if(CINETAB==2) {  // 상영극장
      cinetab2mainlist();
    } else if(CINETAB==3) {  // 체인별
      cinetab3mainlist();
    }//if end
  }//if end

  // 날짜목록 호출
  calendarClassReady();
  
  // 상영시간표 호출
  screentimeView();
  
});//SelMovieList click() end

//영화선택하면 해당 포스터가져와서 영화정보에 뿌려줌 

/******************* 영화선택 부분 AJAX END *******************/

/******************* 극장선택 부분 AJAX *******************/
// 극장목록 새로고침
function ResetCinema() {
  //alert("ResetCinema() 클릭");
  CINETAB = 1;  // 선택된 극장종류 : 1 전체극장, 2 상영극장, 3 체인별
  CINEADDR1 = "all";// 선택된 극장주소1 : 전국
  CLMD = "C";   // 선택된 극장체인
  CINECODE = "";// 선택된 극장코드
  
  // 전체극장 선택하여 극장목록 호출
  cinemaSelect(1);
  
  // 날짜목록 호출
  calendarClassReady();
  
  CINEINFONAME = "";
  screentimeView();  // 상영시간표 호출
}//ResetCinema() end

// 극장종류 선택시 호출
function cinemaSelect(i) {
  //alert("cinemaSelect() 클릭");
  for(var j=1; j<=3; j++) {
    $(".t_tab"+j+" a").removeClass("on");
  }//for end
  $(".t_tab"+i+" a").addClass('on');
  
  CINETAB = i; // 전역변수 설정
  
  // 해당하는 극장의 주소1 목록 가져오기
  addr1List();
  
  // 극장목록 가져오기
  if(CINETAB==1) {  // 전체극장
    cinetab1mainlist();  // 극장목록 설정
  } else if(CINETAB==2) {  // 상영극장
    cinetab2mainlist();  // 극장목록 설정
  } else if(CINETAB==3) {  // 체인별
    cinetab3mainlist();  // 극장목록 설정
  }//if end
}//cinemaSelect() end

// 극장체인명 클릭할때 호출
//$("#cinema_area .cinema_chain li").click(function(){
// 주의! 위처럼 쓰면 ajax에서 쓴 html의 엘리먼트는 이벤트 작동 안함
$(document).on('click', '#cinema_area .cinema_chain li', function(){
  $("#cinema_area .cinema_chain li").removeClass("on");
  $(this).addClass("on");
  
  CLMD = $(this).attr("value");  // 전역변수 설정
  
  // 해당하는 극장의 주소1 목록 가져오기
  addr1List();
  
  // 극장목록 가져오기
  cinetab3mainlist();
});//.cinema_chain li click() end

// 주소1 목록 변경될 때마다 호출
/*$(document).on('DOMSubtreeModified', '#cinema_area .addr1list', function(){
  alert(CINEADDR1);
});//.addr1selected click() end
*/

// 주소1 class="click" 일때 주소1 목록 보여주기
$("#cinema_area .addr1selected").click(function(){
  $(this).toggleClass("click");
  $("#cinema_area .addr1list").toggleClass("click");
});//.addr1selected click() end

// 해당하는 극장의 주소1 목록 가져오기
function addr1List() {
  if (CINETAB == 1) { // 전체극장
    $.post("./addr1List.do", "addr1=" + CINEADDR1, execute);
  } else if (CINETAB == 2) { // 상영극장
    $.post("./addr1ListFromMovie.do", "addr1=" + CINEADDR1 + "&mCode=" + MCODE, execute);
  } else if (CINETAB == 3) { // 체인별
    $.post("./addr1ListFromChain.do", "addr1=" + CINEADDR1 + "&CLMD=" + CLMD, execute);
  }//if end
  function execute(data) {
    var msg = data.split("|");
    $("#cinema_area .addr1selected span").html(msg[0]);
    $("#cinema_area .addr1list").html(msg[1]);
  }//execute() end
}//addr1List() end

// 주소1 목록에서 클릭할때 호출
//$("#cinema_area .addr1list li").click(function(){
// 주의! 위처럼 쓰면 ajax에서 쓴 html의 엘리먼트는 이벤트 작동 안함
$(document).on('click', '#cinema_area .addr1list li', function(){
  //alert(".cinema_addr1 .addr1list li html : "+$(this).html());
  CINEADDR1 = $(this).attr("value");  // 전역변수 설정
  
  // 클릭한 주소가 클릭된 주소로 보여짐
  var msg = $(this).html();
  $(".addr1selected span").html(msg);
  
  // 주소1 목록 접기
  $(".cinema_addr1 .addr1selected").removeClass("click");
  $("#cinema_area .addr1list").removeClass("click");
  
  // 극장목록 가져오기
  if(CINETAB==1) {  // 전체극장
   cinetab1mainlist();
  } else if(CINETAB==2) {  // 상영극장
   cinetab2mainlist();
  } else if(CINETAB==3) {  // 체인별
   cinetab3mainlist();
  }//if end
});//.addr1list li click() end

function cinetab1mainlist() {  // 전체극장 선택되어있을때 극장목록 가져오기
  // display 처리
  $("#cinema_area .nocinema").css('display','none');
  $("#cinema_area .cinema_addr1").css('display','block');
  $("#cinema_area .cinema_chain").css('display','none');
  $("#cinema_area .main_list").css('display','block');
  $("#cinema_area .main_list").css('height','372px');
  // 주소1 -> 극장 목록 <ul> 전체 가져오기
  $.post("./cinemaListFromAddr1.do","addr1="+CINEADDR1, mainList);
  // 영화선택시 상영극장 gray
  graycinema();
}//cinetab1mainlist() end

function cinetab2mainlist() {  // 상영극장 선택되어있을때 극장목록 가져오기
  if(MCODE==0) {  // 영화또는날짜 선택안됐을경우 상영극장 없음 보이기
    // display 처리
    $("#cinema_area .nocinema").css('display','block');
    $("#cinema_area .cinema_addr1").css('display','none');
    $("#cinema_area .cinema_chain").css('display','none');
    $("#cinema_area .main_list").css('display','none');
  } else {  // 상영극장 목록 가져오기
    $("#cinema_area .nocinema").css('display','none');
    $("#cinema_area .cinema_addr1").css('display','block');
    $("#cinema_area .cinema_chain").css('display','none');
    $("#cinema_area .main_list").css('display','block');
    $("#cinema_area .main_list").css('height','372px');
    // 영화코드, 주소1 -> 극장 목록 <ul> 전체 가져오기
    $.post("./cinemaListFromMovieAddr1.do","mCode="+MCODE+"&addr1="+CINEADDR1,mainList);
  }//if end
}//cinetab2mainlist() end

function cinetab3mainlist() {  // 체인별극장 선택되어있을때 극장목록 가져오기
  // display 처리
  $("#cinema_area .nocinema").css('display','none');
  $("#cinema_area .cinema_addr1").css('display','block');
  $("#cinema_area .cinema_chain").css('display','block');
  $("#cinema_area .main_list").css('display','block');
  $("#cinema_area .main_list").css('height','340px');
  // 체인명, 주소1 -> 극장 목록 <ul> 전체 가져오기
  $.post("./cinemaListFromChain.do","clmd="+CLMD+"&addr1="+CINEADDR1, mainList);
  // 영화선택시 상영극장 gray
  graycinema();
}//cinetab3mainlist() end

// 극장목록 보여주기
function mainList(data) {  // Controller에서 msg 값 data로 받아옴
  //alert("mainList() 호출. data:"+data);
  $(".main_list").html(data);
}//mainList() end

// 상영극장 굵게 검은색, 그외 회색 처리
function graycinema() {
  //alert("graycinema 호출");
  // 0.01초 시간지연. 이전 코드에서 html이 모두 로딩되길 기다린 후 실행
  setTimeout(execute, 10); 
  function execute(){
    if(MCODE!=0) {  // 영화가 선택되어 있으면
      // 영화코드 -> 극장 목록 cineCode만 | 구분 정렬해서 가져오기
      $.post("./graycinemalist.do","mCode="+MCODE,function(cineCodestr) {
        var cineCode = cineCodestr.split("|");
        $(".main_list li").css({'font-weight':'normal','color':'#c0c0c0','pointer-events':'none'});  // 모든 극장 회색 처리
        for(var i=0; i<cineCode.length; i++) {  // 상영하는 극장만 굵게 검은색 처리
          $(".main_list li[value='"+cineCode[i].trim()+"']").css({'font-weight':'bold','color':'black','pointer-events':'auto'});
        }//for end
      });//post end
    }//if end
  }//execute() end
}//graycinema() end

// 극장검색
$(document).on('keydown', '.cinema_title .searchtxt', function(){
  if(event.keyCode == 13) { return false; } // 엔터키 입력시 아무동작 안함
});//keydown() end
$(document).on('keyup', '.cinema_title .searchtxt', function(){
  var key = $(this).val();
  //alert(key);
  
  if(key=="") { // 데이터 없으면 기존목록 보여줌
    closeSearch();
  } else if(key!="") {
    // display 처리
    $("#cinema_area .cinema_select").css('display','none');
    $("#cinema_area .nocinema").css('display','none');
    $("#cinema_area .cinema_chain").css('display','none');
    $("#cinema_area .cinema_addr1").css('display','none');
    $("#cinema_area .main_list").css({'display':'block','height':'421px'});
    
    // 검색된 key로 극장목록 가져오기
    $.post("./cinemaSearch.do","key="+key, mainList);
  }//if end
});//keyup() end

// 극장검색 닫기버튼
function closeSearch() {
  // display 처리
  $("#cinema_area .cinema_select").css('display','block');
  // 기존 선택된 극장목록 가져오기
  cinemaSelect(CINETAB);
  // 검색창 내용 지우기
  $(".cinema_title .searchtxt").val("");
}//closeSearch() end

// 극장선택시 호출
//$("#cinema_area .main_list li").click(function() {
// 주의! 위처럼 쓰면 ajax에서 쓴 html의 엘리먼트는 이벤트 작동 안함
$(document).on('click', '#cinema_area .main_list li', function(){
  //alert("main_list li 클릭됨. $(this).attr('value'):" + $(this).attr('value'));
  if ($(this).hasClass("on") == true) { // 이미 선택된 영화라면 on class 지우고 전역변수 초기화
    $(this).removeClass("on");
    CINECODE = "";
    CINEINFONAME = "";
    screentimeView();  // 상영시간표 호출
  } else { // 영화를 선택했을 때
    $("#cinema_area .main_list li").removeClass("on");
    $(this).addClass("on");
    
    CINECODE = $(this).attr('value').trim(); // 전역변수 할당
    CINEINFONAME = $(this).text();
    screentimeView();  // 상영시간표 호출
  }//if end
  
  // 영화목록 호출 TODO

  // 날짜목록 호출
  calendarClassReady();
});//SelMovieList click() end

/******************* 극장선택 부분 AJAX END *******************/

/* ---------영화선택 -> 영화정보 포스터 가져오기 AJAX ---------*/

function moiveInfo_poster(data) {
  //alert(data);
  //$("#thumb_poster").html(data);
}//moiveInfo_poster() end

/* ---------영화선택 -> 영화정보 포스터 가져오기 AJAX END -----*/

/******************* 날짜선택 AJAX *******************/
// 이전달 클릭시
$(document).on('click', '#cal_area #prev', function(){
  calendarClassReady();  // 선택가능날짜 class="ready" 처리
});//next click() end

// 다음달 클릭시
$(document).on('click', '#cal_area #next', function(){
  calendarClassReady();  // 선택가능날짜 class="ready" 처리
});//next click() end

// 선택가능날짜 class="ready" 처리
function calendarClassReady() {
  //0.01초 시간지연. 이전 코드에서 html이 모두 로딩되길 기다린 후 실행
  setTimeout(execute, 10); 
  function execute(){
    if(MCODE==0 && CINECODE=="") {  // 영화, 극장 선택 안됐을때
      $(".calendar td").removeClass("ready");
      $.post("./sdateAllList.do", "", function(datastr) { // 선택가능날짜 모두표시
        var data = datastr.split("|");
        for(var i=0; i<data.length; i++) {
          $(".calendar td[onclick='javascript:SelDate(\""+data[i].trim()+"\")']").addClass("ready");
        }//for end
      });//post end
    } else if(CINECODE=="") {  // 영화만 선택됐을때
      $(".calendar td").removeClass("ready");
      $.post("./sdateListFromMovie.do", "mCode="+MCODE, function(datastr) { // 선택가능날짜 모두표시
        var data = datastr.split("|");
        for(var i=0; i<data.length; i++) {
          $(".calendar td[onclick='javascript:SelDate(\""+data[i].trim()+"\")']").addClass("ready");
        }//for end
      });//post end
    } else if(MCODE==0) {  // 극장만 선택됐을때
      $(".calendar td").removeClass("ready");
      $.post("./sdateListFromCinema.do", "cineCode="+CINECODE, function(datastr) { // 선택가능날짜 모두표시
        var data = datastr.split("|");
        for(var i=0; i<data.length; i++) {
          $(".calendar td[onclick='javascript:SelDate(\""+data[i].trim()+"\")']").addClass("ready");
        }//for end
      });//post end
    } else {  // 영화, 극장 모두 선택됐을때
      $(".calendar td").removeClass("ready");
      $.post("./sdateListFromMovieCinema.do", "mCode="+MCODE+"&cineCode="+CINECODE, function(datastr) { // 선택가능날짜 모두표시
        var data = datastr.split("|");
        for(var i=0; i<data.length; i++) {
          $(".calendar td[onclick='javascript:SelDate(\""+data[i].trim()+"\")']").addClass("ready");
        }//for end
      });//post end
    }//if end
  }//execute() end
}//calendarCalssReady() end

// 날짜선택 시 호출
function SelDate(data) {
  //alert(data);
}//SelDate() end
$(".calendar td").click(function() {
  // 선택된 날짜 class="on", 이미 선택된 인원이면 on class 지움
  if($(this).hasClass("on")==true) {
    $(this).removeClass("on");
  } else {
    $(".calendar td").removeClass("on");
    $(this).addClass("on");
  }//if end
  
  SDATE = $(this).attr("onclick").substr(20,10);
  //alert(SDATE);

  // 상영시간표 호출
  screentimeView();
});//click() end

/******************* 날짜선택 AJAX END *******************/

/******************* 상영시간표 AJAX *******************/
// 영화, 극장, 날짜 정보로 뷰 띄워주기
function screentimeView() {
  if(CINECODE=="") { // 극장없음
    $("#screentime_area .cinemainfo .cinema_logo").css("content","url('../ticket/img/default.png')");
    $("#screentime_area .cinemainfo .cinemainfo_name").text("영화관-지점");
  } else if(CINECODE.substr(0,1)=='C') { // cgv 선택
    $("#screentime_area .cinemainfo .cinema_logo").css("content","url('../ticket/img/screentime_CGV.png')");
    $("#screentime_area .cinemainfo .cinemainfo_name").text(CINEINFONAME);
  } else if(CINECODE.substr(0,1)=='L') {  // 롯데시네마 선택
    $("#screentime_area .cinemainfo .cinema_logo").css("content","url('../ticket/img/screentime_LOTTE.png')");
    $("#screentime_area .cinemainfo .cinemainfo_name").text(CINEINFONAME);
  } else if(CINECODE.substr(0,1)=='M') {  // 메가박스 선택
    $("#screentime_area .cinemainfo .cinema_logo").css("content","url('../ticket/img/screentime_MEGA.png')");
    $("#screentime_area .cinemainfo .cinemainfo_name").text(CINEINFONAME);
  } else if(CINECODE.substr(0,1)=='D') {  // 독립영화관 선택
    $("#screentime_area .cinemainfo .cinema_logo").css("content","url('../ticket/img/screentime_INDE.png')");
    $("#screentime_area .cinemainfo .cinemainfo_name").text(CINEINFONAME);
  }//if end
  
  // 영화,극장,날짜 모두 선택되면 관별 상영시작시간 띄움
  if(MCODE!=0 && CINECODE!="" && SDATE!="") {
    $.post("./screentimeRoom.do", "mCode="+MCODE+"&cineCode="+CINECODE+"&sdate="+SDATE, function(data) { // 선택가능날짜 모두표시
      alert(data);
      /*var data = datastr.split("|");
      for(var i=0; i<data.length; i++) {
        $(".calendar td[onclick='javascript:SelDate(\""+data[i].trim()+"\")']").addClass("ready");
      }//for end */
    });//post end
  }//if end
}//screentimeView() end

// 상영시간 클릭하면 호출
function timeclick(time) {
  alert(time);
}//timeclick() end



//상영시간표 선택하면 인원선택의 li부분 font-weight bold하기!
//임시로 ex)8관 눌렀을 때 활성화되는걸로 작업중
$(".cinemainfo .cinema_logo").click(function() {
  $("#price_lst_area td").css("font-weight","bold");
  $("#price_lst_area li").css("color","black");
});//click() end
/******************* 상영시간표 AJAX END *******************/

/******************* 인원선택 AJAX *******************/
var peocnt = 0; // 인원

var adutemp = 0; // 같은유형에서 변경할때 임시변수
var youtemp = 0;
var sentemp = 0;
var kidtemp = 0;

var adustr = "";
var youstr = "";
var senstr = "";
var kidstr = "";

var price = 0;
var aduprice = 0;
var youprice = 0;
var senprice = 0;
var kidprice = 0;

$(".adult").click(function() {
  adutype = $(this).attr('value').trim();
  aducnt = $(this).text();
  // String to Number
  aducnt *= 1;

  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") != true)  {
    // 같은유형에서 값변경할 때 기존의값에서 차감
    peocnt -= adutemp;
    peocnt += aducnt;

    if (peocnt > 5) {
      peocnt -= aducnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      aducnt = 0;
    } else {
      $(".adult").removeClass("on");
      $(this).addClass("on");

      // 선택된 인원이랑 유형 append하기 ,로 엮기
      var infotxt = $("#auditType").text();
      if (aducnt != 0) {
    	  if ((infotxt.indexOf('-') != -1)) { /*최초클릭*/
    		  adustr = adutype + "\u00A0" + aducnt; // \u00A0 띄어쓰기
	          $("#auditType").empty();
	          $("#auditType").text(adustr);
          } else if(infotxt.indexOf('성인') == -1){ /*다른 유형 추가*/
    		  //alert("다른형");
			  adustr = "\u00A0" + adutype + "\u00A0" + aducnt;
			  infotxt += adustr;
			  $("#auditType").empty();
			  $("#auditType").text(infotxt);
    	  } else if((adutemp != aducnt) && (infotxt.indexOf('성인') != -1)) { /*유형 변경*/
    		  //alert("유형 변경");
    		  adustr = "";
    		  price -= aduprice;
			  adustr = "\u00A0" + adutype + "\u00A0" + aducnt;
			  $("#auditType").empty();
			  $("#auditType").append(youstr).append(senstr).append(kidstr).append(adustr);  
    	  } else if((adutemp != aducnt) && (infotxt.indexOf('성인') != -1)) { /*같은유형 변경*/
        	  //alert("같은유형");
        	  adustr = adutype + "\u00A0" + aducnt;
	          $("#auditType").empty();
	          $("#auditType").text(adustr);
          }
      } else {
    	  adustr = "";
    	  price -= aduprice;
    	  $("#auditType").empty();
    	  $("#auditType").append(youstr).append(senstr).append(kidstr);
      }
      adutemp = aducnt;
    }// peocnt>5 if end
    aduprice = 10000 * aducnt;
  }//hasClass false if end
  price += aduprice;
  $("#total").empty();
  $("#total").text(price);
});// click() end

$(".youth").click(function() {
  youtype = $(this).attr('value').trim();
  youcnt = $(this).text();
  // String to Number
  youcnt *= 1;
  
  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") != true)  {
    // 같은유형에서 값변경할 때 기존의값에서 차감
    peocnt -= youtemp;
    peocnt += youcnt;
    
    if (peocnt > 5) {
      peocnt -= youcnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      youcnt = 0;
    } else {
      $(".youth").removeClass("on");
      $(this).addClass("on");

      // 선택된 인원이랑 유형 append하기 ,로 엮기
      var infotxt = $("#auditType").text();
      if (youcnt != 0) {
    	  if ((infotxt.indexOf('-') != -1)) { /*최초클릭*/
    		  youstr = youtype + "\u00A0" + youcnt; // \u00A0 띄어쓰기
	          $("#auditType").empty();
	          $("#auditType").text(youstr);
          } else if(infotxt.indexOf('청소년') == -1){ /*다른 유형 추가*/
			  youstr = "\u00A0" + youtype + "\u00A0" + youcnt;
			  infotxt += youstr;
			  $("#auditType").empty();
			  $("#auditType").text(infotxt);
    	  } else if((youtemp != youcnt) && (infotxt.indexOf('청소년') != -1)) { /*유형 변경*/
    		  youstr = "";
    		  price -= youprice;
			  youstr = "\u00A0" + youtype + "\u00A0" + youcnt;
			  $("#auditType").empty();
			  $("#auditType").append(adustr).append(senstr).append(kidstr).append(youstr);
    	  } else if((youtemp != youcnt) && (infotxt.indexOf('청소년') != -1)) { /*같은유형 변경*/
        	  youstr = youtype + "\u00A0" + youcnt;
	          $("#auditType").empty();
	          $("#auditType").text(youstr);
          }
      } else {
    	  youstr = "";
    	  price -= youprice;
    	  $("#auditType").empty();
    	  $("#auditType").append(adustr).append(senstr).append(kidstr);
      }
      youtemp = youcnt;
    }// peocnt>5 if end
    youprice = 8000 * youcnt;
  }//hasClass false if end
  price += youprice;
  $("#total").empty();
  $("#total").text(price);
});// click() end

$(".senior").click(function() {
  sentype = $(this).attr('value').trim();
  sencnt = $(this).text();
  // String to Number
  sencnt *= 1;

  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") != true)  {
    // 같은유형에서 값변경할 때 기존의값에서 차감
    peocnt -= sentemp;
    peocnt += sencnt;

    if (peocnt > 5) {
      peocnt -= sencnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      sencnt = 0;
    } else {
      $(".senior").removeClass("on");
      $(this).addClass("on");

      // 선택된 인원이랑 유형 append하기 ,로 엮기
      var infotxt = $("#auditType").text();
      if (sencnt != 0) {
    	  if ((infotxt.indexOf('-') != -1)) { /*최초클릭*/
    		  senstr = sentype + "\u00A0" + sencnt; // \u00A0 띄어쓰기
	          $("#auditType").empty();
	          $("#auditType").text(senstr);
          } else if(infotxt.indexOf('우대') == -1){ /*다른 유형 추가*/
			  senstr = "\u00A0" + sentype + "\u00A0" + sencnt;
			  infotxt += senstr;
			  $("#auditType").empty();
			  $("#auditType").text(infotxt);
    	  } else if((sentemp != sencnt) && (infotxt.indexOf('우대') != -1) ) { /*유형 변경*/
    		  senstr = "";
    		  price -= senprice;
			  senstr = "\u00A0" + sentype + "\u00A0" + sencnt;
			  $("#auditType").empty();
			  $("#auditType").append(adustr).append(youstr).append(kidstr).append(senstr); 
    	  } else if((sentemp != sencnt) && (infotxt.indexOf('우대') != -1)) { /*같은유형 변경*/
        	  senstr = sentype + "\u00A0" + sencnt;
	          $("#auditType").empty();
	          $("#auditType").text(senstr);
          }
      } else {
    	  senstr = "";
    	  price -= senprice;
    	  $("#auditType").empty();
    	  $("#auditType").append(adustr).append(youstr).append(kidstr);
      }
	  sentemp = sencnt;
    }// peocnt>5 if end
    senprice = 6000 * sencnt;
  }//hasClass false if end
  price += senprice;
  $("#total").empty();
  $("#total").text(price);
});// click() end

$(".kid").click(function() {
  kidtype = $(this).attr('value').trim();
  kidcnt = $(this).text();
  // String to Number
  kidcnt *= 1;
  
  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") != true)  {
    // 같은유형에서 값변경할 때 기존의값에서 차감
    peocnt -= kidtemp;
    peocnt += kidcnt;

    if (peocnt > 5) {
      peocnt -= kidcnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      kidcnt = 0;
    } else {
      $(".kid").removeClass("on");
      $(this).addClass("on");

      // 선택된 인원이랑 유형 append하기 ,로 엮기
      var infotxt = $("#auditType").text();
      if (kidcnt != 0) {
    	  if ((infotxt.indexOf('-') != -1)) { /*최초클릭*/
    		  kidstr = kidtype + "\u00A0" + kidcnt; // \u00A0 띄어쓰기
	          $("#auditType").empty();
	          $("#auditType").text(kidstr);
          } else if(infotxt.indexOf('어린이') == -1){ /*다른 유형 추가*/
    		  kidstr = "\u00A0" + kidtype + "\u00A0" + kidcnt;
			  infotxt += kidstr
			  $("#auditType").empty();
			  $("#auditType").text(infotxt);
    	  } else if((kidtemp != kidcnt) && (infotxt.indexOf('어린이') != -1)) { /*유형 변경*/
    		  kidstr = "";
    		  price -= kidprice;
    		  kidstr = "\u00A0" + kidtype + "\u00A0" + kidcnt;
			  $("#auditType").empty();
			  $("#auditType").append(adustr).append(youstr).append(senstr).append(kidstr);  
    	  } else if((kidtemp != kidcnt) && (infotxt.indexOf('어린이') != -1)) { /*같은유형 변경*/
        	  kidstr = kidtype + "\u00A0" + kidcnt;
	          $("#auditType").empty();
	          $("#auditType").text(kidstr);
          }
      } else {
    	  kidstr = "";
		  price -= kidprice;
    	  $("#auditType").empty();
    	  $("#auditType").append(adustr).append(youstr).append(senstr);
      }
      kidtemp = kidcnt;
    }// peocnt>5 if end
    kidprice = 5000 * kidcnt;
  }//hasClass false if end
  price += kidprice;
  $("#total").empty();
  $("#total").text(price);
});//click() end

/******************* 인원선택 AJAX END *******************/

/******************* 금액 AJAX *******************/

/******************* 금액 AJAX END *******************/
