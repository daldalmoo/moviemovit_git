<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../header.jsp"%>




<div class="title">수정</div>
<div class="content">
	<dl>
		<dd>${msg1 != null ? img : "" } ${msg1 }</dd>
		<dd>${msg2 != null ? img : "" } ${msg2 }</dd>
		<dd>${msg3 != null ? img : "" } ${msg3 }</dd>
	</dl>
	<p>
		${link1 } ${link2 } ${link3 }
	</p>
</div>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>
