<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header1.jsp"%>
<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>


.header { /* 영화관목록  */
	background-color: #3366cc;
	color: white;
	font-size: 1.5em;
	padding: 1rem;
	text-align: center;
	text-transform: uppercase;
	
}

/* img { 
	height: 100px;
	width: 150px;
}
 */
.table-users {
	border: 1px solid #327a81;
	border-radius: 10px;
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	max-width: calc(100% - 2em);
	margin: 1em auto;
	overflow: hidden;
	width: 100%;
	text-aling:center;
}

table {
	width: 100%;
}

table td, table th {
	color: #2b686e;
	padding: 10px;
}

table td {
	text-align: center;
	vertical-align: middle;
}

table td:last-child {
	font-size: 0.95em;
	line-height: 1.4;
	text-align: center;
}

table th {
	background-color: #bfe1ff;
	font-weight: 300;
	text-align: center;
	font-weight: bold;
}

table tr:nth-child(2n) {
	background-color: white;
}

table tr:nth-child(2n+1) {
	background-color: #bfe1ff;
}

/*공개,수정,삭제 스타일*/
.cbp-mc-button {
	background: #40bf80;
	border: none;
	color: #fff;
	width: auto;
	cursor: pointer;
	text-transform: uppercase;
	display: inline-block;
	padding: 5px 5px;
	font-size: 0.8em;
	border-radius: 2px;
	letter-spacing: 1px;
}

.cbp-mc-button:hover {
	background: #2b8256;
}

@media screen and (max-width: 700px) {
	table, tr, td {
		display: block;
	}
	td:first-child {
		position: absolute;
		top: 50%;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
		width: 100px;
	}
	td:not (:first-child ) {
		clear: both;
		margin-left: 100px;
		padding: 4px 20px 4px 90px;
		position: relative;
		text-align: left;
	}
	td:not (:first-child ):before {
		color: #91ced4;
		content: '';
		display: block;
		left: 0;
		position: absolute;
	}

	/* 사이즈 줄일때 나타나는 아이*/
	td:nth-child(2):before {
		content: '브랜드:';
	}
	td:nth-child(3):before {
		content: '지점:';
	}
	td:nth-child(4):before {
		content: '별점:';
	}
	td:nth-child(5):before {
		content: '주소:';
	}
	td:nth-child(6):before {
		content: '문의전화:';
	}
	tr {
		padding: 10px 0;
		position: relative;
	}
	tr:first-child {
		display: none;
	}
}

@media screen and (max-width: 500px) {
	.header {
		background-color: transparent;
		color: white;
		font-size: 2em;
		font-weight: 700;
		padding: 0;
		text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
	}
/* 	img {
		border: 3px solid;
		border-color: #daeff1;
		height: 100px;
		margin: 0.5rem 0;
		width: 100px;
	} */
	td:first-child {
		background-color: #c8e7ea;
		border-bottom: 1px solid #91ced4;
		border-radius: 10px 10px 0 0;
		position: relative;
		top: 0;
		-webkit-transform: translateY(0);
		transform: translateY(0);
		width: 100%;
	}
	td:not (:first-child ) {
		margin: 0;
		padding: 5px 1em;
		width: 100%;
	}
	td:not (:first-child ):before {
		font-size: .8em;
		padding-top: 0.3em;
		position: relative;
	}
	td:last-child {
		padding-bottom: 1rem !important;
	}
	tr {
		background-color: white !important;
		border: 1px solid #6cbec6;
		border-radius: 10px;
		box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
		margin: 0.5rem 0;
		padding: 0;
	}
	.table-users {
		border: none;
		box-shadow: none;
		overflow: visible;
	}
}
.home-section{
padding-top:0px;}
</style>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

<div class="home-section text-center ">
<div class="table-users">
<div class="header">QnA</div>
<table>
	<tr>
		<th>No</th>
		<th style="width:407px;">제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		
	</tr>
	
	<c:forEach var="dto" items="${list }">
		<tr class="brandtest">
			<td> <a href="adminread.do?qCode=${dto.qCode}">${dto.qCode}</a></td>
		<%-- 	<td>   <c:choose>
               <c:when test="${dto.qType == 'q1'}">
               예매 :
               </c:when>
               <c:when test="${dto.qType =='q2'}">
               회원이용 :
               </c:when>
               <c:when test="${dto.qType == 'q3'}">
               극장이용 :
               </c:when>
               <c:when test="${dto.qType == 'q4'}">
             기타 :
               </c:when>
           </c:choose></td> --%>

				<td style="text-align: left"><c:if test="${dto.indent > 0}">
						<c:forEach begin="1" end="${dto.indent}">
							<i class="fa fa-comment fa-2x" aria-hidden="true"></i>
							<!-- 답변글일경우 글 제목 앞에 공백을 준다. -->

						</c:forEach>
						<!--     <i class="fa fa-caret-right" aria-hidden="true"></i> -->
					</c:if> <a href="adminread.do?qCode=${dto.qCode}"> <c:choose>
							<c:when test="${dto.qType == 'q1'}">
               <strong>예매 :</strong>
               </c:when>
							<c:when test="${dto.qType =='q2'}">
               <strong>회원이용 :</strong>
               </c:when>
							<c:when test="${dto.qType == 'q3'}">
               <strong>극장이용 :</strong>
               </c:when>
							<c:when test="${dto.qType == 'q4'}">
             <strong>기타 :</strong>
               </c:when>
						</c:choose> 
						                  ${dto.title }</a></td>
				<td> <a href="adminread.do?qCode=${dto.qCode}">${dto.content }</a></td>
			<td>${dto.uid }</td>
			<td>${dto.wdate }</td>
		  

		</tr>
	</c:forEach>
</table>
</div>

 <div>
                    <c:if test="${qnapage.curPage ne 1 }">
                        <a href="adminlist.do?curpage=${noticepage.startPage }" ><i class="fa fa-angle-double-left fa-2x" aria-hidden="true"></i></a> 
                    </c:if>
                    <c:if test="${qnapage.curPage ne 1}">
                        <a href="adminlist.do?curpage=${noticepage.prevPage }" ><i class="fa fa-angle-left fa-2x" aria-hidden="true"></i></a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${qnapage.startPage }" end="${qnapage.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  qnapage.curPage}">
                                <span style="font-weight: bold;"><a href="adminlist.do?curPage=${pageNum }" >${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="adminlist.do?curPage=${pageNum }">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${qnapage.curPage ne qnapage.pageCnt && qnapage.pageCnt > 0}">
                        <a href="adminlist.do?curPage=${qnapage.nextPage}"><i class="fa fa-angle-right fa-2x" aria-hidden="true"></i></a> 
                    </c:if>
                        <c:if test="${qnapage.curRange ne endPage}">
                        <a href="adminlist.do?curPage=${qnapage.endPage}"><i class="fa fa-angle-double-right fa-2x" aria-hidden="true"></i></a> 
                    </c:if>
                </div>
                
                <div>
                    총 게시글 수 : ${qnapage.listCnt }
                </div>
</div>
</body>