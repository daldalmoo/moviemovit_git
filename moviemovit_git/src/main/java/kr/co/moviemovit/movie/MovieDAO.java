package kr.co.moviemovit.movie;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	
	

}//class end
