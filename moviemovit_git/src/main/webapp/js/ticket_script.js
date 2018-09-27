// --------------------- 예매하기 AJAX File
$.ajaxSetup({datatype:"text"});
   
// 전역변수
var MCODE = "";   // 선택된 영화코드
var CINETAB = 1;  // 선택된 극장 종류 : 1 전체극장, 2 상영극장, 3 체인별
var CINEADDR1 = "all";// 선택된 주소1
var CINECODE = "";// 선택된 극장코드

/* ----------- 영화선택 부분 AJAX ---------------- */
// 영화목록 새로고침
function ResetMovie() {
  MCODE = "";
  $("#movie_area li").removeClass("on");

  // 극장리스트 스타일 복귀
  $("#cinema_area .main_list li").css({'font-weight':'normal','color':'black'});
  
  // 상영극장 클릭되어 있으면 극장없음 띄우기
  if(CINETAB==2) {
    $("#cinema_area .nocinema").css('display','block');
    $("#cinema_area .cinema_addr1").css('display','none');
    $("#cinema_area .main_list").css('display','none');
  }//if end
  
}//ResetMovie() end

// 영화선택시 호출
$("#movie_area .SelMovieList").click(function(){
  //alert("SelMovieList(mCode) 호출. $(this).val():" + $(this).val());
  if($(this).hasClass("on")==true) {  // 이미 선택된 영화라면 on class 지움
    ResetMovie();
  } else {  // 영화를 선택했을 때
    $("#movie_area li").removeClass("on");
    $(this).addClass("on");
    MCODE = $(this).val();  // 전역변수 할당
    
    // 극장 목록 설정
    if(CINETAB==1) {  // 전체극장
      cinetab1mainlist();
    } else if(CINETAB==2) {  // 상영극장
      cinetab2mainlist();
    } else if(CINETAB==3) {  // 체인별
      cinetab3mainlist();
    }//if end
    
    // 날짜 설정
    
  }//if end
});//SelMovieList click() end

//영화선택하면 해당 포스터가져와서 영화정보에 뿌려줌 

/* ----------- 영화선택 부분 AJAX END ------------ */

/* ----------- 극장선택 부분 AJAX ---------------- */
// 극장목록 새로고침
function ResetCinema() {
  //alert("ResetCinema() 클릭");
  // 극장주소1 : 전국
  CINEADDR1="all";
  $("#cinema_area .addr1selected span").html($(".addr1list li:first-child").html());
  
  // 극장종류 : 전체극장
  CINETAB = 1;
  cinemaSelect(1);
  
}//ResetCinema() end

// 극장종류 선택시 호출
function cinemaSelect(i) {
  //alert("cinemaSelect() 클릭");
  for(var j=1; j<=3; j++) {
    $(".t_tab"+j+" a").removeClass("on");
  }//for end
  $(".t_tab"+i+"t a").addClass('on');
  
  CINETAB = i;
  if(CINETAB==1) {  // 전체극장
    cinetab1mainlist();
  } else if(CINETAB==2) {  // 상영극장
    cinetab2mainlist();
  } else if(CINETAB==3) {  // 체인별
    cinetab3mainlist();
  }//if end
}//cinemaSelect() end

// 주소1 class="click" 일때 주소1 목록 보여주기
$("#cinema_area .addr1selected").click(function(){
  $(this).toggleClass("click");
  $("#cinema_area .addr1list").toggleClass("click");
});//.addr1selected click() end

// 주소1 목록에서 클릭할때
$("#cinema_area .addr1list li").click(function(){
  //alert(".cinema_addr1 .addr1list li html : "+$(this).html());
  CINEADDR1 = $(this).attr("value");  // 전역변수 설정
  
  // 클릭한 주소가 클릭된 주소로 보여짐
  var msg = $(this).html();
  $(".addr1selected span").html(msg);
  
  // 주소1 목록 접기
  $(".cinema_addr1 .addr1selected").removeClass("click");
  $("#cinema_area .addr1list").removeClass("click");
  
  // 극장 목록 가져오기
  if(CINETAB==1) {  // 전체극장
    cinetab1mainlist();
  } else if(CINETAB==2) {  // 상영극장
    cinetab2mainlist();
  } else if(CINETAB==3) {  // 체인별
    cinetab3mainlist();
  }//if end
  
});//.addr1list li click() end

// 주소1 변경 -> 영화관 목록 변경
/*$("#cinema_area .addr1selected span").on('DOMSubtreeModified',function(){  // 변경될때마다 호출
  //alert("#cinema_area .addr1selected change 됨");
});//.addr1selected click() end */

function cinetab1mainlist() {  // 전체극장 선택되어있을때 호출
  // display 처리
  $("#cinema_area .nocinema").css('display','none');
  $("#cinema_area .cinema_addr1").css('display','block');
  $("#cinema_area .main_list").css('display','block');
  
  // 주소1에 맞는 극장 목록 가져오기
  $.post("./cinemaListFromAddr1.do","addr1="+CINEADDR1, mainList);//post end
  
  // 영화선택시 상영극장 gray
  graycinema();
  
}//cinetab1mainlist() end

function cinetab2mainlist() {  // 상영극장 선택되어있을때 호출
  if(MCODE=="") {  // 영화또는날짜 선택안됐을경우 상영극장 없음 보이기
    $("#cinema_area .nocinema").css('display','block');
    $("#cinema_area .cinema_addr1").css('display','none');
    $("#cinema_area .main_list").css('display','none');
  } else {  // 상영극장 목록 가져오기
    $("#cinema_area .nocinema").css('display','none');
    $("#cinema_area .cinema_addr1").css('display','block');
    $("#cinema_area .main_list").css('display','block');
    $.post("./cinemaListFromMovieAddr1.do","mCode="+MCODE+"&addr1="+CINEADDR1,mainList);
  }//if end
}//cinetab2mainlist() end

function cinetab3mainlist() {  // 체인별극장 선택되어있을때 호출
  //display 처리
  $("#cinema_area .nocinema").css('display','none');
  $("#cinema_area .cinema_addr1").css('display','block');
  $("#cinema_area .main_list").css('display','block');
}//cinetab3mainlist() end

// 극장목록 보여주기
function mainList(data) {  // Controller에서 msg 값 data로 받아옴
//alert("mainList() 호출. data:"+data);
  $(".main_list").html(data);
}//mainList() end

// 상영극장 굵게 검은색, 그외 회색 처리
function graycinema() {
  //alert("graycinema 호출");
  //0.01초 시간지연. 이전 코드에서 html이 모두 로딩되길 기다린 후 실행
  setTimeout(execute, 10); 
  function execute(){
     if(MCODE!="") {  // 영화가 선택되어 있으면
       $.post("./graycinemalist.do","mCode="+MCODE,function(cineCodestr) {
        var cineCode = cineCodestr.split("|");
        $(".main_list li").css({'font-weight':'normal','color':'#c0c0c0'});  // 모든 극장 회색 처리
        for(var i=0; i<cineCode.length; i++) {  // 상영하는 극장만 굵게 검은색 처리
          $(".main_list li[value='"+cineCode[i].trim()+"']").css({'font-weight':'bold','color':'black'});
        }//for end
       });//post end
     }//if end
  }//execute() end
}//graycinema() end

/* ----------- 극장선택 부분 AJAX END ------------ */

/* ---------영화선택 -> 영화정보 포스터 가져오기 AJAX ---------*/

function moiveInfo_poster(data) {
  //alert(data);
  //$("#thumb_poster").html(data);
}//moiveInfo_poster() end

/* ---------영화선택 -> 영화정보 포스터 가져오기 AJAX END -----*/

/* --------------- 날짜선택 AJAX  ------------------------*/

$(".calendar td").click(function() {
  var selYear = $("#calYear").attr('value');
  var selMonth = $("#calMonth").attr('value');
  var selDate = $(this).text();
  alert(selYear);
  alert(selMonth);
  alert(selDate);
  
  // 선택된 날짜 class="on", 이미 선택된 인원이면 on class 지움
  if($(this).hasClass("on")==true) {
    $(this).removeClass("on");
  } else {
    $(".calendar td").removeClass("on");
    $(this).addClass("on");
  }//if end
});//click() end

/* --------------- 날짜선택 AJAX END ---------------------*/

/* --------------- 상영시간표 AJAX ---------------------*/
//상영시간표 선택하면 인원선택의 li부분 font-weight bold하기!
//임시로 ex)8관 눌렀을 때 활성화되는걸로 작업중
$(".cinemainfo .cinema_logo").click(function() {
  $("#price_lst_area td").css("font-weight","bold");
  $("#price_lst_area li").css("color","black");
});//click() end
/* --------------- 상영시간표 AJAX END ---------------------*/

/* --------------- 인원선택 AJAX ---------------------*/
//최대 5명으로 제한, 영화정보에 ,로 append해서 띄우게
//toggleClass
var peotype = ""; //유형
var peocnt = 0;   //인원 
var str = ""      //영화정보 인원선택
  
var adutemp = 0;  //같은유형에서 변경할때 임시변수
var youtemp = 0;
var sentemp = 0;
var kidtemp = 0;

/*인원선택할 때 str을 각 유형별로 따로줘야할듯*/
$(".adult").click(function(){
  adutype = $(this).attr('value').trim();
  aducnt = $(this).text();
  //String to Number
  aducnt *= 1;
  
  //$(".main_list li[value='"+cineCode[i].trim()+"']").css({'font-weight':'bold','color':'black'})
  
  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if($(this).hasClass("on") == true) {
    peocnt -= aducnt;
    $(this).removeClass("on");
    
    /*선택된 adutype을 공백으로 바꾸기-유형별 별도의 변수생성*/
    //$("#select_people_txt").replace("성인  "," ");
    
  } else {
    //초기화
    if(aducnt == 0) {
      aducnt *= 0;
      /*영화정보 인원선택에 들어가면 안됨*/
    }
    
    //같은유형에서 값변경할 때 기존의값에서 차감
    peocnt -= adutemp;
    peocnt += aducnt;
    
    if(peocnt > 5) {
      peocnt -= aducnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      aducnt = 0;
    } else {
      $(".adult").removeClass("on");
      $(this).addClass("on");
      //값 변경시 임시변수에 현재선택값 할당
      adutemp = aducnt;
      
      //선택된 인원이랑 유형 append하기 ,로 엮기   
      var infotxt = $("#select_people_txt").text();
      if(infotxt.indexOf('-') != -1) {
        str = youtype + "\u00A0" + youcnt; //\u00A0 띄어쓰기
        $$("#select_people_txt").empty();
        $("#select_people_txt").text(str);
      }else {
        str = "," + youtype + "\u00A0" + youcnt;
        $("#select_people_txt").append(str);
      }
      
    }//peocnt>5 if end

  }//최초클릭 if end
  
});//click() end

$(".youth").click(function(){
  //var tempcnt = 0;
  youtype = $(this).attr('value').trim();
  youcnt = $(this).text();
  youcnt *= 1;
  
  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") == true) {
    peocnt -= youcnt;
    $(this).removeClass("on");
  } else {
    //초기화
    if(youcnt == 0) {
      youcnt *= 0;
    }
    
    peocnt -= youtemp;
    peocnt += youcnt;
  
    if(peocnt > 5) {
      peocnt -= youcnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      youcnt = 0;
    } else {
      $(".youth").removeClass("on");
      $(this).addClass("on");
      
      youtemp = youcnt;
      
      //선택된 인원이랑 유형 append하기 ,로 엮기   
      var infotxt = $("#select_people_txt").text();
      if(infotxt.indexOf('-') != -1) {
        str = youtype + "\u00A0" + youcnt; //\u00A0 띄어쓰기
        $("#select_people_txt").text(str);
      }else {
        str = "," + youtype + "\u00A0" + youcnt;
        $("#select_people_txt").append(str);
      }
    }//if end
    
  }//if end

});//click() end

$(".senior").click(function(){
  //var tempcnt = 0;
  sentype = $(this).attr('value').trim();
  sencnt = $(this).text();
  sencnt *= 1;
  
  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") == true) {
    peocnt -= sencnt;
    $(this).removeClass("on");
  } else {
    //초기화
    if(sencnt == 0) {
      sencnt *= 0;
    }
    
    peocnt -= sentemp;
    peocnt += sencnt;
  
    if(peocnt > 5) {
      peocnt -= sencnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      sencnt = 0;
    } else {
      $(".senior").removeClass("on");
      $(this).addClass("on");
      
      sentemp = sencnt;
      
      //선택된 인원이랑 유형 append하기 ,로 엮기   
      var infotxt = $("#select_people_txt").text();
      if(infotxt.indexOf('-') != -1) {
        str = sentype + "\u00A0" + sencnt; //\u00A0 띄어쓰기
        $("#select_people_txt").text(str);
      }else {
        str = "," + sentype + "\u00A0" + sencnt;
        $("#select_people_txt").append(str);
      }
    }//if end
    
  }//if end

});//click() end

$(".kid").click(function(){
  //var tempcnt = 0;
  kidtype = $(this).attr('value').trim();
  kidcnt = $(this).text();
  kidcnt *= 1;
  
  // 선택된 인원 class="on", 이미 선택된 인원이면 on class 지움
  if ($(this).hasClass("on") == true) {
    peocnt -= kidcnt;
    $(this).removeClass("on");
  } else {
    //초기화
    if(kidcnt == 0) {
      kidcnt *= 0;
    }
    
    peocnt -= kidtemp;
    peocnt += kidcnt;
  
    if(peocnt > 5) {
      peocnt -= kidcnt;
      $(this).removeClass("on");
      alert("인원은 5명까지 선택가능합니다.");
      kidcnt = 0;
    } else {
      $(".kid").removeClass("on");
      $(this).addClass("on");
      
      kidtemp = kidcnt;
      
      //선택된 인원이랑 유형 append하기 ,로 엮기   
      var infotxt = $("#select_people_txt").text();
      if(infotxt.indexOf('-') != -1) {
        str = kidtype + "\u00A0" + kidcnt; //\u00A0 띄어쓰기
        $("#select_people_txt").text(str);
      }else {
        str = "," + kidtype + "\u00A0" + kidcnt;
        $("#select_people_txt").append(str);
      }
    }//if end

  }//if end

});//click() end

/* --------------- 인원선택 AJAX END ---------------------*/

