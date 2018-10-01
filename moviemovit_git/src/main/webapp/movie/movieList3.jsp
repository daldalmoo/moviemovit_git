<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header1.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style rel="stylesheet">
.simg {
  font-size: 0;
  text-align: center;
  width: 100px;
}

.box-image {
  display: inline-block;
  width:250px;
  height: 350px;
  background-color: white;
  border: 8px solid #3366cc; 
  box-sizing: content-box;
  margin-left: 3px;
  margin-top: 20px;
  padding: 1px 1px 1px 1px;
  float:left;
  
}

.mimg {        /* 영화관 목록안의 영화관이미지 */
  font-size: 0;
  text-align: center;
  width: 150px;
  max-width: calc(100% - 50em);
  height: 180px;
  
}



.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;        
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 50em);
  margin: 1em auto;
  overflow: hidden;
  width: 100%;
}
div.ex2 {
	height: 100%;
	width: 100%;
	overflow: auto;
}

div.brand_list {
    height: 100%;
    width: 100%;
	overflow: auto;
}

div.searchbar {
    height: 50%;
    width: 100%;
	overflow: auto;
}

/* 브랜드선택창 */
.brandList {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid #ddd;
}

/* 브랜드선택창 클릭시 버튼변화 */
a.brandList.active, a.brandList.active:hover, a.brandList.active:focus {
	z-index: 2;
	color: #fff;
	background-color: #428bca;
	border-color: #428bca;
}

div#toplist {
    text-align: center;
    font-size: 15pt;
    font-weight: bold;
    color: white;
    background-color: #fed513;
    height: 10%;
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
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  
 
}


</style>
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
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>

<%@ include file="../header2.jsp"%>
<%-- 본문시작 movieList.jsp --%>
 <div class="table-users">
   <div class="header">MOVIE LIST</div>
 </div>
 
 <!---start-content---->
	<div class="wholeList">
		<div class="content">
			<div class="wrap">
				<div id="main" role="main">
					<ul id="tiles">
						<!-- These are our grid blocks -->
						<c:forEach var="dto" items="${starlist }">
							<li><a href="./movieRead.do?mCode=${dto.mCode }">
									<img class="mimg" src="./img_poster/${dto.poster }" width="400" height="800" />
							    </a>
								<div class="post-info">
									<div class="post-basic-info">
										<h3>${dto.mName }</h3>
										<span> 
					                    </span>
										<p>${dto.s_date} 개봉
										${dto.screen } <br>
                                        ${dto.age} 세 <br>
										</p>
									</div>
									<div class="post-info-rate-share">
										<c:choose>
											<c:when test="${dto.runningTime == 0}">
												<img src="./img/star0.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 1}">
												<img src="./img/star1.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 2}">
												<img src="./img/star2.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 3}">
												<img src="./img/star3.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 4}">
												<img src="./img/star4.png" width="150">
											</c:when>
											<c:when test="${dto.runningTime == 5} ">
												<img src="./img/star5.png" width="150">
											</c:when>
										</c:choose>
										<div class="post-share">
											<input class="cbp-mc-button" type="button" value="예매하기"
												onclick="#" />
										</div>
										<div class="clear"></div>
									</div>
								</div></li>
						</c:forEach>
						<!-- End of grid blocks -->
					</ul>
				</div>
			</div>
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
   <!-- 하단버튼 -->
   <div class="cbp-mc-submit-wrap">
     <input class="cbp-mc-button" type="button" value="영화등록" onclick="location.href='./create.do'"/>  
   </div>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>
