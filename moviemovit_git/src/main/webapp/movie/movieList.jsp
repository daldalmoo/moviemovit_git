<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header1.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.guide {
    position: relative;   
    width: 90%;
    height: 100%;
    background: #fff;
    margin: 20px auto;
}
.center-box {
    position: absolute;   
    width: 100px;
    height: 100px;
    background: red;
    top: 0;               
    bottom: 0;            
    left: 0;              
    right: 0;             
    margin: auto;     /* 추가 */
}
<style rel="stylesheet">
.main{
  width:100%;
  margin-left: 5em;
  text-align: center;
}
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
  float:center;
  
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
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }
  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }
</style>
<%@ include file="../header2.jsp"%>
<%-- 본문시작 movieForm.jsp --%>
 <div class="table-users">
   <div class="header">MOVIE LIST</div>
 </div>
   
   <div class="guide">
   <c:forEach var="dto" items="${starlist }">
   <div class="box-image">
     
     <span class="thumb-image">
     <a href="../star/List.do?mCode=${dto.mCode }">
       <img class="mimg" src="./img_poster/${dto.poster }" width="400" height="800" />
     </a>
     </span>
      <br>
    <strong class="title">${dto.mName }</strong><br>
     <span>
       <strong>
       ${dto.s_date }개봉<br> 
       ${dto.screen } <br>
       <c:if test="${dto.age==0 }">
       전체 관람가
       </c:if>
       <c:if test="${dto.age==12 }">
       12세
       </c:if>
       <c:if test="${dto.age==15 }">
       15세
       </c:if>
       <c:if test="${dto.age==19 }">
       청소년 관람불가 
       </c:if>
        <br>
       <c:if test="${dto.runningTime==0 }">
           <img class="simg" src="./img_star/star0.png"> 
       </c:if>
       <c:if test="${dto.runningTime==1 }">
           <img class="simg" src="./img_star/star1.png"> 
       </c:if>
       <c:if test="${dto.runningTime==2 }">
           <img class="simg" src="./img_star/star2.png"> 
       </c:if>
       <c:if test="${dto.runningTime==3 }">
           <img class="simg" src="./img_star/star3.png"> 
       </c:if>
       <c:if test="${dto.runningTime==4 }">
           <img class="simg" src="./img_star/star4.png"> 
       </c:if>
       <c:if test="${dto.runningTime==5 }">
           <img class="simg" src="./img_star/star5.png">
       </c:if>
       <br>
       </strong>
     </span>
     <input class="cbp-mc-button" type="button" value="평가하기" onclick="location.href='../star/create.do?mCode=${dto.mCode }'"/>
     <input class="cbp-mc-button" type="button" value="예매하기" onclick="#" />    
   
    </div>
    
   </c:forEach>
    
   </div>
   
   <br>
   <!-- 하단버튼 -->
   <div class="cbp-mc-submit-wrap">
     <input class="cbp-mc-button" type="button" value="영화등록" onclick="location.href='./create.do'"/>  
   </div>
   
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
<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>