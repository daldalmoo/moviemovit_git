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
		
		// ��ȭ���
	  ArrayList<MovieDTO> movieList = dao.movieList();
	  mav.addObject("movieList", movieList);
	  
	  // ������
	  ArrayList<CinemaDTO> cinemalist = dao.cinemaList();
    mav.addObject("cinemalist", cinemalist);
    
    // �ּ�1���
    HashMap<String,Integer> addr1map = new HashMap<String, Integer>();
    addr1map.put("all",dao.cinemacnt());  // ����
    addr1map.put("SEO",dao.addr1cnt("SEO"));  // ����
    addr1map.put("GGD",dao.addr1cnt("GGD"));  // ��⵵
    addr1map.put("ICH",dao.addr1cnt("ICH"));  // ��õ
    addr1map.put("GWD",dao.addr1cnt("GWD"));  // ������
    addr1map.put("CCD",dao.addr1cnt("CCD"));  // ��û��
    addr1map.put("GSD",dao.addr1cnt("GSD"));  // ���
    addr1map.put("JLD",dao.addr1cnt("JLD"));  // ����
    addr1map.put("JJD",dao.addr1cnt("JJD"));  // ���ֵ�
    mav.addObject("addr1map", addr1map);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end

  /* -------------------- ��ȭ���� �κ� AJAX -------------------- */

  /* -------------------- ��ȭ���� �κ� AJAX END -------------------- */
	
  /* -------------------- ���弱�� �κ� AJAX END -------------------- */
	 //cinetab1mainlist
	
	// �󿵱��� ��� �����ͼ� <ul> ������� ������
	@RequestMapping(value="/ticket/cinemaSelList.do", method = RequestMethod.POST)
  public void cinemaSelList(HttpServletRequest req, HttpServletResponse resp, int mCode, String addr1) throws IOException {
    String msg = "";
    ArrayList<CinemaDTO> cinemaSellist = new ArrayList<CinemaDTO>();
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setmName(addr1);  // mMame �� addr1 ��ƿ�
    cinemaSellist = dao.cinemaSelListFromMovieAddr1(dto);
    
    for(int j=0; j<cinemaSellist.size(); j++) {
      CinemaDTO cinema = cinemaSellist.get(j);
      msg += "<ul>";
      msg += "<li value='"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
      msg += "</ul>";
    }//for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaSelList() end
	
	// gray ó���� �󿵱��� ��� �����ͼ� cineCode�� |�� ����
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
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//grayCinemaList() end
	
	// �ּ�1�� ����Ǹ� ȣ��
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
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
      msg += "</ul>";
    }//for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//addr1change() end
	
	/* -------------------- ���弱�� �κ� AJAX END -------------------- */
	
	
}//class end
