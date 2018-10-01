package kr.co.moviemovit.homework;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.movie.MovieDTO;

@Component
public class HomeDAO {
  
  @Autowired
  SqlSession sqlSesison;

  public HomeDAO() {
     System.out.println("----------MovieDAO()");
  }//±âº» »ý¼ºÀÚ
  
  
  public  ArrayList<MovieDTO> homework1() {
    HomeMapper mapper = sqlSesison.getMapper(HomeMapper.class);
    ArrayList<MovieDTO> list = mapper.homework1();
     return list;
  }

}//class end