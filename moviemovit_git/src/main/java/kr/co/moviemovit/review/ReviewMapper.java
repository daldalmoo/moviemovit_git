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
  public ArrayList<CinemaDTO> cate(@RequestParam("checkArr[]")List<String> cate);
  
  //////////////////////////////////////// REVIEW ///////////////////////////////////////
  
  // Create
  public int reviewForm(ReviewStar sdto);
  
} // class end
