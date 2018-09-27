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
  
  //<select id="cinemaListFromAddr1" parameterType="String" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromAddr1(String addr1);
  
  //<select id="cinemaListFromMovieAddr1" parameterType="MovieDTO" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaListFromMovieAddr1(MovieDTO dto);
  
  //<select id="grayCinemaList" parameterType="int" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> grayCinemaList(int mCode);
  
	/* -------------------- ���� : ���弱�� �κ� END -------------------- */
	
}// interface end
