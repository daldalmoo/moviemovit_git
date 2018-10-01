package kr.co.moviemovit.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class ReviewDAO {

  @Autowired
  SqlSession sqlSession;
  
  public ReviewDAO() {
    System.out.println("------------ReviewDAO created");
  }


/////////////////////////// CINEMA ////////////////////////////////////
  
  // LIST
  public ArrayList<CinemaDTO> cinemaList(){   
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.cinemaList();
    return list;    
  }
  
  // LIST : �˻�
  public ArrayList<CinemaDTO> search(String sch_type, String sch_value) {    
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.search(sch_type, sch_value);
    return list;
  }
  
  
  // LIST : ī�װ�
  public ArrayList<CinemaDTO> cate(@RequestParam("checkArr[]")List<String> cate, @RequestParam("checkArr2[]")List<String> cate2) {    
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.cate(cate, cate2);
    return list;
    
  }
  
  // LIST : ī�װ� > �귣�弱��
  public ArrayList<CinemaDTO> selectBrand(CinemaDTO dto) {    
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.selectBrand(dto);
    return list;
    
  }
  
  // LIST : ī�װ� > �ּҼ���
  public ArrayList<CinemaDTO> addrList(String addr1) {    
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.addrList(addr1);
    return list;
    
  }
  
//LIST : ī�װ� > �ּҼ��� �� List �����ֱ�
 public ArrayList<CinemaDTO> selectAddr(String addr1) {    
   ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
   ArrayList<CinemaDTO> list = mapper.selectAddr(addr1);
   return list;
   
 }
  
  
  
  //LIST : ����¡

  // LIST : ��ȭ�� ���� ��Ż��
  public ArrayList<ReviewStar> reviewstar(){  
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<ReviewStar> reviewstar = mapper.reviewstar();
    return reviewstar;    
  }
  
  // CREATE
  public int cinemaForm(CinemaDTO dto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.cinemaForm(dto);
    return count;
  }// create() end
  
  // CREATE : cineCode ����
  public String setCineCode(String brandName){
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    String cineCode = mapper.setCineCode(brandName);
    return cineCode;
  }//
  
  
  // READ 
  public CinemaDTO cinemaRead(CinemaDTO dto){
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    dto = mapper.cinemaRead(dto);
    return dto;
  }//read
  
  
  // UPDATE
  public int cinemaUpdate(CinemaDTO dto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.cinemaUpdate(dto);
    return count;
  }// update end
  
  
  // DELETE
  public int cinemaDeletePro(String cineCode) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.cinemaDeletePro(cineCode);
    return count;
  }// delete end
  


  
  //LIST : select+ limit�� �̿��� ����¡ ���� ����
  
  public ArrayList<CinemaDTO> listCriteria(Criteria cri){
    ReviewMapper mapper= sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.listCriteria(cri);
    return list;
  }
  
  ////////////////////////////////////////// ROOM //////////////////////////////////////////////////////////
  
  //CREATE
  public int roomForm(RoomDTO dto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.roomForm(dto);
    return count;
  }// roominsert() end
  
  // CREATE : roomCode, roomName ����
  public RoomDTO setRoomCode(String cineCode){
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    RoomDTO dto = mapper.setRoomCode(cineCode);
    return dto;
  } // create setroomCode end
  
  // READ 
  public RoomDTO roomRead(RoomDTO dto){
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    dto = mapper.roomRead(dto);
    return dto;
  }//room read end
  
  // UPDATE
  public int roomUpdate(RoomDTO dto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.roomUpdate(dto);
    return count;
  }// roomupdate end
  
  // DELETE
  public int roomDeletePro(String roomCode) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.roomDeletePro(roomCode);
    return count;
  }// roomdelete end
 
  //List
  public ArrayList<RoomDTO> roomList(String cineCode){
    ReviewMapper mapper= sqlSession.getMapper(ReviewMapper.class);
    ArrayList<RoomDTO> list = mapper.roomList(cineCode);
    return list;
  }
  
  ////////////////////////////////////////// REVIEW  //////////////////////////////////////////////////////////
  // insert ���
  public int create(ReviewStar sdto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.create(sdto);
    return count;
  }// create() end
  
  //dupliacate ��� �� �ߺ� Ȯ��
  public ReviewStar duplicate(ReviewStar sdto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ReviewStar dto = mapper.duplicate(sdto);
    return dto;
  }// create() end
  
  //review ���
  public ArrayList<ReviewStar> list(String cineCode) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<ReviewStar> list = mapper.list(cineCode);
    return list;
  }//list() end
  
   
  //review ����
  public int deleteProc(String no) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.delete(no);
    return count;
  }// delete end
   
  //review ����
  public ReviewStar updateList(ReviewStar inputStar) {
    System.out.println(inputStar.getNo() + "/" + inputStar.getCineCode());
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ReviewStar rs = mapper.updateList(inputStar);
    return rs;
  }//list() end
  
  //reviewUpdate
  public int reviewUpdate(ReviewStar sdto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.reviewUpdate(sdto);
    return count;
  }// update end
  
  // dupliacate ��� �� �ߺ� Ȯ��
  
  public ArrayList<ReviewStar> starRead(ReviewStar sdto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<ReviewStar> dto = mapper.starRead(sdto);
    return dto;
  }// create() end
  

} //class end
