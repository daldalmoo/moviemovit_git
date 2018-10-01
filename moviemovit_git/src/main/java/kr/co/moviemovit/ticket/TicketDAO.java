package kr.co.moviemovit.ticket;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.coupon.CouponDTO;
import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;
import kr.co.moviemovit.user.UserDTO;
import kr.co.moviemovit.screen.ScreenDTO;

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
    ArrayList<Integer> cinemacntlist = mapper.cinemacntFromAddr1Movie(dto);
    System.out.println(cinemacntlist.size());
    if(cinemacntlist.size()==0) {
      return 0;
    } else {
      return cinemacntlist.get(0);
    }//if end
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
    ArrayList<String> sdatelist = mapper.sdateAllList();
    return sdatelist;
  }//sdateAllList() end
  
  public ArrayList<String> sdateListFromMovie(int mCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> sdatelist = mapper.sdateListFromMovie(mCode);
    return sdatelist;
  }//sdateListFromMovie() end

  public ArrayList<String> sdateListFromCinema(String cineCode) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> sdatelist = mapper.sdateListFromCinema(cineCode);
    return sdatelist;
  }//sdateListFromCinema() end

  public ArrayList<String> sdateListFromMovieCinema(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<String> sdatelist = mapper.sdateListFromMovieCinema(dto);
    return sdatelist;
  }//sdateListFromMovieCinema() end
  /* ------------------ ���� : ��¥���� �κ� END ------------------ */
  
  /* ------------------ ���� : �󿵽ð�ǥ �κ� END ------------------ */
  public ArrayList<ScreenDTO> screentimeRoom(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<ScreenDTO> screenlist = mapper.screentimeRoom(dto);
    return screenlist;
  }//screentimeRoom() end
  /* ------------------ ���� : �󿵽ð�ǥ �κ� END ------------------ */
  
  
  /* -------------------- ��ȭ���� -> ��ȭ���� ������ �κ� -------------------- */
  public MovieDTO MovieData(MovieDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    MovieDTO movieData = mapper.movieData(dto);
    return movieData;
  }//MovieData() end
  /* -------------------- ��ȭ���� -> ��ȭ���� ������ �κ� END -------------------- */
  
  // ���� ��� select
  public ArrayList<CouponDTO> couponList(CouponDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    ArrayList<CouponDTO> couponList = mapper.couponList(dto);
    return couponList;
  }//couponList() end
  
  //ȸ������ read
  public UserDTO getMemberInfo(UserDTO dto) {
    TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
    dto = mapper.getMemberInfo(dto);
    return dto;
  }//getMemberInfo() end
  
}//class end
