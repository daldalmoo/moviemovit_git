package kr.co.moviemovit.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;
import net.utility.Utility;

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
		
		//영화목록
	  ArrayList<MovieDTO> movieList = dao.movieList();
	  mav.addObject("movieList", movieList);
	  
	  // 극장목록
	  ArrayList<CinemaDTO> cinemalist = dao.cinemaList();
    mav.addObject("cinemalist", cinemalist);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end
	
	/* -------------------- 극장선택 부분 AJAX -------------------- */
	// 극장선택 새로고침
	@RequestMapping(value="/ticket/cinemaRefresh.do", method = RequestMethod.POST)
  public void cinemaRefresh(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String msg = "";
    ArrayList<CinemaDTO> cinemalist = dao.cinemaList();
    for(int j=0; j<cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<ul>";
      msg += "<li>";
      msg += "  <a href='#"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "롯데시네마"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "메가박스"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "독립영화관"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "  </a>";
      msg += "</li>";
      msg += "</ul>";
    }//for end
    
    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaRefresh() end
	
	// 영화선택 -> 상영극장 가져오기
	@RequestMapping(value="/ticket/cinemalist.do", method = RequestMethod.POST)
	public void cinemaSelList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String msg = "";
		
    int mCode = Integer.parseInt(req.getParameter("mCode"));
		System.out.println("TicketCont : mCode : "+mCode);
		
		ArrayList<CinemaDTO> cinemaSellist = dao.cinemaSelListFromMovie(mCode);
	  //System.out.println(cinemaSellist.get(0).getBrandName() + " - " + cinemaSellist.get(0).getCineName());
		for(int j=0; j<cinemaSellist.size(); j++) {
		  CinemaDTO cinema = cinemaSellist.get(j);
		  msg += "<ul>";
		  msg += "<li>";
	    msg += "  <a href='#"+cinema.getCineCode()+"'>";
	    if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
	    else if(cinema.getBrandName().equals("LOTTE")) { msg += "롯데시네마"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "메가박스"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "독립영화관"; }//if end
	    msg += " - "+cinema.getCineName();
	    msg += "  </a>";
	    msg += "</li>";
	    msg += "</ul>";
		}//for end
		
		// 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
	}//cineList() end
	/* -------------------- 극장선택 부분 AJAX END -------------------- */
	
	/* -------------------- 영화정보 부분 AJAX -------------------- */
	// 영화선택 -> 영화정보 포스터 가져오기
  @RequestMapping(value="/ticket/movieposter.do", method = RequestMethod.POST)
  public void movieposter(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String msg = "";
    String root = Utility.getRoot(); // /moviemovit
    
    int mCode = Integer.parseInt(req.getParameter("mCode"));
    MovieDTO dto = new MovieDTO();
    //dto에 선택한 영화의 mCode를 set해서 movieDAO에 있는 read함수 불러옴
    dto.setmCode(mCode);
    dto = dao.MovieData(dto);
    //<input type="image" class="movie_poster" src="./img/bgr_poster2.PNG">
    //msg += "<input type='image' class='movie_poster' src='" + root + "movie/img_poster/" + dto.getPoster() + ">";
    //msg += "<input type='image' class='movie_poster' src='moviemovit/movie/storage/" + dto.getPoster() + ">";
    
    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
    
  }//movieposter() end
	/* -------------------- 영화정보 부분 AJAX END -------------------- */
	
	
}//class end
