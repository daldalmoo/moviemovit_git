package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;
import kr.co.moviemovit.screen.ScreenDTO;

public interface TicketMapper {

	public ArrayList<TicketDTO> list();
	
	//<select id="movieList">
	public ArrayList<MovieDTO> movieList();
	
	//<select id="cineAddr1List" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cineAddr1List();

  //<select id="cineList" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cineList();
	
	//<select id="cinelistFromMovie" parameterType="int" resultType="CinemaDTO">
	public ArrayList<CinemaDTO> cinelistFromMovie(int mCode);
	
}// interface end
