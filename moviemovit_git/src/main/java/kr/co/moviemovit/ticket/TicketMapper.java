package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import kr.co.moviemovit.movie.MovieDTO;

public interface TicketMapper {

	public ArrayList<TicketDTO> list();
	
	//<select id="movieList">
	public ArrayList<MovieDTO> movieList();
	
}// interface end
