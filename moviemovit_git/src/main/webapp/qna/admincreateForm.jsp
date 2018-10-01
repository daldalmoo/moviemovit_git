<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header1.jsp"%>
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../js/me.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
h1{
  font-family: 'Lato', Calibri, Arial, sans-serif;
  line-height: 1.5;
 
  padding: 5px 5px;
  font-weight:bold;
  text-align:center;
}

th{
font-size:1.4em;
text-align:center;
}

.cbp-mc-column{
margin:auto;
}

select .abc{
width:auto;
}

.cbp-mc-column input:nth-child(1){
float:left;

}

.home-section{
padding-top:0px;}
</style>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

<div class="home-section text-center ">
	<form class="cbp-mc-form" method="POST" id="editor" action="./admincreate.do">
			<h1>QnA</h1>

		<table class="cbp-mc-column">	
			<tr>
			
				<th> 제목</th>
				   <td width="120px">
				   <select id="qType" class="abc" name="qType"  style="width:125px;">
			    <option value="q1">예매</option>
			    <option value="q2">회원이용</option>
			    <option value="q3">극장이용</option>
			    <option value="q4">기타</option>
			    </select></td>
				<td width="500px"><input type="text" id="title" name="title" size="50"  placeholder="제목" style="width:100%;" ></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="2" width="50px"><input type="text" id="uid" name="uid" style="width:100%;" ></td>
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea name="content" id="content" style="width: 700px; height: 400px;"></textarea>
				

</td>

		</table>
		<div class="cbp-mc-submit-wrap">
			<input class="cbp-mc-submit" id="qnabutton" type="submit" value="등록">
			 <input	class="cbp-mc-submit" type="button" value="취소" onclick="location.href='./adminlist.do'">
		</div>
	
	</form>
</div>

<!-- <script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "s_e",
            sSkinURI: "../resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#noticebutton").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["s_e"].exec("UPDATE_CONTENTS_FIELD", []);
            var el = document.createElement('html');
          el.innerHTML = editor_object.getById["s_e"].elPlaceHolder.value; 

            //폼 submit
            $("#editor").submit();
        });
    });
</script>  -->

</body>