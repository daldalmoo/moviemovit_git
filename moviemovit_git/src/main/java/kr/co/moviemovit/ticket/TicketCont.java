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
    
    // �ּ�1�� ���尳��
    HashMap<String,Integer> cinemacntmap = new HashMap<String, Integer>();
    cinemacntmap.put("all",dao.cinemacntFromAddr1("all"));  // ����
    cinemacntmap.put("SEO",dao.cinemacntFromAddr1("SEO"));  // ����
    cinemacntmap.put("GGD",dao.cinemacntFromAddr1("GGD"));  // ��⵵
    cinemacntmap.put("ICH",dao.cinemacntFromAddr1("ICH"));  // ��õ
    cinemacntmap.put("GWD",dao.cinemacntFromAddr1("GWD"));  // ������
    cinemacntmap.put("CCD",dao.cinemacntFromAddr1("CCD"));  // ��û��
    cinemacntmap.put("GSD",dao.cinemacntFromAddr1("GSD"));  // ���
    cinemacntmap.put("JLD",dao.cinemacntFromAddr1("JLD"));  // ����
    cinemacntmap.put("JJD",dao.cinemacntFromAddr1("JJD"));  // ���ֵ�
    mav.addObject("cinemacntmap", cinemacntmap);
    
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end

  /* -------------------- ��ȭ���� �κ� AJAX -------------------- */

  /* -------------------- ��ȭ���� �κ� AJAX END -------------------- */
	
  /* -------------------- ���弱�� �κ� AJAX END -------------------- */
	//cinetab1mainlist
	
	// �ּ�1 -> ���� <ul> ���
	// �ּ�1�� �´� ���� ��� �����ͼ� M
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
        msg += "�Ե��ó׸�";
      } else if (cinema.getBrandName().equals("MEGABOX")) {
        msg += "�ް��ڽ�";
      } else if (cinema.getBrandName().equals("INDEP")) {
        msg += "������ȭ��";
      }//if end
      msg += " - " + cinema.getCineName();
      msg += "</li>";
      msg += "</ul>";
    }//for end

    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromAddr1() end
	
	// ��ȭ�ڵ�, �ּ�1 -> ���� <ul> ���
	@RequestMapping(value="/ticket/cinemaListFromMovieAddr1.do", method = RequestMethod.POST)
  public void cinemaListFromMovieAddr1(HttpServletRequest req, HttpServletResponse resp, int mCode, String addr1) throws IOException {
    String msg = "";
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setmName(addr1);  // mName �� addr1 ��ƿ�
    ArrayList<CinemaDTO> cinemalist = dao.cinemaListFromMovieAddr1(dto);
    
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
    
    // TODO �󿵱��� ������ �ּ�1��� �ٽ� ����
    
    if(cinemalist.size()==0) {  // �󿵱����� ������ �󿵱��� ���� �޼��� ���
      msg += "<div style='margin-top:5px; margin-left:15px; font-size:11pt;'>";
      msg += "  <strong>�󿵱����� �����ϴ�.";
      msg += "  <br>�ٸ� ������ ������ �ּ���.</strong>";
      msg += "</div>";
    }//if end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromMovieAddr1() end
	
	// ��ȭ�ڵ�, �ּ�1 -> ���� ��� cineCode�� | ���� ����
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
	
	
	
	/* -------------------- ���弱�� �κ� AJAX END -------------------- */
	
	
}//class end
