<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>


<head>
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript" src="../js/me.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>

.cbp-mc-column td{
	padding:10px;
	
}
.abc{
 font-style: italic;
}
h2{
  font-family: 'Lato', Calibri, Arial, sans-serif;
  line-height: 1.5;
 
  padding: 5px 5px;
  font-weight:bold;
  text-align:center;
}
th{
font-size:1.4em;
}

.cbp-mc-column input{
margin:auto;
}
/* input .cbc-mc-submit{
margin-left:100;} */
</style>

</head>


	<form class="cbp-mc-form"  method="POST" id="editor" action="./create.do" enctype="multipart/form-data">
			<h1>QnA</h1>

		<table class="cbp-mc-column">	
			<tr>
				<th> 제목</th>
				<td><input type="text" id="title"name="title" size="50"  placeholder="공지사항제목" ></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="uid"name="uid" size="50" ></td>
			<tr>
				<th>내용</th>
				<td><textarea name="s_e" id="s_e" style="width: 700px; height: 400px;"></textarea>
				

</td>
			</tr>
            <tr>
            <th>공개여부</th>
            <td><select class="abc" id="open" name="open">
            <option value="Y">공개</option>
            <option value="N">비공개</option>
            </select>
</td></tr>
		</table>
		<div class="cbp-mc-submit-wrap">
			<input class="cbp-mc-submit" id="noticebutton" type="submit" value="등록">
			 <input	class="cbp-mc-submit" type="button" value="취소" onclick="location.href='./list.do'">
		</div>

	
	</form>

<script type="text/javascript">
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
</script> 

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>