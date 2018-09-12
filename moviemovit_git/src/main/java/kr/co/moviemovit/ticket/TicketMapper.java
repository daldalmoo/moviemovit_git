package kr.co.moviemovit.ticket;

import java.util.ArrayList;

public interface TicketMapper {
  /*
      매퍼에 등록되어 있는 id를 인터페이스의 메소드에
      다시 한번 등록함으로써 MyBatis3를 호출하기 편리하도록 지원함.
   */
  
  // .xml 에서 정의한 <insert id="create"> 활용. id가 메소드명으로 와야함. body 작성 따로 안함.
  public ArrayList<TicketDTO> list();
  //public int create(TicketDTO dto);
  //public ArrayList<String> uidlist();
  //public ArrayList<String> uidsearch(String uid);
  //public TicketDTO read(int cCode);
  //public int update(TicketDTO dto);
  //public int delete(int cCode);
  
  
}//interface end
