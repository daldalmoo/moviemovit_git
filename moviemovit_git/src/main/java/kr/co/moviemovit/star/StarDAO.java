package kr.co.moviemovit.star;

import java.util.ArrayList;

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
		System.out.println("---------StarDAO() ��ü ����");
	}//�⺻ ������
	
	public MovieDTO movieList(MovieDTO dto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
        MovieDTO list = mapper.movieList(dto);
        return list;
    }//movieList() end
	
	public ArrayList<String> uidList(String uid) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		ArrayList<String> list = mapper.uidList(uid);
	    return list;
	}
	
	public int create(StarDTO dto) {
		StarMapper mapper = sqlSession.getMapper(StarMapper.class);
		int count = mapper.create(dto);
	    return count;
	}//create() end
	
	
	
	

}
