package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/*
  private String tCode;  // 예매코드(PK)
  private String wdate;  // 예매날짜
  private String uid;    // 유저 아이디 <- userTable
  private int sCode;     // 상영코드 <- screenTable
  private int cCode;     // 쿠폰사용여부 <- couponTable
  private String seat;   // 예매좌석위치(최대5명)
  private String auditType;  // 관람객유형 (adu you sen kid -> 성인 청소년 경로우대 아이)
*/
@Component
public class TicketDAO {
  
  //@Autowired
  //DBOpen dbopen;
  
  //root-context.xml의 <bean id=sqlSession> 의존 관계를 자동으로 연결 및 객체 자동 생성
  @Autowired
  SqlSession sqlSession;
  
  public TicketDAO() {
    System.out.println("---------- TicketDAO() 객체 생성");
  }//default constructor
  
  
/*********************************** 예매 목록 *********************************************/
  // 예매 목록 select
  public ArrayList<TicketDTO> list() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<TicketDTO> list = mapper.list();
    return list;
  }//list() end
  

/************************************ 등록 *************************************************/
  // 쿠폰 등록 insert
  /*public int create(TicketDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int count = mapper.create(dto);
    return count;
  }//create() end
  
  // 쿠폰 등록&수정시 필요한 회원 아이디 목록 가져오기 select
  public ArrayList<String> uidlist() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> list = mapper.uidlist();
    return list;
  }//uidlist() end
  
  // 쿠폰 등록&수정시 검색어와 일치하는 회원 아이디 목록 가져오기 select where
  public ArrayList<String> uidsearch(String uid) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> list = mapper.uidsearch(uid);
    return list;
  }//uidsearch() end
  */
  
/************************************ 수정 *************************************************/
  // 쿠폰 한개 상세데이터 가져오기 select
  /*public TicketDTO read(int cCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    TicketDTO dto = mapper.read(cCode);
    return dto;
  }//read() end
  
  // 쿠폰 수정 update
  public int update(TicketDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int count = mapper.create(dto);
    return count;
  }//update() end
  */
  
/************************************ 삭제 *************************************************/
  // 쿠폰 삭제 delete
  /*public int delete(int cCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int count = mapper.delete(cCode);
    return count;
  }//delete() end
  */
}//class end
