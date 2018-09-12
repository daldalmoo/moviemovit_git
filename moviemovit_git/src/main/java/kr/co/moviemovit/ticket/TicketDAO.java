package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/*
  private String tCode;  // �����ڵ�(PK)
  private String wdate;  // ���ų�¥
  private String uid;    // ���� ���̵� <- userTable
  private int sCode;     // ���ڵ� <- screenTable
  private int cCode;     // ������뿩�� <- couponTable
  private String seat;   // �����¼���ġ(�ִ�5��)
  private String auditType;  // ���������� (adu you sen kid -> ���� û�ҳ� ��ο�� ����)
*/
@Component
public class TicketDAO {
  
  //@Autowired
  //DBOpen dbopen;
  
  //root-context.xml�� <bean id=sqlSession> ���� ���踦 �ڵ����� ���� �� ��ü �ڵ� ����
  @Autowired
  SqlSession sqlSession;
  
  public TicketDAO() {
    System.out.println("---------- TicketDAO() ��ü ����");
  }//default constructor
  
  
/*********************************** ���� ��� *********************************************/
  // ���� ��� select
  public ArrayList<TicketDTO> list() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<TicketDTO> list = mapper.list();
    return list;
  }//list() end
  

/************************************ ��� *************************************************/
  // ���� ��� insert
  /*public int create(TicketDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int count = mapper.create(dto);
    return count;
  }//create() end
  
  // ���� ���&������ �ʿ��� ȸ�� ���̵� ��� �������� select
  public ArrayList<String> uidlist() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> list = mapper.uidlist();
    return list;
  }//uidlist() end
  
  // ���� ���&������ �˻���� ��ġ�ϴ� ȸ�� ���̵� ��� �������� select where
  public ArrayList<String> uidsearch(String uid) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> list = mapper.uidsearch(uid);
    return list;
  }//uidsearch() end
  */
  
/************************************ ���� *************************************************/
  // ���� �Ѱ� �󼼵����� �������� select
  /*public TicketDTO read(int cCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    TicketDTO dto = mapper.read(cCode);
    return dto;
  }//read() end
  
  // ���� ���� update
  public int update(TicketDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int count = mapper.create(dto);
    return count;
  }//update() end
  */
  
/************************************ ���� *************************************************/
  // ���� ���� delete
  /*public int delete(int cCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int count = mapper.delete(cCode);
    return count;
  }//delete() end
  */
}//class end
