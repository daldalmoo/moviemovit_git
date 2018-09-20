<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 theaterForm.jsp --%>
<head>
	
	<!-- 별점test 유진언니 -->
	<meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>jQuery Bar Rating - Minimal, light-weight jQuery ratings</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=1024, initial-scale=1">
  <link rel="stylesheet" href="ratingjs/examples/css/normalize.min.css">
  <link rel="stylesheet" href="ratingjs/examples/css/main.css">
  <link rel="stylesheet" href="ratingjs/examples/css/examples.css">
  <!-- Icons -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">


	
	<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>
/* 별점  0904*/
/* .starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
 */
/* test */
/* td:first-child {
    height: 50px;
  }

.list {
	text-align: left;
	padding: 10px;
	margin: auto;
} */



/* test유진언니 */
@font-face {
        font-family: 'Glyphicons Halflings';
        src:url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.eot');
        src:url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.woff') format('woff'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.ttf') format('truetype'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
           }



</style>
</head>
<%
   String uid = (String) session.getAttribute("s_id");
   session.setAttribute("uid", uid);
  %>
<FORM class="cbp-mc-form" name='frm' method='POST' action='./create.do'>
	<span style="color: red; font-weight: bold">* 필수입력</span><br>
	<input type="hidden" name="uid" value="<%= uid %>" />
	

 <!-- <div class="table-review">
	<table class="review" width="100%">
		<tr>
			<td>
					 
					 
					 별점test
                 <div class="starRev">
                 <input type="hidden" id="pixel" name="pixel" value="">
   			           화질   <span class="starR on" value="1" name="pixel">별1</span>
                 <span class="starR" value="2" name="pixel"> 별2</span>
                 <span class="starR" value="3" name="pixel">별3</span>
                 <span class="starR" value="4" name="pixel">별4</span> 
                 <span class="starR" value="5" name="pixel">별5</span>
                 </div>
                별점test
                  <script>
                  $('.starRev span').click(function(){
                 $(this).parent().children('span').removeClass('on');
                 $(this).addClass('on').prevAll('span').addClass('on');
                 var pixelnum = $("span[name='pixel']").val();
                 $('#pixel').val('pixelnum');
                 
                 return false;
               });   
					 
						
						
					  <div class="starRev">
		   	  화질 <span class="starR on">별1</span>
					  <span class="starR">별2</span>
					  <span class="starR">별3</span>
					  <span class="starR">별4</span> 
					  <span class="starR">별5</span>
						</div>
						별점test
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	 
						
						
						</script>
				
			</td>
			<td>
			
						
					  <div class="starRev">
			    청결도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<span class="starR on">별1</span>
			    	<input type="hidden" id="clean" name="clean">
					  <span class="starR">별2</span>
					  <input type="hidden" id="clean" name="clean">
					  <span class="starR">별3</span>
					  <input type="hidden" id="clean" name="clean">
					  <span class="starR">별4</span>
					  <input type="hidden" id="clean" name="clean">
					  <span class="starR">별5</span>
					  <input type="hidden" id="clean" name="clean">
						</div>
						
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>			
						
			</td>
		</tr>
		<tr>
			<td>
					  <div class="starRev">
			     음향 <span class="starR on">별1</span>
			      <input type="hidden" id="sound" name="sound">
					  <span class="starR">별2</span>
					  <input type="hidden" id="sound" name="sound">
					  <span class="starR">별3</span>
					  <input type="hidden" id="sound" name="sound">
					  <span class="starR">별4</span>
					  <input type="hidden" id="sound" name="sound">
					  <span class="starR">별5</span>
					  <input type="hidden" id="sound" name="sound">
						</div>
						
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
			<td>
			
					  <div class="starRev">
			    서비스  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<span class="starR on">별1</span>
			    	<input type="hidden" id="service" name="service">
					  <span class="starR">별2</span>
					  <input type="hidden" id="service" name="service">
					  <span class="starR">별3</span>
					  <input type="hidden" id="service" name="service">
					  <span class="starR">별4</span>
					  <input type="hidden" id="service" name="service">
					  <span class="starR">별5</span>
					  <input type="hidden" id="service" name="service">
						</div>

				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>			
									
			</td>
		</tr>
		<tr>
			<td>
			
						별점test
					  <div class="starRev">
			    좌석 <span class="starR on">별1</span>
			      <input type="hidden" id="seat" name="seat">
					  <span class="starR">별2</span>
					  <input type="hidden" id="seat" name="seat">
					  <span class="starR">별3</span>
					  <input type="hidden" id="seat" name="seat">
					  <span class="starR">별4</span>
					  <input type="hidden" id="seat" name="seat">
					  <span class="starR">별5</span>
					  <input type="hidden" id="seat" name="seat">
						</div>
						별점test
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
			<td>
			
					  <div class="starRev">
	     교통 접근성  &nbsp;&nbsp;&nbsp;
	     			<span class="starR on">별1</span>
	     			<input type="hidden" id="trans" name="trans">
					  <span class="starR">별2</span>
					  <input type="hidden" id="trans" name="trans">
					  <span class="starR">별3</span>
					  <input type="hidden" id="trans" name="trans">
					  <span class="starR">별4</span>
					  <input type="hidden" id="trans" name="trans">
					  <span class="starR">별5</span>
					  <input type="hidden" id="trans" name="trans">
						</div>

				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
		</tr>
		<tr>
			<td>
			

					  <div class="starRev">
			    매점  <span class="starR on">별1</span>
			      <input type="hidden" id="snack" name="snack" value="1">
					  <span class="starR">별2</span>
					  <input type="hidden" id="snack" name="snack" value="2">
					  <sp an class="starR">별3</span>
					  <input type="hidden" id="snack" name="snack" value="3">
					  <span class="starR">별4</span>
					  <input type="hidden" id="snack" name="snack" value="4">
					  <span class="starR">별5</span>
					  <input type="hidden" id="snack" name="snack" value="5">
						</div>

				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
			<td>
			

					  <div class="starRev">
	 주변 편의시설 <span class="starR on">별1</span>
	 					<input type="hidden" id="around" name="around" value="1">
					  <span class="starR">별2</span>
					  <input type="hidden" id="around" name="around" value="2">
					  <span class="starR">별3</span>
					  <input type="hidden" id="around" name="around" value="3">
					  <span class="starR">별4</span>
					  <input type="hidden" id="around" name="around" value="4">
					  <span class="starR">별5</span>
					  <input type="hidden" id="around" name="around" value="5">
						</div>

				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
		</tr>
		<tr>
			<td>리뷰내용</td>
		</tr>
		<tr>
			<td colspan="2"><textarea name="s_e" id="s_e" style="width: 80%"></textarea></td>
		</tr>
	</table>
</div>
 -->
		<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="등록" /> 
		<input class="cbp-mc-submit" type="button" value="취소"
					 onclick="javascript:history.back()" />
		</div>	
 
</form>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>