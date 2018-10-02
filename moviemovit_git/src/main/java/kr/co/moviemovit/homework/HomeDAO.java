package kr.co.moviemovit.homework;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.coupon.CouponDTO;
import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.ticket.TicketDTO;

@Component
public class HomeDAO {
  
  @Autowired
  SqlSession sqlSesison;

  public HomeDAO() {
     System.out.println("----------MovieDAO()");
  }//¡¾?¨¬? ??¨ù¨¬??
  
  
  public  ArrayList<MovieDTO> homework1() {
    HomeMapper mapper = sqlSesison.getMapper(HomeMapper.class);
    ArrayList<MovieDTO> list = mapper.homework1();
     return list;
  }
  
  public  ArrayList<CouponDTO> homework2() {
    HomeMapper mapper = sqlSesison.getMapper(HomeMapper.class);
    ArrayList<CouponDTO> list = mapper.homework2();
     return list;
  }
  
  public  ArrayList<TicketDTO> homework3() {
    HomeMapper mapper = sqlSesison.getMapper(HomeMapper.class);
    ArrayList<TicketDTO> list = mapper.homework3();
     return list;
  }

}//class end