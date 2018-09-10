package kr.co.moviemovit.coupon;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/*
private int cCode;    // 쿠폰코드
private String uid;   // 유저 아이디
private String startDate;   // 발급일
private String expDate;     // 만료일
*/
@Component
public class CouponDAO {
  
  //@Autowired
  //DBOpen dbopen;
  
  //root-context.xml의 <bean id=sqlSession> 의존 관계를 자동으로 연결 및 객체 자동 생성
  @Autowired
  SqlSession sqlSession;
  
  public CouponDAO() {
    System.out.println("---------- CouponDAO() 객체 생성");
  }//default constructor
  
  
/*********************************** 쿠폰 목록 *********************************************/
  // 쿠폰 목록 select
  public ArrayList<CouponDTO> list() {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    ArrayList<CouponDTO> list = mapper.list();
    return list;
  }//list() end
  

/************************************ 등록 *************************************************/
  // 쿠폰 등록 insert
  public int create(CouponDTO dto) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    int count = mapper.create(dto);
    return count;
  }//create() end
  
  // 쿠폰 등록&수정시 필요한 회원 아이디 목록 가져오기 select
  public ArrayList<String> uidlist() {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    ArrayList<String> list = mapper.uidlist();
    return list;
  }//uidlist() end
  
  // 쿠폰 등록&수정시 검색어와 일치하는 회원 아이디 목록 가져오기 select where
  public ArrayList<String> uidsearch(String uid) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    ArrayList<String> list = mapper.uidsearch(uid);
    return list;
  }//uidsearch() end
  
  
/************************************ 수정 *************************************************/
  // 쿠폰 한개 상세데이터 가져오기 select
  public CouponDTO read(int cCode) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    CouponDTO dto = mapper.read(cCode);
    return dto;
  }//read() end
  
  // 쿠폰 수정 update
  public int update(CouponDTO dto) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    int count = mapper.update(dto);
    return count;
  }//update() end
  
  
/************************************ 삭제 *************************************************/
  // 쿠폰 삭제 delete
  public int delete(int cCode) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    int count = mapper.delete(cCode);
    return count;
  }//delete() end
  
}//class end
