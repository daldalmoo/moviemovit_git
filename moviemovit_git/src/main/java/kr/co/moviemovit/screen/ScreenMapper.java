package kr.co.moviemovit.screen;

import java.util.ArrayList;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

public interface ScreenMapper {
	/*		
		��id�� method������ �;���.
	 */
	//<select id="cineNameList">
	public ArrayList<CinemaDTO> cineNameList(String brandName);
	
	//<select id="movieNameList">
	public ArrayList<MovieDTO> movieNameList(String mName);
}//interface end