<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 theaterForm.jsp --%>
<head>

<link href="../css/joinFormStyle.css" rel="stylesheet" type="text/css">

<style>

/* 별점  0904*/
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

/* test */
td:first-child {
    height: 50px;
  }



/*180827 경민 list 클래스 추가*/
.list {
	text-align: left;
	padding: 10px;
	margin: auto;
}
</style>
</head>
<FORM class="cbp-mc-form" name='frm' method='POST' action='./reviewform.do'>
	<span style="color: red; font-weight: bold">* 필수입력</span><br>

 <div class="table-review">
	<table class="review" width="100%">
		<tr>
			<td>
					 
						<!-- 별점test -->
					  <div class="starRev">
		   	  화질 <span class="starR on">별1</span>
					  <span class="starR">별2</span>
					  <span class="starR">별3</span>
					  <span class="starR">별4</span> 
					  <span class="starR">별5</span>
						</div>
						<!-- 별점test -->
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						
						</script>
				
			</td>
			<td>
			
						<!-- 별점test -->
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
						<!-- 별점test -->
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
						<!-- 별점test -->
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
						<!-- 별점test -->
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
			<td>
			
						<!-- 별점test -->
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
						<!-- 별점test -->
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
			
						<!-- 별점test -->
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
						<!-- 별점test -->
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
			<td>
			
						<!-- 별점test -->
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
						<!-- 별점test -->
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
			
						<!-- 별점test -->
					  <div class="starRev">
			    매점  <span class="starR on">별1</span>
			      <input type="hidden" id="snack" name="snack">
					  <span class="starR">별2</span>
					  <input type="hidden" id="snack" name="snack">
					  <span class="starR">별3</span>
					  <input type="hidden" id="snack" name="snack">
					  <span class="starR">별4</span>
					  <input type="hidden" id="snack" name="snack">
					  <span class="starR">별5</span>
					  <input type="hidden" id="snack" name="snack">
						</div>
						<!-- 별점test -->
				 	  <script>
						$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});	
						</script>						
			</td>
			<td>
			
						<!-- 별점test -->
					  <div class="starRev">
	 주변 편의시설 <span class="starR on">별1</span>
	 					<input type="hidden" id="around" name="around">
					  <span class="starR">별2</span>
					  <input type="hidden" id="around" name="around">
					  <span class="starR">별3</span>
					  <input type="hidden" id="around" name="around">
					  <span class="starR">별4</span>
					  <input type="hidden" id="around" name="around">
					  <span class="starR">별5</span>
					  <input type="hidden" id="around" name="around">
						</div>
						<!-- 별점test -->
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

		<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-submit" type="submit" value="등록" /> 
		<input class="cbp-mc-submit" type="button" value="취소"
					 onclick="javascript:history.back()" />
		</div>	
 
</form>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>