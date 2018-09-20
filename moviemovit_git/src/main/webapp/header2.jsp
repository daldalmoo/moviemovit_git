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
    <!---------------------- 수정 : 로고 이미지 + 사이트명 -------------------->
    <div class="slogan">
      <a href="../index.do"> <img src="../img/logo2.jpg" alt="" /></a>
    </div>
  </section>
  <!-- /Section: intro -->


  <!-- Navigation -->
  <div class="nav_wrapper">
    <!-- X 버튼 -->
    <div class="spinner-master">
      <input type="checkbox" id="spinner-form" />
      <label for="spinner-form" class="spinner-spin">
        <div class="spinner diagonal part-1"></div>
        <div class="spinner horizontal"></div>
        <div class="spinner diagonal part-2"></div>
      </label>
    </div>
<!--    <a href="#search_box" class="btn" id="search">&#9740;</a> -->
    <nav id="menu" class="menu">
      <ul class="dropdown">
        <li><a href="#Link">Home</a>
          <ul>
            <li><a href="../notice/list.do" title="공지사항">Notice</a></li>
            <li><a href="#Link" title="정보">Info</a></li>
            <li><a href="../qna/list.do" title="연락">Contact</a></li>
          </ul></li>
        <li><a href="../ticket/create.do" title="예매">Ticket</a></li>
        <li><a href="../review/cinemaList.do" title="영화관 리뷰 게시판">Review</a></li>
        <li><a href="#Link" title="취향분석">Movit</a>
          <ul>
            <li><a href="../movie/movieList.do" title="영화 평가하기">평가늘리기</a></li>
            <li><a href="#Link">평가결과</a></li>
            <li><a href="#Link">분석결과</a></li>
          </ul>
        </li>
      </ul>
    </nav>
<!--    <form class="search_box" id="search_box" action="/search/">
      <input name="search_criteria" placeholder="Search here" value=""
        type="text"> <input class="search_icon" value="Search"
        type="submit">
    </form> -->
  </div>
  <!-- Navigation end -->

  <!-- Section: gallery -->
  <section id="gallery" class="home-section text-center ">
    <div class="banner" id="home">
      <div class="container-fluid">