package kr.co.moviemovit.screen;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

@Component
public class ScreenDAO {
	@Autowired
	SqlSession sqlSession;
	
	public ScreenDAO() {
		System.out.println("---ScreenDAO() 객체 생성");
	}//기본 생성자
	
	/*비즈니스 로직*/
	
	//영화관 브랜드에 해당하는 지점가져오기
	public ArrayList<CinemaDTO> cineNameList(String brandName) {
		ScreenMapper mapper = sqlSession.getMapper(ScreenMapper.class);
		System.out.println("---ScreenCont 7");
		ArrayList<CinemaDTO> cineList = mapper.cineNameList(brandName);
		System.out.println("---ScreenCont 8");
		return cineList;
	}//ChoosecineName() end
	
	//영화 목록 가져오기
	public ArrayList<MovieDTO> movieNameList(String mName) {
		ScreenMapper mapper = sqlSession.getMapper(ScreenMapper.class);
		ArrayList<MovieDTO> movieList = mapper.movieNameList(mName);
		return movieList;
	}//movieNameList() end
}//class end
