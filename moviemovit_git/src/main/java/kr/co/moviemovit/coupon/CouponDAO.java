package kr.co.moviemovit.coupon;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/*
private int cCode;    // �����ڵ�
private String uid;   // ���� ���̵�
private String startDate;   // �߱���
private String expDate;     // ������
*/
@Component
public class CouponDAO {
  
  //@Autowired
  //DBOpen dbopen;
  
  //root-context.xml�� <bean id=sqlSession> ���� ���踦 �ڵ����� ���� �� ��ü �ڵ� ����
  @Autowired
  SqlSession sqlSession;
  
  public CouponDAO() {
    System.out.println("---------- CouponDAO() ��ü ����");
  }//default constructor
  
  
/*********************************** ���� ��� *********************************************/
  // ���� ��� select
  public ArrayList<CouponDTO> list() {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    ArrayList<CouponDTO> list = mapper.list();
    return list;
  }//list() end
  

/************************************ ��� *************************************************/
  // ���� ��� insert
  public int create(CouponDTO dto) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    int count = mapper.create(dto);
    return count;
  }//create() end
  
  // ���� ���&������ �ʿ��� ȸ�� ���̵� ��� �������� select
  public ArrayList<String> uidlist() {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    ArrayList<String> list = mapper.uidlist();
    return list;
  }//uidlist() end
  
  // ���� ���&������ �˻���� ��ġ�ϴ� ȸ�� ���̵� ��� �������� select where
  public ArrayList<String> uidsearch(String uid) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    ArrayList<String> list = mapper.uidsearch(uid);
    return list;
  }//uidsearch() end
  
  
/************************************ ���� *************************************************/
  // ���� �Ѱ� �󼼵����� �������� select
  public CouponDTO read(int cCode) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    CouponDTO dto = mapper.read(cCode);
    return dto;
  }//read() end
  
  // ���� ���� update
  public int update(CouponDTO dto) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    int count = mapper.update(dto);
    return count;
  }//update() end
  
  
/************************************ ���� *************************************************/
  // ���� ���� delete
  public int delete(int cCode) {
    CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);
    int count = mapper.delete(cCode);
    return count;
  }//delete() end
  
}//class end
