package kr.co.moviemovit.ticket;

import java.util.ArrayList;

public interface TicketMapper {
  /*
      ���ۿ� ��ϵǾ� �ִ� id�� �������̽��� �޼ҵ忡
      �ٽ� �ѹ� ��������ν� MyBatis3�� ȣ���ϱ� ���ϵ��� ������.
   */
  
  // .xml ���� ������ <insert id="create"> Ȱ��. id�� �޼ҵ������ �;���. body �ۼ� ���� ����.
  public ArrayList<TicketDTO> list();
  //public int create(TicketDTO dto);
  //public ArrayList<String> uidlist();
  //public ArrayList<String> uidsearch(String uid);
  //public TicketDTO read(int cCode);
  //public int update(TicketDTO dto);
  //public int delete(int cCode);
  
  
}//interface end
