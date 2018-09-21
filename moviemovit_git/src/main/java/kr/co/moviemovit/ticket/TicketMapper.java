package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

public interface TicketMapper {
/*********************************** ���� ��� *********************************************/
	//<select id="list" resultType="TicketDTO">
  public ArrayList<TicketDTO> list();
	
/*********************************** ���� *********************************************/
	//<select id="movieList">
	public ArrayList<MovieDTO> movieList();
	
	/* -------------------- ���� : ���弱�� �κ� -------------------- */
  //<select id="cinemacnt" resultType="int">
  public int cinemacnt();
  
  //<select id="addr1cnt" parameterType="String" resultType="int">
  public int addr1cnt(String addr1);
  
  //<select id="cineList" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cinemaList();
	
	//<select id="cinelistFromMovie" parameterType="int" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cinemaSelListFromMovie(int mCode);
	/* -------------------- ���� : ���弱�� �κ� END -------------------- */
	
}// interface end
