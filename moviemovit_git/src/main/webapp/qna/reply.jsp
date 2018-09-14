<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>


<head>

<script type="text/javascript" src="../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript" src="../js/me.js" charset="utf-8"></script>
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

</style>

</head>


<!-- 인풋타입 가져와서 create디자인이랑 통일1 -->
<form class="cbp-mc-form" name="editor" method="POST" action="./reply.do" >
	<h2>공지사항</h2>
	
  <input type="hidden" name="groupNum" value="${dto.groupNum}"/>
  <input type="hidden"  name="indent" value="${dto.indent}"/>
  <input type="hidden" name="qType" value="${dto.qType}"/>
  <input type="hidden" name="groupNo" value="${dto.groupNo}"/>
  
	<table class="cbp-mc-column">
	<tr>
	<th>공지사항번호</th>
	<td><input type="text" id="qCode"name="qCode" size="50"   value="${dto.qCode }" readonly></td>
	</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" id="title"name="title" size="50"   value=" ${dto.title }" readonly></td>
		</tr>
		<tr>
			<th>작성자</th>
	         <td><input type="text" id="uid"name="uid" size="50" value="${dto.uid }" ></td>
			</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content" >${dto.content}</textarea></td>
		</tr>
	</table>
	

	<div class="bottom">
		<input type="button" class="cbp-mc-submit"  value="목록" onclick="location.href='list.do'">
		<input type="submit" id="noticebutton" class="cbp-mc-submit" value="답변등록">
		<input type="button" class="cbp-mc-submit" value="삭제" onclick="location.href='delete.do?qCode=${dto.qCode}'">
	
        
               
	</div>

</form>

    <%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>    
        
        