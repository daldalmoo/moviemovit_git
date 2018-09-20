package kr.co.moviemovit.movie;

import java.util.ArrayList;

import kr.co.moviemovit.people.PeopleDTO;
import kr.co.moviemovit.star.StarDTO;

public interface MovieMapper {
	
	public int create(MovieDTO dto);
	
	public ArrayList<MovieDTO> list();
	
	public MovieDTO read(MovieDTO dto);
	
	public int delete(MovieDTO dto);
	
	public int update(MovieDTO dto);
	
	public ArrayList<PeopleDTO> peopleNameList(String peoName);
	
	public ArrayList<PeopleDTO> peopleNameList2(String peoName);
	
	public StarDTO star(StarDTO sdto);
}//interface end
