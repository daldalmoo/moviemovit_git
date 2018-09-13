package kr.co.moviemovit.ticket;

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
	@RequestMapping(value="/ticket/ticketform.do", method = RequestMethod.GET)
	public ModelAndView ticketForm() {
		ModelAndView mav = new ModelAndView();
		
		//��ȭ���
	    ArrayList<MovieDTO> movieList = dao.movieList();
	    mav.addObject("movieList", movieList);
		mav.setViewName("ticket/ticketForm");
		return mav;
	}//ticketForm() end
	
	//��ȭ �����ϸ� �ش翵ȭ�� ���ϴ� ���� ���
	@RequestMapping(value="/ticket/theaterNameList.do", method = RequestMethod.POST)
	public ModelAndView TheaterNameList() {
		ModelAndView mav = new ModelAndView();
		
		
		//���� ���
		return mav;
	}//theaterNameList() end
}//class end
