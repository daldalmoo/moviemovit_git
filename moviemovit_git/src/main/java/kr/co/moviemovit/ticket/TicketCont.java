package kr.co.moviemovit.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;
import kr.co.moviemovit.screen.ScreenDTO;

@Controller
public class TicketCont {
  
  @Autowired  // ���� ���踦 �ڵ����� ���� �� ��ü �ڵ� ����
  TicketDAO dao;

  public TicketCont() {
    System.out.println("---------- TicketCont() ��ü ����");
  }//default constructor
  
  
/*********************************** ���� ��� *********************************************/
  // ���Ȯ�� http://localhost:9090/moviemovit/ticket/list.do
  @RequestMapping(value="/ticket/list.do")
  public ModelAndView list(TicketDTO dto) {
      ModelAndView mav = new ModelAndView();
      ArrayList<TicketDTO> list = dao.list();
      mav.setViewName("ticket/ticketList");
      mav.addObject("list", list);
      return mav; 
  }//list() end
  
  
/************************************ ��� *************************************************/
	@RequestMapping(value="/ticket/create.do", method = RequestMethod.GET)
	public ModelAndView ticketForm() {
		ModelAndView mav = new ModelAndView();
		
		//��ȭ���
	  ArrayList<MovieDTO> movieList = dao.movieList();
	  mav.addObject("movieList", movieList);
	  
	  // ������
    ArrayList<CinemaDTO> cinelist = dao.cineList();
    mav.addObject("cinelist", cinelist);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end
	
	// ��ȭ���� -> �󿵱��� �������� AJAX
	@RequestMapping(value="/ticket/cinelist.do", method = RequestMethod.POST)
	public void cineList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String msg = "";
		
    int mCode = Integer.parseInt(req.getParameter("mCode"));
		//System.out.println("TicketCont : mCode : "+mCode);
		
		ArrayList<CinemaDTO> cinelist = dao.cinelistFromMovie(mCode);
	  //System.out.println(cinelist.get(0).getBrandName() + " - " + cinelist.get(0).getCineName());
		for(int j=0; j<cinelist.size(); j++) {
		  CinemaDTO cine = cinelist.get(j);
		  msg += "<li>";
	    msg += "  <a href='#"+cine.getCineCode()+"'>";
	    if(cine.getBrandName().equals("CGV")) { msg += "CGV"; }
	    else if(cine.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cine.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cine.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
	    msg += " - "+cine.getCineName();
	    msg += "  </a>";
	    msg += "</li>";
		}//for end
		
		// ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
	}//cineList() end
}//class end
