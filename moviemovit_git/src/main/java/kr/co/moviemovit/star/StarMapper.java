package kr.co.moviemovit.star;

import java.util.ArrayList;

import kr.co.moviemovit.movie.MovieDTO;

public interface StarMapper {
	
	public MovieDTO movieList(MovieDTO dto);
	
	public ArrayList<String> uidList(String uid);
	
	public int create(StarDTO dto); 
	
	
	
	
	

}//interface end
