package kr.co.moviemovit.people;

import java.util.ArrayList;

public interface PeopleMapper {
	
	public int create(PeopleDTO dto);
	
	public ArrayList<PeopleDTO> list();
	
    public PeopleDTO read(PeopleDTO dto);
	
	public int delete(PeopleDTO dto);
	
	public int update(PeopleDTO dto);

}
