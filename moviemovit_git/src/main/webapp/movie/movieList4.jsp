<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header1.jsp"%>

<style>
.mimg {        /* 영화 포스터 */
  font-size: 0;
  text-align: center;
  width: 150px;
  max-width: calc(100% - 50em);
  height: 180px;
}



/*공개,수정,삭제 스타일 버튼*/
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


</style>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
<%@ include file="../header2.jsp"%>
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!----//webfonts---->
<!-- Global CSS for the page and tiles -->
<link rel="stylesheet" href="css/main.css">
<!-- //Global CSS for the page and tiles -->
<!---start-click-drop-down-menu----->
<script src="js/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!----start-dropdown--->
<script>
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
<!----//End-dropdown--->
<!---//End-click-drop-down-menu----->
</head>
<body>
    <!---start-content---->
	<div class="wholeList">
		<div class="content">
			    <c:forEach var="dto" items="${starlist }">
				<div id="main" role="main">
					<ul id="tiles">
						<!-- These are our grid blocks -->
						    <div>
							<a href="./movieRead.do?mCode=${dto.mCode }">
									<img class="mimg" src="./img_poster/${dto.poster }" width="400" height="800" />
							</a>
							</div>
								<div class="post-info">
									<div class="post-basic-info">
										<span>
										${dto.mName } <br>
										${dto.s_date}개봉 <br>
										${dto.screen} <br>
                                        ${dto.age}세 <br>
										</span>
									</div>
									<div class="post-info-rate-share">
										<c:choose>
											<c:when test="${dto.runningTime == 0}">
												<img src="./img_star/star0.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 1}">
												<img src="./img_star/star1.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 2}">
												<img src="./img_star/star2.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 3}">
												<img src="./img_star/star3.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 4}">
												<img src="./img_star/star4.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 5} ">
												<img src="./img_star/star5.png" width="150">
											</c:when>
										</c:choose>
										<div class="post-share">
											<input class="cbp-mc-button" type="button" value="예매하기"
												onclick="#" />
										</div>
										<div class="clear"></div>
									</div>
								</div>
								
						
						<!-- End of grid blocks -->
					</ul>
				</div>
			</c:forEach>
		</div>
		<!---//End-content---->
		<!----wookmark-scripts---->
		<script src="js/jquery.imagesloaded.js"></script>
		<script src="js/jquery.wookmark.js"></script>
		<script>
			(function($) {
				var $tiles = $('#tiles'), $handler = $('li', $tiles), $main = $('#main'), $window = $(window), $document = $(document), options = {
					autoResize : true, // This will auto-update the layout when the browser window is resized.
					container : $main, // Optional, used for some extra CSS styling
					offset : 20, // Optional, the distance between grid items
					itemWidth : 280
				// Optional, the width of a grid item
				};
				/**
				 * Reinitializes the wookmark handler after all images have loaded
				 */
				function applyLayout() {
					$tiles.imagesLoaded(function() {
						// Destroy the old handler
						if ($handler.wookmarkInstance) {
							$handler.wookmarkInstance.clear();
						}

						// Create a new layout handler.
						$handler = $('li', $tiles);
						$handler.wookmark(options);
					});
				}
				/**
				 * When scrolled all the way to the bottom, add more tiles
				 */
				function onScroll() {
					// Check if we're within 100 pixels of the bottom edge of the broser window.
					/*   var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
					      closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
					 */
					if (closeToBottom) {
						// Get the first then items from the grid, clone them, and add them to the bottom of the grid
						/*  var $items = $('li', $tiles),
						     $firstTen = $items.slice(0, 10);
						 $tiles.append($firstTen.clone());
						 */
						applyLayout();
					}
				}
				;

				// Call the layout function for the first time
				applyLayout();

				// Capture scroll event.
				$window.bind('scroll.wookmark', onScroll);
			})(jQuery);
		</script>
	</div>


	<script src="../js/jquery.js"></script>
	<script>
		//카테고리		
		// 1. 지역 선택
		// 지역 LIST에 있는 item을 click 하면 
		$(".list-group-item").click(function() {
			// 클릭한 주소값 가져오기
			var clickaddr = $(this).attr("id");
			// active 제거 후 active 추가하기 
			$(".list-group-item").removeClass("active");
			$(this).addClass("active");

			//alert(clickaddr);

			//AJAX : 카테고리에 브랜드 리스트 출력
			$.post("./addrList.do", {
				"addr1" : clickaddr
			}, addrList);

			function addrList(result) {
				//alert('완료');
				$(".brand_list").html(result);
			}//callback 함수 and

			//결과 LIST
			$.post("./selectAddr.do", {
				"addr1" : clickaddr
			}, selectAddr, "html");

			function selectAddr(result) {
				//alert('완료');
				$(".wholeList").html(result);
			}//callback 함수 and

		}) //CheckIdProc() end

		// LIST를 만들어놓고 brand Name이 일치하는 아이들만 SET 시키기

		// 2. 영화관 brand 선택시 해당 영화관 출력
		// 지역 영화관에 있는 item을 click 하면 
		$(document).on("click", ".brandList", function() {
			// 클릭한 주소값 가져오기
			var clickBrand = $(this).attr("id");
			var clickAddr = $("a.list-group-item.active").prop("id");
			// active 제거 후 active 추가하기 
			$(".brandList").removeClass("active");
			$(this).addClass("active");

			//alert(clickAddr);
			//alert(clickBrand);

			$.post("./selectBrand.do", {
				"addr1" : clickAddr,
				"brandName" : clickBrand
			}, selectBrand, "html");

			function selectBrand(result) {
				//alert('완료');
				$(".wholeList").html(result);
			}//callback 함수 and

		}) //CheckIdProc() end

		// 검색
		function search() {
			var sch_value = jQuery('#form_search #sch_value').val();
			if (sch_value == '') {
				alert('검색어를 입력하세요.');
			} else {
				jQuery('#form_search').submit();
			}
		}
		//jQuery('#form_search #sch_type option').val('${mapSearch.sch_type}');
		jQuery('#form_search #sch_type value').val('${mapSearch.sch_type}');
		/*
		 일단 체크 된 값들을 받아오기 > 받아온 다음  
		 select해서 list를 다시 만들어서 받아오는 것보다
		 카테고리박스가 체크된 값들 중에서 brandName이랑 일치하는 것을 for문으로 돌려서 받기...?
		
		 */
	</script>
	<%@ include file="../footer.jsp"%>