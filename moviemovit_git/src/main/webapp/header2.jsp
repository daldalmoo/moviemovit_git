<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="user/auth.jsp"%>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
  <!-- 로그인/로그아웃 menu -->
  <% 
    if(s_id.equals("guest") || s_passwd.equals("guest") || s_grade.equals("guest")) { %>
    <div id="loginmenu">
    <ul>
      <li><a href="../user/loginform.do" title="Link">Login</a></li>
      <li><a href="../user/agree.do" title="Link">Join</a></li>
    </ul>
    </div>
     
    <%}else if(s_grade.equals("ADMIN")){ %>
	        <div id="loginmenu">
    <ul>
      <li><a href="../user/logout.do" title="Link" onclick="logoutCheck();">Logout</a></li>
      <li><a href="../admin/adminStart.jsp" title="Link">Adminpage</a></li>
    </ul>
    </div>  
<script>
function logoutCheck(){
           
            if( confirm("정말로 로그아웃하시겠습니까?") ){
               
                location.href="index.do";
            }
        }
</script>


		<%} else{ //로그인했다면 %>

		<div id="loginmenu">
			<ul>
				<li><a href="../user/logout.do" title="Link">Logout</a></li>
				<li><a href="../user/mypage.do" title="Link">Mypage</a></li>
			</ul>
		</div>

		<% }%>
		<!-- 로그인/로그아웃 menu end -->

		<!-- Section: intro -->
		<section id="intro" class="intro">
		
			<div class="slogan">
				<a href="../index.do"> <img src="../img/logo2.jpg" alt="" /></a>
			</div>
		</section>
	
	
		<!--   Navigation -->
		<div class="nav_wrapper">
			<!--  X 버튼 -->
			<div class="spinner-master">
				<input type="checkbox" id="spinner-form" /> <label
					for="spinner-form" class="spinner-spin">
					<div class="spinner diagonal part-1"></div>
					<div class="spinner horizontal"></div>
					<div class="spinner diagonal part-2"></div>
				</label>
			</div>
			<nav id="menu" class="menu">
				<ul class="dropdown">
					<li><a href="#Link">Home</a>
						<ul>
							<li><a href="../notice/list.do" title="공지사항">Notice</a></li>
							<li><a href="#Link" title="정보">Info</a></li>
							<li><a href="../qna/list.do" title="연락">Contact</a></li>
						</ul></li>
					<li><a href="../ticket/create.do" title="예매">Ticket</a></li>
					<li><a href="../review/list.do" title="영화관 리뷰 게시판">Review</a></li>
					<li><a href="#Link" title="취향분석">Movit</a>
						<ul>
							<li><a href="../movie/movieList.do" title="영화 평가하기">평가늘리기</a></li>
							<li><a href="#Link">평가결과</a></li>
							<li><a href="../star/avgList.do" title="영화 분석결과">분석결과</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
		<!--   Navigation end -->

		<!--   Section: gallery -->
		<section id="gallery" class="home-section text-center ">
			<div class="banner" id="home">
				<div class="container-fluid">