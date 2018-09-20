package kr.co.moviemovit.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.moviemovit.review.CinemaDTO;

public interface ReviewMapper {
  
  public ArrayList<ReviewStar> reviewstar();

  ///////////////////////////////////////////// CINEMA //////////////////////////////////////
  
  // Create
  public int cinemaForm(CinemaDTO dto);
  
  // create : cineCode »ý¼º
  public String setCineCode(String brandName);
 
  // Read
  public CinemaDTO cinemaRead(CinemaDTO dto);
  
  // Update
  public int cinemaUpdate(CinemaDTO dto);
  
  // Delete
  public int cinemaDeletePro(String cineCode);
  
  // List 
  public ArrayList<CinemaDTO> cinemaList();
  
  // List : search
  public ArrayList<CinemaDTO> search(@Param("sch_type")String sch_type, @Param("sch_value")String sch_value);
  
  // List : category
  public ArrayList<CinemaDTO> cate(@RequestParam("checkArr[]")List<String> cate, @RequestParam("checkArr2[]")List<String> cate2);
  
  // LIST : Paging : FAIL
  //public int selectListCnt(); 
  
  // LIST : paging
  public ArrayList<CinemaDTO> listCriteria(Criteria cri);
  
  //////////////////////////////////////// ROOM ///////////////////////////////////////
  // Create
  public int roomForm(RoomDTO dto);
  
  // Create : roomCode, roomName
  public RoomDTO setRoomCode(String cineCode);
  
  // Read
  public RoomDTO roomRead(RoomDTO dto);
 
  // Update
  public int roomUpdate(RoomDTO dto);
  
  // Delete
  public int roomDeletePro(String roomCode);
  
  // List
  public ArrayList<RoomDTO> roomList(String cineCode);

  
  //////////////////////////////////////// REVIEW ///////////////////////////////////////
  // Create
  public int create(ReviewStar sdto);
  
  // list
  public ArrayList<ReviewStar> list();
  
  // Delete
  public int delete(String no);
  
  
} // class end
