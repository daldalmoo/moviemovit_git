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
		System.out.println("---ScreenDAO() ��ü ����");
	}//�⺻ ������
	
	/*����Ͻ� ����*/
	
	//��ȭ�� �귣�忡 �ش��ϴ� ������������
	public ArrayList<CinemaDTO> cineNameList(String brandName) {
		ScreenMapper mapper = sqlSession.getMapper(ScreenMapper.class);
		System.out.println("---ScreenCont 7");
		ArrayList<CinemaDTO> cineList = mapper.cineNameList(brandName);
		System.out.println("---ScreenCont 8");
		return cineList;
	}//ChoosecineName() end
	
	//��ȭ ��� ��������
	public ArrayList<MovieDTO> movieNameList(String mName) {
		ScreenMapper mapper = sqlSession.getMapper(ScreenMapper.class);
		ArrayList<MovieDTO> movieList = mapper.movieNameList(mName);
		return movieList;
	}//movieNameList() end
}//class end