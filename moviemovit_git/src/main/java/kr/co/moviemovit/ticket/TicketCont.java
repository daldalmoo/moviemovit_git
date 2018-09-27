package kr.co.moviemovit.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;

@Controller
public class TicketCont {
  
  @Autowired  // 의존 관계를 자동으로 연결 및 객체 자동 생성
  TicketDAO dao;

  public TicketCont() {
    System.out.println("---------- TicketCont() 객체 생성");
  }//default constructor
  
  
/*********************************** 예매 목록 *********************************************/
  // 결과확인 http://localhost:9090/moviemovit/ticket/list.do
  @RequestMapping(value="/ticket/list.do")
  public ModelAndView list(TicketDTO dto) {
      ModelAndView mav = new ModelAndView();
      ArrayList<TicketDTO> list = dao.list();
      mav.setViewName("ticket/ticketList");
      mav.addObject("list", list);
      return mav; 
  }//list() end
  
  
/************************************ 등록 *************************************************/
	@RequestMapping(value="/ticket/create.do", method = RequestMethod.GET)
	public ModelAndView ticketForm() {
		ModelAndView mav = new ModelAndView();
		
		// 영화목록
	  ArrayList<MovieDTO> movieList = dao.movieList();
	  mav.addObject("movieList", movieList);
	  
	  // 극장목록
	  ArrayList<CinemaDTO> cinemalist = dao.cinemaList();
    mav.addObject("cinemalist", cinemalist);
    
    // 주소1목록
    HashMap<String,Integer> addr1map = new HashMap<String, Integer>();
    addr1map.put("all",dao.cinemacnt());  // 전국
    addr1map.put("SEO",dao.addr1cnt("SEO"));  // 서울
    addr1map.put("GGD",dao.addr1cnt("GGD"));  // 경기도
    addr1map.put("ICH",dao.addr1cnt("ICH"));  // 인천
    addr1map.put("GWD",dao.addr1cnt("GWD"));  // 강원도
    addr1map.put("CCD",dao.addr1cnt("CCD"));  // 충청도
    addr1map.put("GSD",dao.addr1cnt("GSD"));  // 경상도
    addr1map.put("JLD",dao.addr1cnt("JLD"));  // 전라도
    addr1map.put("JJD",dao.addr1cnt("JJD"));  // 제주도
    mav.addObject("addr1map", addr1map);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end

  /* -------------------- 영화선택 부분 AJAX -------------------- */

  /* -------------------- 영화선택 부분 AJAX END -------------------- */
	
  /* -------------------- 극장선택 부분 AJAX END -------------------- */
	 //cinetab1mainlist
	
	// 상영극장 목록 가져와서 <ul> 목록으로 보내기
	@RequestMapping(value="/ticket/cinemaSelList.do", method = RequestMethod.POST)
  public void cinemaSelList(HttpServletRequest req, HttpServletResponse resp, int mCode, String addr1) throws IOException {
    String msg = "";
    ArrayList<CinemaDTO> cinemaSellist = new ArrayList<CinemaDTO>();
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setmName(addr1);  // mMame 에 addr1 담아옴
    cinemaSellist = dao.cinemaSelListFromMovieAddr1(dto);
    
    for(int j=0; j<cinemaSellist.size(); j++) {
      CinemaDTO cinema = cinemaSellist.get(j);
      msg += "<ul>";
      msg += "<li value='"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "롯데시네마"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "메가박스"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "독립영화관"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
      msg += "</ul>";
    }//for end
    
    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaSelList() end
	
	// gray 처리할 상영극장 목록 가져와서 cineCode만 |로 정렬
  @RequestMapping(value="/ticket/graycinemalist.do", method = RequestMethod.POST)
  public void grayCinemaList(HttpServletRequest req, HttpServletResponse resp, int mCode) throws IOException {
    String msg = "";
    
    ArrayList<CinemaDTO> grayCinemaList = dao.grayCinemaList(mCode);
    //System.out.println(cinemaSellist.get(0).getBrandName() + " - " + cinemaSellist.get(0).getCineName());
    for(int i=0; i<grayCinemaList.size(); i++) {
      CinemaDTO cinema = grayCinemaList.get(i);
      if(i==0) {
        msg += cinema.getCineCode();
      } else {
        msg += "|" + cinema.getCineCode();
      }//if end
    }//for end
    //System.out.println(msg);
    
    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//grayCinemaList() end
	
	// 주소1이 변경되면 호출
	@RequestMapping(value="/ticket/addr1change.do", method = RequestMethod.POST)
  public void addr1change(HttpServletRequest req, HttpServletResponse resp, String addr1) throws IOException {
    String msg = "";
    //System.out.println("TicketCont : addr1 : "+addr1);
    
    ArrayList<CinemaDTO> cinemalist = new ArrayList<CinemaDTO>();
    if(addr1.equals("all")) {
      cinemalist = dao.cinemaList();
    } else {
      cinemalist = dao.cinemaListaddr1(addr1);
    }//if end
    
    for(int j=0; j<cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<ul>";
      msg += "<li value='"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "롯데시네마"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "메가박스"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "독립영화관"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
      msg += "</ul>";
    }//for end
    
    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//addr1change() end
	
	/* -------------------- 극장선택 부분 AJAX END -------------------- */
	
	
}//class end
