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
    System.out.println("---------- TicketDAO() ��ü ����");
  }//default constructor
  
/*********************************** ���� ��� *********************************************/
  // ���� ��� select
  public ArrayList<TicketDTO> list() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<TicketDTO> list = mapper.list();
    return list;
  }//list() end
  

/************************************ ��� *************************************************/
  //���� �� ��ȭ���
  public ArrayList<MovieDTO> movieList() {
	TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
	ArrayList<MovieDTO> movieList = mapper.movieList();
	return movieList;
  }//movieList() end
  
  /* -------------------- ���弱�� �κ� -------------------- */
  public ArrayList<CinemaDTO> cineAddr1List() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cineaddr1list = mapper.cineAddr1List();
    return cineaddr1list;
  }//cineAddr1List() end
  
  public ArrayList<CinemaDTO> cinemaList() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinemalist = mapper.cinemaList();
    return cinemalist;
  }//cineList() end
  
  public ArrayList<CinemaDTO> cinemaSelListFromMovie(int mCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.cinemaSelListFromMovie(mCode);
    return cinelist;
  }//screenlistFromMovie() end
  /* -------------------- ���弱�� �κ� END -------------------- */
  
  
}//class end
