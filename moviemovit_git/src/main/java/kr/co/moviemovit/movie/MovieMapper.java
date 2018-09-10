package kr.co.moviemovit.movie;

import java.util.ArrayList;

public interface MovieMapper {
	
	public int create(MovieDTO dto);
	
	public ArrayList<MovieDTO> list();
	
	public MovieDTO read(MovieDTO dto);
	
	public int delete(MovieDTO dto);
	
	public int update(MovieDTO dto);
	

}//interface end
