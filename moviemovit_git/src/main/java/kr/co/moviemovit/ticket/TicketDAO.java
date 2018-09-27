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
  

/************************************ ���� *************************************************/
  /* -------------------- ���� : ��ȭ���� �κ� -------------------- */
  // ���� �� ��ȭ���
  public ArrayList<MovieDTO> movieList() {
  TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
  ArrayList<MovieDTO> movieList = mapper.movieList();
  return movieList;
  }//movieList() end
  /* ------------------ ���� : ��ȭ���� �κ� END ------------------ */
  
  /* ------------------ ���� : ���弱�� �κ� ------------------ */
  public ArrayList<CinemaDTO> cinemaList() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinemalist = mapper.cinemaList();
    return cinemalist;
  }//cineList() end
  
  public ArrayList<CinemaDTO> grayCinemaList(int mCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.grayCinemaList(mCode);
    return cinelist;
  }//grayCinemaList() end
  
  public ArrayList<CinemaDTO> cinemaSelListFromMovieAddr1(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.cinemaSelListFromMovieAddr1(dto);
    return cinelist;
  }//cinemaSelListFromMovieAddr1() end
  
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
  
  public ArrayList<CinemaDTO> cinemaListaddr1(String addr1) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinemalist = mapper.cinemaListaddr1(addr1);
    return cinemalist;
  }//cinemaListaddr1() end
  /* ------------------ ���� : ���弱�� �κ� END ------------------ */
  
  
}//class end
