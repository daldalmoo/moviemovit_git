package kr.co.moviemovit.star;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.movie.MovieMapper;
import kr.co.moviemovit.people.PeopleDTO;
import kr.co.moviemovit.people.PeopleMapper;
import kr.co.moviemovit.user.UserDTO;


@Component
public class StarDAO {
	
	@Autowired
	SqlSession sqlSession;

	public StarDAO() {
		System.out.println("---------StarDAO() 按眉 积己");
	}//扁夯 积己磊
	
	public MovieDTO movieList(MovieDTO dto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
        MovieDTO list = mapper.movieList(dto);
        return list;
    }//movieList() end
	
	public ArrayList<String> uidList(ArrayList<String> uid) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		ArrayList<String> list = mapper.uidList(uid);
	    return list;
	}
	
	public int create(StarDTO sdto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		int count = mapper.create(sdto);
	    return count;
	}//create() end
	
	public ArrayList<HashMap<MovieDTO, StarDTO>> starlist(StarDTO sdto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		ArrayList<HashMap<MovieDTO, StarDTO>> starlist = mapper.starlist(sdto);
		return starlist;
	}//starlist() end
	
	public int avgstar(StarDTO sdto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		int avgstar = mapper.avgstar(sdto);
		return avgstar;
	}//avgstar() end
	
	public ArrayList<StarDTO> genrestar(StarDTO sdto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		ArrayList<StarDTO> genrestar = mapper.genrestar(sdto);
		return genrestar;
	}//genrestar() end

}//class end
