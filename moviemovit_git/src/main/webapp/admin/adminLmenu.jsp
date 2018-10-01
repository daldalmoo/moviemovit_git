<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../user/auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta charset="UTF-8">
<title>adminLmenu.jsp</title>
<style>
a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: blue;
}

a:active {
	text-decoration: underline;
	color: black;
}

  /*   .menu a{cursor:pointer;} */
     li ul{display:none;}
    
     li:hover ul {
display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

ul{
   list-style:none;
   padding-left:0px;
   }

</style>

<!-- <script>
    $(document).ready(function(){
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( menu.is(":visible") ){
                menu.slideUp();
            }else{
                menu.slideDown();
            }
        }).mouseover(function(){
            $(this).next("ul").slideDown();
        });
    });
</script> -->


</head>
<body>
	<div align="center">
		<i class="fa fa-cogs fa-3x" aria-hidden="true"></i> <br />
		<table width="100%">
			<tr>
				<td align=center><strong>관 / 리 / 자 / 메 / 뉴</strong></td>
			</tr>
			<tr>
				<td height=3 bgcolor=#808080></td>
			</tr>
			<tr>
				<td align="right"><a href="adminLogout.jsp" target="_top">로그아웃</a></td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>
			<tr>
				<td><a href="../notice/noticeFra.jsp" target="sub"><i
						class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 공지사항 관리</a></td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>
			<tr>
				<td><a href="../qna/qnaFra.jsp" target="sub"><i
						class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 문의사항 관리</a></td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>
			<tr>
				<td><a href="../user/userFra.jsp" target="sub"><i
						class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 회원 관리</a></td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>
			
			<tr>
				<td>
					<ul>
						
						<li>   <a><i class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 영화 관리</a>
							<ul >
								<li>&nbsp; &nbsp; <i class="fa fa-circle" aria-hidden="true"></i> <a href="../movie/movieFra.jsp" target="_blank">movie</a></li>
								<li>&nbsp; &nbsp; <i class="fa fa-circle" aria-hidden="true"></i> <a href="../people/peopleFra.jsp" target="_blank">people</a></li>
							</ul>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>
			<tr>
				<td><a href="../review/cinemaFra.jsp" target="_blank"><i
						class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 영화관 관리</a></td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>

			<tr>
				<td><a href="../coupon/couponFra.jsp" target="_blank"><i
						class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i> 쿠폰 관리</a></td>
			</tr>
			<tr>
				<td height=1 bgcolor=#808080></td>
			</tr>

		</table>
	</div>
</body>
</html>