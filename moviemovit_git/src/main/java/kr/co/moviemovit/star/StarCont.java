package kr.co.moviemovit.star;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.ReviewStar;

@Controller
public class StarCont {
    
	@Autowired
	StarDAO dao;
		
	public StarCont() {
		System.out.println("----------StarCont() ��ü ����");
	}//�⺻ ������
	
	@RequestMapping(value="/star/create.do", method=RequestMethod.GET)
	public ModelAndView create(MovieDTO dto, String uid) {
	   ModelAndView mav= new ModelAndView();
	   mav.setViewName("/star/starForm");
	   dto=dao.movieList(dto);
	   ArrayList<String> uidList=dao.uidList(uid);
	   mav.addObject("dto", dto);
	   mav.addObject("uidList", dao.uidList(uid));
	   return mav;
	}//create() end
	
	 @RequestMapping(value="/star/create.do", method=RequestMethod.POST)
	 public ModelAndView createProc(StarDTO dto) {
	   ModelAndView mav= new ModelAndView();
	   mav.setViewName("star/msgView");
	   int count = dao.create(dto);
	   mav.addObject("count", count);
	   if(count==0) {
		  mav.addObject("msg1", "<p>���� ��� ����</p>");
		  mav.addObject("img", "<img src='../img/fail.png'>");
		  mav.addObject("link1", "<input type='button' value='�ٽýõ�' onclick='javascript:history.back()'>");
		  mav.addObject("link2", "<input type='button' value='�������' onclick='location.href=\"./List.do\"'>");
		}else {
		  mav.addObject("msg1", "<p>���� ��� ����</p>");
		  mav.addObject("img", "<img src='../img/success.jpg'>");
		  mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"./List.do\"'>");      
		}//if end
	   
	   return mav;
	 }//createProc() end
	
	
	
	

}//class end
