package kr.co.moviemovit.ticket;

import java.util.ArrayList;

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

  //<select id="cinelistFromMovie" parameterType="int" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> grayCinemaList(int mCode);
  
  //<select id="cinemaSelListFromMovieAddr1" parameterType="MovieDTO" resultType="CinemaDTO">
  public ArrayList<CinemaDTO> cinemaSelListFromMovieAddr1(MovieDTO dto);
  
  //<select id="cinemacnt" resultType="int">
  public int cinemacnt();
  
  //<select id="addr1cnt" parameterType="String" resultType="int">
  public int addr1cnt(String addr1);

  //<select id="cinemaListaddr1" parameterType="String" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cinemaListaddr1(String addr1);
	/* -------------------- ���� : ���弱�� �κ� END -------------------- */
	
}// interface end
