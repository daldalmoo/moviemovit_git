<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 본문시작 template.jsp --%>
    <div class="content">
        <div class="wrap">
            <div id="main" role="main">
                <ul id="tiles">
                    <!-- These are our grid blocks -->
                    <c:forEach var="dto" items="${list }">
                        <li><a href="./cinemaRead.do?cineCode=${dto.cineCode }">
                                <img src="img/${dto.logoImg}">
                        </a>
                            <div class="post-info">
                                <div class="post-basic-info">
                                    <h3>${dto.cineName }</h3>
                                    <span> <c:choose>
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
                                        </c:choose></span>
                                    <p>${dto.addr2}
                                        ${dto.addr3} <br> ${dto.tel}
                                    </p>
                                </div>
                                <div class="post-info-rate-share">
                                    <c:choose>
                                        <c:when test="${dto.startotal == 0}">
                                            <img src="./img/star0.png" width="150">
                                        </c:when>
                                        <c:when test="${dto.startotal < 3 }">
                                            <img src="./img/star1.png" width="150">
                                        </c:when>
                                        <c:when test="${dto.startotal < 5}">
                                            <img src="./img/star2.png" width="150">
                                        </c:when>
                                        <c:when test="${dto.startotal < 7}">
                                            <img src="./img/star3.png" width="150">
                                        </c:when>
                                        <c:when test="${dto.startotal < 9}">
                                            <img src="./img/star4.png" width="150">
                                        </c:when>
                                        <c:when test="${dto.startotal < 11} ">
                                            <img src="./img/star5.png" width="150">
                                        </c:when>
                                        <c:when test="${dto.startotal eq '' || empty dto.startotal }">
                                            <img src="./img/star0.png" width="150">
                                        </c:when>
                                    </c:choose>
                                    <div class="post-share">
                                        <input class="cbp-mc-button" type="button" value="상영관"
                                            onclick="location.href='./roomList.do?cineCode=${dto.cineCode }'" />
                                        <input class="cbp-mc-button" type="button" value="수정"
                                            onclick="location.href='./cinemaUpdate.do?cineCode=${dto.cineCode }'" />
                                        <input class="cbp-mc-button" type="button" value="삭제"
                                            onclick="location.href='./cinemaDelete.do?cineCode=${dto.cineCode }'" />
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

<%-- 본문끝 --%>