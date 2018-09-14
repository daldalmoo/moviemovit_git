<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 본문시작 template.jsp --%>

<table>
      <tr>
         <th>영화관</th>
         <th>브랜드</th>
         <th>지점</th>
         <th>별점</th>
         <th>주소</th>
         <th width="230">문의전화</th>
         <th>수정버튼</th>
      </tr> 
      
       <c:forEach var="dto" items="${list }"> 
           <tr class="brandtest">
           <td>
           <c:choose>
               <c:when test="${dto.logoImg == '' || dto.logoImg eq null}">
               <img src="img/default.png" alt="" /></td>
               </c:when>
               <c:otherwise>
               <img src="${dto.logoImg}" alt="" /></td>
               </c:otherwise> 
           </c:choose>
           <td>
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
           </td>
           <td>${dto.cineName }</td>
           <td>
           <c:forEach var="reviewstar" items="${reviewstar }">
           <c:choose>
              <c:when test="${dto.cineCode == reviewstar.cineCode}">
               ${reviewstar.startotal}
               </c:when>
               <c:otherwise> </c:otherwise> 
            </c:choose>
            </c:forEach> 
           </td>
           <td>
            <a href="./cinemaRead.do?cineCode=${dto.cineCode }" >${dto.addr2}  ${dto.addr3}</a></td>
           <td>${dto.tel}</td>
                    <td>
               <input class="cbp-mc-button" type="button" value="수정" onclick="location.href='./cinemaUpdate.do?cineCode=${dto.cineCode }'"/>
               <input class="cbp-mc-button" type="button" value="삭제" onclick="location.href='./cinemaDelete.do?cineCode=${dto.cineCode }'"/>
             </td>
         </tr>  
     </c:forEach>
   </table>
