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
	  ArrayList<CinemaDTO> cinemalist = dao.cinemaList();
    mav.addObject("cinemalist", cinemalist);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end
	
	/* -------------------- ���弱�� �κ� AJAX -------------------- */
	// ���� �ּ�1 ����Ʈ �������� AJAX
  @RequestMapping(value="/ticket/addr1cnt.do", method = RequestMethod.POST)
  public void addr1cnt(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String msg = "";
    msg += "<ul>";
    msg += "  <li value='all' style='border-bottom: 1px dotted gray;'>����(<strong>"+dao.cinemacnt()+"</strong>)</li>";
    msg += "  <li value='SEO'>����(<strong>"+dao.addr1cnt("SEO")+"</strong>)</li>";
    msg += "  <li value='GGD'>��⵵(<strong>"+dao.addr1cnt("GGD")+"</strong>)</li>";
    msg += "  <li value='ICH'>��õ(<strong>"+dao.addr1cnt("ICH")+"</strong>)</li>";
    msg += "  <li value='KWD'>������(<strong>"+dao.addr1cnt("KWD")+"</strong>)</li>";
    msg += "  <li value='CCD'>��û��(<strong>"+dao.addr1cnt("CCD")+"</strong>)</li>";
    msg += "  <li value='KSD'>���(<strong>"+dao.addr1cnt("KSD")+"</strong>)</li>";
    msg += "  <li value='JLD'>����(<strong>"+dao.addr1cnt("JLD")+"</strong>)</li>";
    msg += "  <li value='JJD'>���ֵ�(<strong>"+dao.addr1cnt("JJD")+"</strong>)</li>";
    msg += "</ul>";
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//ticketForm() end
  
  //���� �ּ�1 ����Ʈ �������� AJAX
  @RequestMapping(value = "/ticket/addr1selected.do", method = RequestMethod.POST)
  public void addr1selected(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String msg = "";
    msg += "����(<strong>"+dao.addr1cnt("SEO")+"</strong>)";

    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }// ticketForm() end
  
	// ���弱�� ���ΰ�ħ
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
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "  </a>";
      msg += "</li>";
      msg += "</ul>";
    }//for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaRefresh() end
	
	// ��ȭ���� -> �󿵱��� ��������
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
	    else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
	    msg += " - "+cinema.getCineName();
	    msg += "  </a>";
	    msg += "</li>";
	    msg += "</ul>";
		}//for end
		
		// ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
	}//cineList() end
	/* -------------------- ���弱�� �κ� AJAX END -------------------- */
	
	
}//class end
