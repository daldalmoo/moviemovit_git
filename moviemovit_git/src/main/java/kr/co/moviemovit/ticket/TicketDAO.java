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
  
  public int cinemacntFromAddr1(String addr1) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int cinemacnt = mapper.cinemacntFromAddr1(addr1);
    return cinemacnt;
  }//cinemacntFromAddr1() end
  
  public int cinemacntFromAddr1Movie(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int cinemacnt = mapper.cinemacntFromAddr1Movie(dto);
    return cinemacnt;
  }//cinemacntFromAddr1Movie() end
  
  public int cinemacntFromAddr1CLMD(CinemaDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    int cinemacnt = mapper.cinemacntFromAddr1CLMD(dto);
    return cinemacnt;
  }//cinemacntFromAddr1CLMD() end

  public ArrayList<CinemaDTO> cinemaListFromAddr1(String addr1) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinemalist = mapper.cinemaListFromAddr1(addr1);
    return cinemalist;
  }//cinemaListFromAddr1() end

  public ArrayList<CinemaDTO> cinemaListFromMovieAddr1(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.cinemaListFromMovieAddr1(dto);
    return cinelist;
  }//cinemaListFromMovieAddr1() end
  
  public ArrayList<CinemaDTO> cinemaListFromCLMDAddr1(CinemaDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.cinemaListFromCLMDAddr1(dto);
    return cinelist;
  }//cinemaListFromCLMDAddr1() end
  
  public ArrayList<CinemaDTO> grayCinemaList(int mCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.grayCinemaList(mCode);
    return cinelist;
  }//grayCinemaList() end

  public ArrayList<CinemaDTO> cinemaSearch(String key) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CinemaDTO> cinelist = mapper.cinemaSearch(key);
    return cinelist;
  }//cinemaSearch() end
  
  /* ------------------ ���� : ���弱�� �κ� END ------------------ */

  /* ------------------ ���� : ��¥���� �κ� ------------------ */
  public ArrayList<String> sdateAllList() {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> cinelist = mapper.sdateAllList();
    return cinelist;
  }//sdateAllList() end

  /* ------------------ ���� : ��¥���� �κ� END ------------------ */
  
  /* -------------------- ��ȭ���� -> ��ȭ���� ������ �κ� -------------------- */
  public MovieDTO MovieData(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    MovieDTO movieData = mapper.movieData(dto);
    return movieData;
  }//MovieData() end
  /* -------------------- ��ȭ���� -> ��ȭ���� ������ �κ� END -------------------- */
  
}//class end
