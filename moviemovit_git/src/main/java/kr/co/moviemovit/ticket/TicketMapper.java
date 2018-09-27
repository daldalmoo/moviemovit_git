package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

public interface TicketMapper {

	public ArrayList<TicketDTO> list();
	
	//<select id="movieList">
	public ArrayList<MovieDTO> movieList();
	
	/* -------------------- ���弱�� �κ� -------------------- */
	//<select id="cineAddr1List" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cineAddr1List();

  //<select id="cineList" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cinemaList();
	
	//<select id="cinelistFromMovie" parameterType="int" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cinemaSelListFromMovie(int mCode);
	/* -------------------- ���弱�� �κ� END -------------------- */
	
	//<select id="movieData">
	public MovieDTO movieData(MovieDTO dto);
	
}// interface end
