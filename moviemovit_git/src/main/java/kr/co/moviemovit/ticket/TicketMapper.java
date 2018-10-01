package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

public interface TicketMapper {
/*********************************** ���� ��� *********************************************/
	//<select id="list" resultType="TicketDTO">
  public ArrayList<TicketDTO> list();
	
/*********************************** ���� *********************************************/
  /* -------------------- ���� : ��ȭ���� �κ� -------------------- */
	//<select id="movieList">
	public ArrayList<MovieDTO> movieList();
	
  /* -------------------- ���� : ��ȭ���� �κ� END -------------------- */
	
	/* -------------------- ���� : ���弱�� �κ� -------------------- */
  //<select id="cineList" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaList();

  //<select id="cinemacntFromAddr1" parameterType="String" resultType="int">
  public int cinemacntFromAddr1(@Param("addr1")String addr1);  // @Param �����ָ� xml���� if�� ��Ž
  
  //<select id="cinemacntFromAddr1Movie" parameterType="MovieDTO" resultType="int">
  public int cinemacntFromAddr1Movie(MovieDTO dto);

  //<select id="cinemacntFromAddr1CLMD" parameterType="CinemaDTO" resultType="int">
  public int cinemacntFromAddr1CLMD(CinemaDTO dto);
  
  //<select id="cinemaListFromAddr1" parameterType="String" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromAddr1(String addr1);
  
  //<select id="cinemaListFromMovieAddr1" parameterType="MovieDTO" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromMovieAddr1(MovieDTO dto);

  //<select id="cinemaListFromCLMDAddr1" parameterType="CinemaDTO" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromCLMDAddr1(CinemaDTO dto);
  
  //<select id="grayCinemaList" parameterType="int" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> grayCinemaList(int mCode);

  //<select id="cinemaSearch" parameterType="String" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaSearch(String key);
  
  
	/* -------------------- ���� : ���弱�� �κ� END -------------------- */

  /* ------------------ ���� : ��¥���� �κ� ------------------ */
  //<select id="sdateAllList" resultType="String">
  public ArrayList<String> sdateAllList();
  

  /* ------------------ ���� : ��¥���� �κ� END ------------------ */
  
	
	//<select id="movieData">
	public MovieDTO movieData(MovieDTO dto);
	
}// interface end
