<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header1.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style rel="stylesheet">
.startable {
  width:500px
  

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

.box-image {
  width:100%;
  height:180px;
  max-width: calc(100% - 85em);
  background-color: white;;
  border: 8px solid #3366cc; 
  box-sizing: content-box;
  margin: 1em auto;
}

.simg {
  font-size: 0;
  text-align: center;
  width: 100px;
  
  
}

.mimg {        /* 영화관 목록안의 영화관이미지 */
  font-size: 0;
  text-align: center;
  width: 100px;
  max-width: calc(100% - 50em);
  height: 180px;
  
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
  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }
  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }
  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}

</style>
<%@ include file="../header2.jsp"%>
<%-- 본문시작 movieList.jsp --%>
<% 
   String uid=(String)session.getAttribute("s_id");
   //out.println("세션확인:" + uid);
   session.setAttribute("uid", uid);
%> 
 <div class="table-users">
   <div class="header">MOVIE LIST</div>
 </div>
   
   <div>
   <div class="box-image" >
     <span class="thumb-image">
       <img class="mimg" src="../movie/img_poster/${dto.poster }"/>
     </span>  
   </div>
   <strong>  
              평균별점: ${avgstar} 
              <c:if test="${avgstar==0 }">
       <img class="simg" src="./img_star/star0.png"> 
       </c:if>
       <c:if test="${avgstar==1 }">
           <img class="simg" src="./img_star/star1.png"> 
       </c:if>
       <c:if test="${avgstar==2 }">
           <img class="simg" src="./img_star/star2.png"> 
       </c:if>
       <c:if test="${avgstar==3 }">
           <img class="simg" src="./img_star/star3.png"> 
       </c:if>
       <c:if test="${avgstar==4 }">
           <img class="simg" src="./img_star/star4.png"> 
       </c:if>
       <c:if test="${avgstar==5 }">
           <img class="simg" src="./img_star/star5.png">
       </c:if>
        </strong>
     <br>
     <span class="thumb-image">
       <strong>${dto.mName }</strong>
     </span>
   </div>
 

   
   <c:forEach var="sdto" items="${starlist }">
   <table calss="startable">
   
    <tr>
        별점: ${sdto.star}
     
     <c:if test="${sdto.star==0 }">
           <img class="simg" src="./img_star/star0.png"> 
       </c:if>
       <c:if test="${sdto.star==1 }">
           <img class="simg" src="./img_star/star1.png"> 
       </c:if>
       <c:if test="${sdto.star==2 }">
           <img class="simg" src="./img_star/star2.png"> 
       </c:if>
       <c:if test="${sdto.star==3 }">
           <img class="simg" src="./img_star/star3.png"> 
       </c:if>
       <c:if test="${sdto.star==4 }">
           <img class="simg" src="./img_star/star4.png"> 
       </c:if>
       <c:if test="${sdto.star==5 }">
           <img class="simg" src="./img_star/star5.png">
       </c:if>
     
     한줄평: ${sdto.comment } 
     작성일: ${sdto.wdate } 
     </tr>
   </table>
   </c:forEach>
   <!-- 하단 버튼 -->
   <div class="cbp-mc-submit-wrap">
     <input class="cbp-mc-button" type="button" value="영화목록" onclick="location.href='../movie/movieList.do'"/>
     <input class="cbp-mc-button" type="button" value="예매하기" onclick="#" />
   </div>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>
