/*180828 경민 mvscript.js*/
/* <script>태그를 생략한다*/
/*
	자바스크립트에서는 유효성검사를 꼼꼼히 해야한다!!
	서버로 넘어가기전에 JS를 통해 걸러내야한다!!
*/

// 쿠폰 등록 전 유효성 검사
// coupon/couponForm.jsp 에서 사용
function couponCheck(f) {
  // 회원아이디 글자갯수가 5~10 사이인지?
  var uid = f.uid.value;
  uid = uid.trim(); //공백 지우기

  if(uid.length<5 || uid.length>10) {
    alert("아이디 글자수를 확인해주세요.\n(5자 이상 10자 이하)");
    f.uid.value="";  //초기화
    f.uid.focus();   //커서 생성
    return false;
  }
  
  return true;  // 유효성 검사 모두 통과
}//couponCheck

