<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header.jsp"%>
<%-- 본문시작 movieList.jsp --%>

<style rel="stylesheet">
.header {   /* 영화관목록  */
  background-color: #3366cc;
  color: white; 
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;        
}
mimg {        /* 영화 포스터 */
  height: 400px;
  width: 200px;
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
  
  /* 사이즈 줄일때 나타나는 아이*/
  td:nth-child(2):before {
    content: '브랜드:';
  }
  td:nth-child(3):before {
    content: '지점:';
  }
  td:nth-child(4):before {
    content: '별점:';
  }
  td:nth-child(5):before {
    content: '주소:';
  }
  td:nth-child(6):before {
    content: '문의전화:';
  }
  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
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

<div class="table-users">
   <div class="header">Movie List</div>
   <table style="text-align:center; margin:center;">
      <tr>
        <th>영화명</th>
        <td>${dto.mName}</td>
      </tr>
      <tr>
        <th>포스터</th>
        <td><img class="mimg" src="./storage/${dto.poster }"></td>
      </tr>
      <tr>
        <th>장르</th>
        <td>
        ${dto.genre}
        </td>
      </tr>
      <tr>
        <th>상영분류</th>
        <td>${dto.screen}</td>
      </tr>
      <tr>
        <th>관람등급</th>
        <td>${dto.age}</td>
      </tr>
      <tr>
        <th>줄거리</th>
        <td>${dto.s_e}</td>
      </tr>
      <tr>
        <th>나라</th>
        <td>${dto.country}</td>
      </tr>
      <tr>
        <th>감독</th>
        <td>${dto.director}</td>
      </tr>
      <tr>
        <th>주연배우</th>
        <td>${dto.actor}</td>
      </tr>
      <tr>
        <th>영화타입</th>
        <td>${dto.DD}</td>
      </tr>
      <tr>
        <th>상영시간</th>
        <td>${dto.runningTime} 분</td>
      </tr>
      <tr>
        <th>개봉일</th>
        <td>${dto.s_date}</td>
      </tr>
      <tr>
        <th>마감일</th>
        <td>${dto.e_date}</td>
      </tr>
           
   </table>
   
   <!-- 하단 버튼 -->
	<div class="cbp-mc-submit-wrap">
		<input class="cbp-mc-button" type="button" value="영화등록" onclick="location.href='./create.do'"/>
		<input class="cbp-mc-button" type="button" value="영화목록" onclick="location.href='./movieList.do'"/>
		<input class="cbp-mc-button" type="button" value="예매하기" onclick="#" />
		<input class="cbp-mc-button" type="button" value="삭제" onclick="location.href='./delete.do?mCode=${dto.mCode }'"/>
		<input class="cbp-mc-button" type="button" value="수정" onclick="location.href='./update.do?mCode=${dto.mCode }'"/>
	</div>
</div>


<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>