<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header1.jsp"%>

<style>
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

 <script type="text/javascript">
        //<![CDATA[

        _TRK_CP = "/영화/무비차트/무비차트";

        app.config('staticDomain', 'http://img.cgv.co.kr/R2014/')
            .config('imageDomain', 'http://img.cgv.co.kr')
            .config('isLogin', 'False');

        // AD FLOAT
        // 암호화 할 문자열과 키값(상수값)을 매개변수로 받는다.
        function EncryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // key 값을 원하는 대로 연산을 한다
                output += String.fromCharCode(str.charCodeAt(i) + parseInt(key) + 123 + i);
            }
            return output;
        }
        // 복호화
        // 암호화 된 문자열과 키값(상수값)을 매개변수로 받는다.
        function DecryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // 암호화시 사용한 연산과 같아야 한다.
                output += String.fromCharCode(str.charCodeAt(i) - (parseInt(key) + 123 + i));
            }

            return output;
        }

        function getCookieVal(offset) {
            var endstr = document.cookie.indexOf(";", offset);
            if (endstr == -1) endstr = document.cookie.length;
            return unescape(document.cookie.substring(offset, endstr));
        }
        function GetCookieAd(name) {
            var arg = name + "=";
            var alen = arg.length;
            var clen = document.cookie.length;
            var i = 0;
            while (i < clen) { //while open
                var j = i + alen;
                if (document.cookie.substring(i, j) == arg)
                    return getCookieVal(j);
                i = document.cookie.indexOf(" ", i) + 1;
                if (i == 0) break;
            } //while close
            return null;
        }
        function setCookieAD(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setTime(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000));
            document.cookie = name + "=" + escape(value) + "; expires=" + todayDate.toGMTString() + "; path=/; domain=cgv.co.kr";
        }
        function CloseAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("/");

            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);
            var CookieUrl = ArrAdUrl[3];

            CookieUrl = EncryptAD(CookieUrl, "15442280");
            setCookieAD(CurCookieName, CookieUrl, '1');
            $(document).find('#ad_float1').hide();
        }
        function OpenAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("/");
            var CookieUrl = ArrAdUrl[3];
            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);

            if (CurCookieUrl == null) {
                CurCookieUrl = "";
            }
            else {
                CurCookieUrl = DecryptAD(CurCookieUrl, "15442280");
            }

            if (CurCookieUrl.indexOf(CookieUrl) != -1) {
                $(document).find('#ad_float1').hide();
            }

            //section.cgv.co.kr 매거진 체크
            var magazineckurl = GetCookieAd("CgvPopAd-magazine");
            if (magazineckurl != null) {
                var magazineck = DecryptAD(magazineckurl, "15442280");
                if (magazineck != null && magazineck == "magazine") {
                    //값이있는경우 표시하지않음
                    $(document).find('#ad_float1').hide();
                }
            }
        }

        //]]>
    </script>
    <script type="text/javascript" src="https://nsso.cjone.com/findCookieSecured.jsp?cjssoq=kOrrMtxLuWGiRjYB0IIDA7EUhoynjc%2bbKguJOggJEgktCxWG0aCQPQBlUer7dLqIJSLz9bp5NwSvr2X0RKIm5TN2NEdqNmYwV1hQb1NLUFhVdmNkcUM4blg5UElOdENrOS9CYTJxMVlDWTIycUwyT2ZKMmlBa1lxSm90Mks1U1E%3d"></script>
	
<!----//End-dropdown--->
<!---//End-click-drop-down-menu----->
	<!---start-content---->
	<!-- 실컨텐츠 시작 -->
	<c:forEach var="dto" items="starlist">
     <div class="box-image">
            <ol>
                <li>
                   <div class="box-contents">
                        <a href="./movieRead.do?mCode=${dto.mCode }">
                            <strong class="title">${dto.mName }</strong>
                        </a>
                        <span class="txt-info">
                            <strong>
                                ${dto.s_date } 개봉 
                            </strong>
                            <strong>
                                ${dto.screen } 
                            </strong>
                            <strong>
                                ${dto.age}세 <br>
                            </strong>
                            
                        </span>
                        <span class="like"> 
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
                            <a class="#">예매</a>
                        </span>
                    </div>    
                </li>
                </ol>
                </div>
  </c:forEach>              
<script id="temp_movie" type="text/x-jquery-tmpl">
    <li>
        <div class="box-image" >
            <a href="/movies/detail-view/?midx=${MovieIdx}">
                <span class="thumb-image">
                    <img src="${PosterImage.MiddleImage}" alt="${Title}" onerror="errorImage(this)"/>
                    <span class="ico-grade ${MovieGrade.StyleClassName}">${MovieGrade.GradeText}</span>
                </span>
            </a>
            <span class="screentype">
                {{each MovieKindList}}
                <a class="${StyleClassName}" href="#" data-regioncode="${RegionCode}">${KindName}</a>
                {{/each}}
            </span>
        </div>
                    
        <div class="box-contents">
            <a href="/movies/detail-view/?midx=${MovieIdx}">
                <strong class="title">${Title}</strong>
            </a>

            <div class="score">
                <strong class="percent">예매율<span>${TicketRate}%</span></strong>
                <!--[2015-12-14] 평점 개편 에그 포인트 및 에그 이미지 노출 추가. start : add_mwpark-->
                <div class="egg-gage small">
                    {{if D_Day > 0}}
                        <span class="egg good"></span>
                        <span class="percent">?</span>
                    {{else (JointCount < 100)}}
                        <span class="egg good"></span>
                        <span class="percent">?</span>
                    {{else (JointCount >= 100 && EggPoint >=85)}}
                        <span class="egg great"></span>
                        <span class="percent">                        
                        {{if EggPoint >= 100}}
                        99%
                        {{else}}
                        ${EggPoint}%
                        {{/if}}
                        </span>
                    {{else (JointCount >= 100 && EggPoint >= 70 && EggPoint < 85)}}
                        <span class="egg good"></span>
                        <span class="percent">${EggPoint}%</span>
                    {{else (JointCount >= 100 && EggPoint < 70)}}
                        <span class="egg"></span>
                        <span class="percent">${EggPoint}%</span>
                    {{/if}}
                </div>
                <!--[2015-12-14] 평점 개편 에그 포인트 및 에그 이미지 노출 추가. end : add_mwpark-->
            </div>

            <span class="txt-info">
                <strong>
                    ${OpenDate}
                    <span>${OpenText}</span>
                    {{if D_Day > 0}}
                        <em class="dday">D-${D_Day}</em>
                    {{/if}}
                </strong>
            </span>
            <span class="like"> 
                <button class="btn-like" value="${MovieIdx}">영화 찜하기</button>
                <span class="count"> 
                    <strong><i>${FavCount}</i><span>명이 선택</span></strong> 
                    <i class="corner-RT"></i><i class="corner-LT"></i><i class="corner-LB"></i><i class="corner-RB"></i><i class="corner-arrow"></i>
                </span>
                {{if (IsTicketing)}}<a class="link-reservation" href="http://www.cgv.co.kr/ticket/?MOVIE_CD=${CGVCode}&MOVIE_CD_GROUP=${MovieGroupCode}">예매</a>{{/if}}
            </span>
        </div>    
    </li>
</script>

	<%@ include file="../footer.jsp"%>