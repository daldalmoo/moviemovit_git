<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="../header1.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
<script type="application/x-javascript">
	
    
    
    
    
    

addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 





</script>

<link href="../css/rating.css" rel="stylesheet" type="text/css">
<style>

/* startotal */
.starimg {
	font-size: 15px;
	text-align: left;
}

.starimg img {
	width: 50%;
}

.starbox {
	width: 100%;
	height: 160PX;
	max-width: calc(100% - 65em);
	background-color: white;
	box-sizing: content-box;
	margin: 1em auto;
}

.scontainer {
	width: 100px;
	background-color: white;
	margin: auto;
	float: left;
}

/* 0912 찬홍 test */
.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin: center;
}

.star_rating a.on {
	color: #777;
}

.box-image {
	width: 100%;
	height: 180px;
	/*   max-width: calc(100% - 85em);
 */
	background-color: white;;
	border: 8px solid #3366cc;
	box-sizing: content-box;
	margin: 1em auto;
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

.starline {
	height: 0.3px;
	color: #D8D8D8; /* IE */
	border-color: #D8D8D8;
	/*
    사파리
    */
	background-color: #D8D8D8; /* 크롬, 모질라 등, 기타 브라우저 */
}

/* 지도test */
.map {
	border: 2px solid #327a81;
	border-radius: 10px;
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	max-width: calc(100% - 2em);
	margin: 1em auto;
	overflow: hidden;
	width: 80%;
}
</style>

<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!----//webfonts---->
<!---start-click-drop-down-menu----->
<script src="js/jquery.min.js"></script>
<!----start-dropdown--->
<script type="text/javascript">
	var $ = jQuery.noConflict();
	$(function() {
		$('#activator').click(function() {
			$('#box').animate({
				'top' : '0px'
			}, 500);
		});
		$('#boxclose').click(function() {
			$('#box').animate({
				'top' : '-700px'
			}, 500);
		});
	});
	$(document).ready(function() {
		//Hide (Collapse) the toggle containers on load
		$(".toggle_container").hide();
		//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
		$(".trigger").click(function() {
			$(this).toggleClass("active").next().slideToggle("slow");
			return false; //Prevent the browser jump to the link anchor
		});

	});
</script>

<%@ include file="../header2.jsp"%>

<%
  String uid = (String) session.getAttribute("s_id");
			//out.println("세션확인:" + uid);
			session.setAttribute("uid", uid);
%>


<c:set var="cineCode" value="${dto.cineCode}" />
<!---start-content---->
<div class="content">
	<div class="wrap">
		<div class="single-page">
			<div class="single-page-artical">
				<div class="artical-content">
					<h3 style="font-size: 30px; text-align: left;">
						<c:choose>
							<c:when test="${dto.brandName == 'CGV'}">
                             CGV
                             </c:when>
							<c:when test="${dto.brandName == 'LOTTE'}">
                              롯데시네마
                              </c:when>
							<c:when test="${dto.brandName == 'INDEP'}">
                              독립영화관
                              </c:when>
							<c:when test="${dto.brandName == 'MEGABOX'}">
                               메가박스 
                               </c:when>
						</c:choose>
						${dto.cineName }

						<hr class="starline">
					</h3>
					<img style="width: 1166px; height: 520px;"
						src="img/${dto.logoImg }" title="banner1">
				</div>
				<!---start-content---->
				<div class="content">
					<div class="wrap">
						<div class="contact-info">
							<div class="contact-grids">
								<div class="cinemaStar">
									<c:forEach var="reviewstar" items="${reviewstar }">
										<c:if test="${cineCode == reviewstar.cineCode }">
											<div class="col_1_of_bottom span_1_of_first1">
												<div class="starimg">
`													화질&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    &nbsp;
													<c:choose>
														<c:when test="${reviewstar.pixel < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.pixel < 3 }">
										  					<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.pixel < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.pixel < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.pixel < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr class="starline">
													청결도&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp;
													<c:choose>
														<c:when test="${reviewstar.clean < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.clean < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.clean < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.clean < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.clean < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr class="starline">
													음향&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp; &nbsp;
													<c:choose>
														<c:when test="${reviewstar.sound < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.sound < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.sound < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.sound < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.sound < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr class="starline">
													서비스&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp;
													<c:choose>
														<c:when test="${reviewstar.service < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.service < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.service < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.service < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.service < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
												</div>
											</div>
											<div class="col_1_of_bottom span_1_of_first1">
												<div class="starimg">
													좌석&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp; &nbsp;
													<c:choose>
														<c:when test="${reviewstar.seat < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.seat < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.seat < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.seat < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.seat < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr class="starline">
													교통 접근성&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													<c:choose>
														<c:when test="${reviewstar.trans < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.trans < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.trans < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.trans < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.trans < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr class="starline">
													매점&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
													&nbsp; &nbsp;
													<c:choose>
														<c:when test="${reviewstar.snack < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.snack < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.snack < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.snack < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.snack < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr class="starline">
													주변 편의시설 &nbsp; &nbsp; &nbsp;
													<c:choose>
														<c:when test="${reviewstar.around < 2 }">
															<img src="./img/star1.png">
														</c:when>
														<c:when test="${reviewstar.around < 3 }">
															<img src="./img/star2.png">
														</c:when>
														<c:when test="${reviewstar.around < 4 }">
															<img src="./img/star3.png">
														</c:when>
														<c:when test="${reviewstar.around < 5 }">
															<img src="./img/star4.png">
														</c:when>
														<c:when test="${reviewstar.around < 6 }">
															<img src="./img/star5.png">
														</c:when>
													</c:choose>
													<hr>

												</div>
											</div>
											
								    <div class="col_1_of_bottom span_1_of_first1">
                                                <h5>평균별점</h5>
                                                <c:choose>
                                                    <c:when test="${dto.startotal < 1}">
                                                        <img src="./img/star0.png">
                                                    </c:when>
                                                    <c:when test="${dto.startotal < 2 }">
                                                        <img src="./img/star1.png">
                                                    </c:when>
                                                    <c:when test="${dto.startotal < 3}">
                                                        <img src="./img/star2.png">
                                                    </c:when>
                                                    <c:when test="${dto.startotal < 4}">
                                                        <img src="./img/star3.png">
                                                    </c:when>
                                                    <c:when test="${dto.startotal < 5}">
                                                        <img src="./img/star4.png" width="150">
                                                    </c:when>
                                                    <c:when test="${dto.startotal < 6} ">
                                                        <img src="./img/star5.png" width="150">
                                                    </c:when>
                                                    <c:when
                                                        test="${dto.startotal eq '' || empty dto.startotal }">
                                                        <img src="./img/star0.png" width="150">
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
							<div class="clear"></div>
						</div>
						<div class="contact-info">
							<div class="contact-grids">
								<div class="col_1_of_bottom span_1_of_first1">
									<h5>Address</h5>
									<ul class="list3">
										<li><img src="images/home.png" alt="">
											<div class="extra-wrap">
												<p>${dto.addr2 }${dto.addr3 }</p>
											</div></li>
									</ul>
								</div>
								<div class="col_1_of_bottom span_1_of_first1">
									<h5>Phones</h5>
									<ul class="list3">
										<li><img src="images/phone.png" alt="">
											<div class="extra-wrap">
												<p>
													<span>${dto.tel }</span>
												</p>
											</div></li>
									</ul>
								</div>
								<div class="col_1_of_bottom span_1_of_first1">
									<h5>HOMEPAGE</h5>
									<ul class="list3">
										<li>
											<div class="extra-wrap">
												<p>
													<a href="${dto.home }">${dto.home }</a>
												</p>
											</div>
										</li>
									</ul>
									<h5>ETC</h5>
									<ul class="list3">
										<div class="extra-wrap">
											<p>${dto.etc }</p>
										</div>
									</ul>

									<div class="clear"></div>
								</div>

								<div id="map" style="width: 100%; height: 350px;"></div>
								<c:set var="addr2" value="${dto.addr2 }" />
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2c1e5f7f38722f30ba8361e106d5d&libraries=services"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new daum.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									// 지도를 생성합니다    
									var map = new daum.maps.Map(mapContainer,
											mapOption);

									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new daum.maps.services.Geocoder();

									//주소 가져오기
									var addr = '<c:out value="${addr2}"/>';

									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													addr,
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) {

															var coords = new daum.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new daum.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new daum.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">"${dto.cineName }"</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>
							</div>
						</div>
					</div>
				</div>


				<div class="clear"></div>
			</div>
			<div class="wrap">
				<div class="contact-info">
					<div class="col_1_of_bottom span_1_of_first1">
						<form name="reviewForm" method="POST" action="./create.do">
							<h5>Writing HERE</h5>
							<img src="../img/logo.png" style="width: 70%">
					</div>
					<div class="col_1_of_bottom span_1_of_first1">
						<h5>Content</h5>
						<div class="text2">
							<textarea id="s_e" name="s_e" placeholder="이용후기 남기기.."></textarea>
						</div>
					</div>

					<!-- 별점 매기기 -->
					<div class="col_1_of_bottom span_1_of_first1">
						<h5>STARS</h5>
						<div class="scontainer">
							화질 <input type="radio" name="pixel" class="rating" value="1" />
							<input type="radio" name="pixel" class="rating" value="2" /> <input
								type="radio" name="pixel" class="rating" value="3" /> <input
								type="radio" name="pixel" class="rating" value="4" /> <input
								type="radio" name="pixel" class="rating" value="5" />
						</div>
						<div class="scontainer">
							음향 <input type="radio" name="sound" class="rating" value="1" />
							<input type="radio" name="sound" class="rating" value="2" /> <input
								type="radio" name="sound" class="rating" value="3" /> <input
								type="radio" name="sound" class="rating" value="4" /> <input
								type="radio" name="sound" class="rating" value="5" />
						</div>
						<div class="scontainer">
							좌석 <input type="radio" name="seat" class="rating" value="1" /> <input
								type="radio" name="seat" class="rating" value="2" /> <input
								type="radio" name="seat" class="rating" value="3" /> <input
								type="radio" name="seat" class="rating" value="4" /> <input
								type="radio" name="seat" class="rating" value="5" />
						</div>
						<div class="scontainer">
							매점 <input type="radio" name="snack" class="rating" value="1" />
							<input type="radio" name="snack" class="rating" value="2" /> <input
								type="radio" name="snack" class="rating" value="3" /> <input
								type="radio" name="snack" class="rating" value="4" /> <input
								type="radio" name="snack" class="rating" value="5" />
						</div>
						<div class="scontainer">
							청결도 <input type="radio" name="clean" class="rating" value="1" />
							<input type="radio" name="clean" class="rating" value="2" /> <input
								type="radio" name="clean" class="rating" value="3" /> <input
								type="radio" name="clean" class="rating" value="4" /> <input
								type="radio" name="clean" class="rating" value="5" />
						</div>
						<div class="scontainer">
							서비스 <input type="radio" name="service" class="rating" value="1" />
							<input type="radio" name="service" class="rating" value="2" /> <input
								type="radio" name="service" class="rating" value="3" /> <input
								type="radio" name="service" class="rating" value="4" /> <input
								type="radio" name="service" class="rating" value="5" />
						</div>
						<div class="scontainer">
							편의시설 <input type="radio" name="around" class="rating" value="1" />
							<input type="radio" name="around" class="rating" value="2" /> <input
								type="radio" name="around" class="rating" value="3" /> <input
								type="radio" name="around" class="rating" value="4" /> <input
								type="radio" name="around" class="rating" value="5" />
						</div>
						<div class="scontainer">
							교통 접근성 <input type="radio" name="trans" class="rating" value="1" />
							<input type="radio" name="trans" class="rating" value="2" /> <input
								type="radio" name="trans" class="rating" value="3" /> <input
								type="radio" name="trans" class="rating" value="4" /> <input
								type="radio" name="trans" class="rating" value="5" />
						</div>
						<hr>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; <input type="hidden" name="cineCode"
							id="cineCode" value="${cineCode }" /> <br> <input
							type="hidden" name="uid" id="uid" value="${uid }" />
						<hr>
						<input type="submit" class="cbp-mc-button" value="등록">
					</div>
					<div class="clear"></div>
				</div>
				</form>
				<!---start-comments-section--->
				<div class="comment-section">
					<div class="grids_of_2">
						<h2>Comments</h2>
						<c:forEach var="sdto" items="${list }">
							<div class="grid1_of_2">
								<div class="col_1_of_bottom span_1_of_first1">
									<div class="grid_img">
										<!-- 프로필이미지 넣을지 말지 -->
									</div>


									<div class="grid_text">


										<h4 class="style1 list">
											<a href="#"> ${sdto.uid } </a><br> <br>
										</h4>
									</div>
								</div>
								<div class="col_1_of_bottom span_1_of_first1">
									<h3 class="starimg">
										<br> 화질
										<c:if test="${sdto.pixel==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.pixel==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.pixel==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.pixel==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.pixel==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.pixel==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 청결도
										<c:if test="${sdto.clean==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.clean==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.clean==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.clean==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.clean==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.clean==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 음향
										<c:if test="${sdto.sound==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.sound==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.sound==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.sound==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.sound==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.sound==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 서비스
										<c:if test="${sdto.service==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.service==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.service==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.service==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.service==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.service==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 좌석
										<c:if test="${sdto.seat==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.seat==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.seat==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.seat==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.seat==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.seat==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 주변 편의시설
										<c:if test="${sdto.around==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.around==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.around==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.around==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.around==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.around==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 매점
										<c:if test="${sdto.snack==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.snack==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.snack==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.snack==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.snack==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.snack==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br> 교통
										<c:if test="${sdto.trans==0 }">
											<img src="./img/star0.png">
										</c:if>
										<c:if test="${sdto.trans==1 }">
											<img src="./img/star1.png">
										</c:if>
										<c:if test="${sdto.trans==2 }">
											<img src="./img/star2.png">
										</c:if>
										<c:if test="${sdto.trans==3 }">
											<img src="./img/star3.png">
										</c:if>
										<c:if test="${sdto.trans==4 }">
											<img src="./img/star4.png">
										</c:if>
										<c:if test="${sdto.trans==5 }">
											<img src="./img/star5.png">
										</c:if>
										<br>
									</h3>
								</div>
								<div class="col_1_of_bottom span_1_of_first1">
									<div class="grid_text">${sdto.s_e }</div>
									<input class="cbp-mc-button" type="button" value="수정"
										onclick="location.href='./reviewUpdate.do?cineCode=${dto.cineCode }&no=${sdto.no }'" />
									<input class="cbp-mc-button" type="button" value="삭제"
										onclick="location.href='./delete.do?cineCode=${dto.cineCode }&no=${sdto.no }'" />
								</div>
								<div class="clear"></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!---//End-comments-section--->
		</div>
	</div>
</div>
</div>

<script src="../js/rating.js"></script>
<script>
	$('.scontainer').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		return false;
	});

	$('.scontainer').rating(function(vote, event) {
		// write your ajax code here
		// For example;
		// $.get(document.URL, {vote: vote});
	});

	var heart = 0;

	function heart_click() {
		heart++;
		alert(heart);
	}
</script>
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>