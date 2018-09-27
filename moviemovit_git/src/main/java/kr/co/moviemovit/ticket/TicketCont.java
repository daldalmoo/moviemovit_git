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
    
    // 주소1의 극장개수
    HashMap<String,Integer> cinemacntmap = new HashMap<String, Integer>();
    cinemacntmap.put("all",dao.cinemacntFromAddr1("all"));  // 전국
    cinemacntmap.put("SEO",dao.cinemacntFromAddr1("SEO"));  // 서울
    cinemacntmap.put("GGD",dao.cinemacntFromAddr1("GGD"));  // 경기도
    cinemacntmap.put("ICH",dao.cinemacntFromAddr1("ICH"));  // 인천
    cinemacntmap.put("GWD",dao.cinemacntFromAddr1("GWD"));  // 강원도
    cinemacntmap.put("CCD",dao.cinemacntFromAddr1("CCD"));  // 충청도
    cinemacntmap.put("GSD",dao.cinemacntFromAddr1("GSD"));  // 경상도
    cinemacntmap.put("JLD",dao.cinemacntFromAddr1("JLD"));  // 전라도
    cinemacntmap.put("JJD",dao.cinemacntFromAddr1("JJD"));  // 제주도
    mav.addObject("cinemacntmap", cinemacntmap);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end

  /* -------------------- 영화선택 부분 AJAX -------------------- */

  /* -------------------- 영화선택 부분 AJAX END -------------------- */
	
  /* -------------------- 극장선택 부분 AJAX END -------------------- */
	//cinetab1mainlist
	
	// 주소1 -> 극장 <ul> 목록
	// 주소1에 맞는 극장 목록 가져와서 M
  @RequestMapping(value = "/ticket/cinemaListFromAddr1.do", method = RequestMethod.POST)
  public void cinemaListFromAddr1(HttpServletRequest req, HttpServletResponse resp, String addr1) throws IOException {
    String msg = "";
    //System.out.println("TicketCont : addr1 : "+addr1);

    ArrayList<CinemaDTO> cinemalist = new ArrayList<CinemaDTO>();
    if (addr1.equals("all")) {
      cinemalist = dao.cinemaList();
    } else {
      cinemalist = dao.cinemaListFromAddr1(addr1);
    }//if end

    for (int j = 0; j < cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<ul>";
      msg += "<li value='" + cinema.getCineCode() + "'>";
      if (cinema.getBrandName().equals("CGV")) {
        msg += "CGV";
      } else if (cinema.getBrandName().equals("LOTTE")) {
        msg += "롯데시네마";
      } else if (cinema.getBrandName().equals("MEGABOX")) {
        msg += "메가박스";
      } else if (cinema.getBrandName().equals("INDEP")) {
        msg += "독립영화관";
      }//if end
      msg += " - " + cinema.getCineName();
      msg += "</li>";
      msg += "</ul>";
    }//for end

    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromAddr1() end
	
	// 영화코드, 주소1 -> 극장 <ul> 목록
	@RequestMapping(value="/ticket/cinemaListFromMovieAddr1.do", method = RequestMethod.POST)
  public void cinemaListFromMovieAddr1(HttpServletRequest req, HttpServletResponse resp, int mCode, String addr1) throws IOException {
    String msg = "";
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setmName(addr1);  // mName 에 addr1 담아옴
    ArrayList<CinemaDTO> cinemalist = dao.cinemaListFromMovieAddr1(dto);
    
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
    
    // TODO 상영극장 개수로 주소1목록 다시 세팅
    
    if(cinemalist.size()==0) {  // 상영극장이 없을때 상영극장 없음 메세지 띄움
      msg += "<div style='margin-top:5px; margin-left:15px; font-size:11pt;'>";
      msg += "  <strong>상영극장이 없습니다.";
      msg += "  <br>다른 지역을 선택해 주세요.</strong>";
      msg += "</div>";
    }//if end
    
    // 출력
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromMovieAddr1() end
	
	// 영화코드, 주소1 -> 극장 목록 cineCode만 | 구분 정렬
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
	
	
	
	/* -------------------- 극장선택 부분 AJAX END -------------------- */
	
	
}//class end
