package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

@Component
public class TicketDAO {
  
  @Autowired
  SqlSession sqlSession;
  
  public TicketDAO() {
    System.out.println("---------- TicketDAO() 객체 생성");
  }//default constructor
  
/*********************************** 예매 목록 *********************************************/
  // 예매 목록 select
  public ArrayList<TicketDTO> list() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<TicketDTO> list = mapper.list();
    return list;
  }//list() end
  

/************************************ 예매 *************************************************/
  // 예매 중 영화목록
  public ArrayList<MovieDTO> movieList() {
	TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
	ArrayList<MovieDTO> movieList = mapper.movieList();
	return movieList;
  }//movieList() end
  
  /* ------------------ 예매 : 극장선택 부분 ------------------ */
  public int cinemacnt() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int cinemacnt = mapper.cinemacnt();
    return cinemacnt;
  }//cinemacnt() end
  
  public int addr1cnt(String addr1) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int addr1cnt = mapper.addr1cnt(addr1);
    return addr1cnt;
  }//addr1cnt() end
  
  public ArrayList<CinemaDTO> cinemaList() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinemalist = mapper.cinemaList();
    return cinemalist;
  }//cineList() end
  
  public ArrayList<CinemaDTO> cinemaSelListFromMovie(int mCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.cinemaSelListFromMovie(mCode);
    return cinelist;
  }//cinemaSelListFromMovie() end
  /* ------------------ 예매 : 극장선택 부분 END ------------------ */
  
  
}//class end
