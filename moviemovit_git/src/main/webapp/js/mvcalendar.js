//Calendar date 객체 생성하기
var Calendar = new Date();

//getDay() 메서드는 (일:0 ~ 토:6)을 반환하니 0번째 인덱스부터 일요일을 넣는다
var day_of_week= ['일','월','화','수','목','금','토'];

//getMonth() 메서드는 (1월:0 ~ 12월:11)을 반환하니 0번째 인덱스부터 1월을 넣는다
var month_of_year = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];

var year = Calendar.getFullYear();  //yyyy년도
var month = Calendar.getMonth();    //0~11 (1~12월 인덱스)
var today = Calendar.getDate();     //1~31 (1~31일)
var weekday = Calendar.getDay();    //0~6(일~토 인덱스)

Calendar.setDate(1);  //달력은 1일부터 표시

var DAYS_OF_WEEK = 7; //일주일은 7일
var DAYS_OF_MONTH = 31; //한달은 최대 31일
var str;

//tr
var TR_start = "<tr>";
var TR_end = "</tr>";

//td css클래스를 이용하여 요일마다 색을 다르게 준다
var TD_week_start = "<td class='week'>";        //일~토 나타낼 td
var TD_blank_start = "<td class='blank'>";      //blank(1일 이전의 날짜)
var TD_today_start = "<td class='today'>";      //오늘 날짜
var TD_day_start = "<td class='day'>";          //평일
var TD_saturday_start = "<td class='saturday'>";//토
var TD_sunday_start = "<td class='sunday'>";    //일
var TD_end = "</td>";                           //테이블 만들기

str = "<table width=500px border=1 cellspacing=0 cellpadding=0 bordercolor=bbbbbb><tr><td style='text-align:center'>";
str += "<strong>" + year + ". " + month_of_year[month] + "</strong>";
str += "<table class='calendar' border=0 cellspacing=0 cellpadding=2>";

//본격적인 tr시작. 맨첫줄은 요일
str += TR_start;  //요일 td

for(var i=0; i<DAYS_OF_WEEK; ++i) {
  //7번 돌아가면서 day_of_week의 값을 빼내온다
  str += TD_week_start + day_of_week[i] + TD_end;
}//for end

//요일이 끝나면 한줄 내려가기 위해</tr>
str += TR_end;

//1일이 시작하기 전까지의 이전 요일들을 blank
for(var i=0; i<Calendar.getDay(); ++i) {
  str += TD_blank_start + TD_end;
}//for end

//1일 시작
for(var i=0; i<DAYS_OF_MONTH; ++i) {
  //날짜가 i보다 클때만 표현! 날짜가 i보다 작다는건 다음 달로 넘어가서 1일이 되었다는 의미
  if(Calendar.getDate() > i) {
    var day = Calendar.getDate(); //날짜
    var week_day = Calendar.getDay(); //요일
    
    //만약 일요일이면 다음행
    if(week_day == 0) {
      str += TR_start;
    }
    
    //오늘 날짜라면
    if(day == today) {
      str += TD_today_start + day + TD_end;
    }else {
      switch(week_day) {
      case 0: // 일요일
        str += TD_sunday_start + day + TD_end;
        break;
      case 6: // 토요일
        str += TD_saturday_start + day + TD_end;
        str += TR_end; // 토요일이면 </tr>
        break;
      default: // 평일
        str += TD_day_start + day + TD_end;
        break;
      }
    }
  }//if end
  
  //다음 날짜로 넘어간다
  Calendar.setDate(Calendar.getDate() + 1);
}//for end

str += "</table></td></tr></table>";
//document.write(str);
document.getElementById('#3rd_area').write(str);