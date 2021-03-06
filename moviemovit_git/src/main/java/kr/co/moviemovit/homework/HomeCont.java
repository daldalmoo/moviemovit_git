package kr.co.moviemovit.homework;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.coupon.CouponDTO;
import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.ticket.TicketDTO;


@Controller
public class HomeCont {
  
  @Autowired
  HomeDAO dao;

  public HomeCont() {
    System.out.println("-----HomeCont()");
  }

   
   @RequestMapping(value="/homework/homework1.do", method=RequestMethod.GET)
   public ModelAndView read() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/homework/homework1");
     ArrayList<MovieDTO> dto = dao.homework1();
     mav.addObject("dto", dto);

     return mav;    
   }//read() end
   
   
   @RequestMapping(value="/homework/homework2.do", method=RequestMethod.GET)
   public ModelAndView homework2() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/homework/homework2");
     ArrayList<CouponDTO> dto = dao.homework2();
     ArrayList<TicketDTO> sdto = dao.homework3();
     
     mav.addObject("dto", dto);
     mav.addObject("sdto", sdto);

     return mav;    
   }//read() end
   

}//class end