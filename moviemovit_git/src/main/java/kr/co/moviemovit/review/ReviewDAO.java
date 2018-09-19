package kr.co.moviemovit.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
  
  // LIST : 검색
  public ArrayList<CinemaDTO> search(String sch_type, String sch_value) {    
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.search(sch_type, sch_value);
    return list;
  }
  
  
  // LIST : 카테고리
  public ArrayList<CinemaDTO> cate(@RequestParam("checkArr[]")List<String> cate, @RequestParam("checkArr2[]")List<String> cate2) {    
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.cate(cate, cate2);
    return list;
    
  }
  
  //LIST : 페이징
 
  // LIST : 영화관 별점 토탈값
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
  
  // CREATE : cineCode 생성
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
  


  
  //LIST : select+ limit를 이용한 페이징 영역 구분
  
  public ArrayList<CinemaDTO> listCriteria(Criteria cri){
    ReviewMapper mapper= sqlSession.getMapper(ReviewMapper.class);
    ArrayList<CinemaDTO> list = mapper.listCriteria(cri);
    return list;
  }
  
  ////////////////////////////////////////// ROOM //////////////////////////////////////////////////////////
  
  /* insert 등록 */
  public int roomForm(RoomDTO dto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.roomForm(dto);
    return count;
  }// roominsert() end
  
  
  ////////////////////////////////////////// REVIEW  //////////////////////////////////////////////////////////
  /* insert 등록 */
  public int create(ReviewStar sdto) {
    ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
    int count = mapper.create(sdto);
    return count;
  }// create() end
  
   //review 목록
   public ArrayList<ReviewStar> list() {
     ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
     ArrayList<ReviewStar> list = mapper.list();
     return list;
   }//list() end

   
   

} //class end
