package kr.co.moviemovit.movie;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.people.PeopleDTO;
import kr.co.moviemovit.people.PeopleMapper;
import kr.co.moviemovit.screen.ScreenMapper;
import kr.co.moviemovit.star.StarDTO;

@Component
public class MovieDAO {
	
	@Autowired
	SqlSession sqlSesison;

	public MovieDAO() {
	   System.out.println("----------MovieDAO() 按眉 积己");
	}//扁夯 积己磊
	
	public int create(MovieDTO dto) {
		MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
		int count = mapper.create(dto);
	    return count;
	}//create() end
	
	public ArrayList<MovieDTO> list() {
	    MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
	    ArrayList<MovieDTO> list = mapper.list();
	    
	    return list;
	}//list() end
	
	public MovieDTO read(MovieDTO dto) {
		MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
	    dto = mapper.read(dto);
	    return dto;
    }//read() end
	
	public int delete(MovieDTO dto) {
	    MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
	    int count = mapper.delete(dto);
	    return count;
    }//delete() end
	
	public int update(MovieDTO dto) {
		MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
		int count = mapper.update(dto);
		return count;
	}//update() end

	public ArrayList<PeopleDTO> peopleNameList(String peoName) {
		MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
        ArrayList<PeopleDTO> peoplelist = mapper.peopleNameList(peoName);
        return peoplelist;
    }//peopleNameList() end
	
	public ArrayList<PeopleDTO> peopleNameList2(String peoName) {
		MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
        ArrayList<PeopleDTO> peoplelist2 = mapper.peopleNameList2(peoName);
        return peoplelist2;
    }//peopleNameList() end
	
	public StarDTO star(StarDTO sdto) {
		MovieMapper mapper = sqlSesison.getMapper(MovieMapper.class);
		StarDTO star = mapper.star(sdto);
		return star;
	}//update() end
	
	
	

}//class end
