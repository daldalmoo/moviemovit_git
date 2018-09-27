package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

public interface TicketMapper {
/*********************************** 예매 목록 *********************************************/
	//<select id="list" resultType="TicketDTO">
  public ArrayList<TicketDTO> list();
	
/*********************************** 예매 *********************************************/
  /* -------------------- 예매 : 영화선택 부분 -------------------- */
	//<select id="movieList">
	public ArrayList<MovieDTO> movieList();
	
  /* -------------------- 예매 : 영화선택 부분 END -------------------- */
	
	/* -------------------- 예매 : 극장선택 부분 -------------------- */
  //<select id="cineList" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaList();

  //<select id="cinemacntFromAddr1" parameterType="String" resultType="int">
  public int cinemacntFromAddr1(@Param("addr1")String addr1);  // @Param 안해주면 xml에서 if문 못탐
  
  //<select id="cinemaListFromAddr1" parameterType="String" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromAddr1(String addr1);
  
  //<select id="cinemaListFromMovieAddr1" parameterType="MovieDTO" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromMovieAddr1(MovieDTO dto);
  
  //<select id="grayCinemaList" parameterType="int" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> grayCinemaList(int mCode);
  
	/* -------------------- 예매 : 극장선택 부분 END -------------------- */
	
}// interface end
