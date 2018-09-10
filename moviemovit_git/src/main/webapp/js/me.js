
/*app.use(function (req, res, next) {
  if (req.url && req.url.indexOf('.htm') > -1) {
    res.header('Content-Type', 'text/html');
  }
  next();
});*/
$(document).ready(function(){
	//게시물 입력공간의 게시글 입력 폼
	var meTitle = $('#title');
    var meContent = $('#content');
	//게시물 입력 공간의 게시버튼
	var mePostBtn = $('#noticebutton');

	//게시 버튼 클릭 이벤트
	mePostBtn.click(function(){
			if(meTitle.val() == ''){
			alert('제목을 입력하세요');
			meTitle.focus();
			return false;
		}
		
		
		if(meContent.val() == ''){
			alert('내용을 입력하세요');
			meContent.focus();
			return false;
		}
		//백엔트 프로젝트에서 게시물 등록 기능 구현
	});
});