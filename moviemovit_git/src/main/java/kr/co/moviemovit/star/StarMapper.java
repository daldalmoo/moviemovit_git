package kr.co.moviemovit.star;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kr.co.moviemovit.movie.MovieDTO;

public interface StarMapper {
	
	public MovieDTO movieList(MovieDTO dto);
	
	public ArrayList<String> uidList(ArrayList<String> uid);
	
	public int create(StarDTO sdto); 
	
	/*public HashMap<Star> starlist(Star dto);*/
	
	public ArrayList<HashMap<MovieDTO, StarDTO>> starlist(StarDTO sdto);
	
	public int avgstar(StarDTO sdto);
	

}//interface end
