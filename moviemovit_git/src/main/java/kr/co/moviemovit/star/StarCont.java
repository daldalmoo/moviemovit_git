package kr.co.moviemovit.star;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.ReviewStar;
import kr.co.moviemovit.user.UserDTO;


@Controller
public class StarCont {
    
	@Autowired
	StarDAO dao;
		
	public StarCont() {
		System.out.println("----------StarCont() 객체 생성");
	}//기본 생성자
	
	@RequestMapping(value="/star/create.do", method=RequestMethod.GET)
	public ModelAndView create(MovieDTO dto, ArrayList<String> uid) {
	   ModelAndView mav= new ModelAndView();
	   mav.setViewName("/star/starForm");
	   dto=dao.movieList(dto);
	   mav.addObject("dto", dto);
	   mav.addObject("udto", uid);
	   //mav.addObject("uidList", dao.uidList(uid));
	   return mav;
	}//create() end
	
	 @RequestMapping(value="/star/create.do", method=RequestMethod.POST)
	 public ModelAndView createProc(StarDTO sdto) {
	   ModelAndView mav= new ModelAndView();
	   mav.setViewName("star/msgView");
	   int count = dao.create(sdto);
	   mav.addObject("count", count);
	   
	   if(count==0) {
		  mav.addObject("msg1", "<p>별점 등록 실패</p>");
		  mav.addObject("img", "<img src='../img/fail.png'>");
		  mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
		  mav.addObject("link2", "<input type='button' value='목록으로' onclick='location.href=\"./List.do?mCode=" + sdto.getmCode() + "\"'>");
	    }else {
		  mav.addObject("msg1", "<p>별점 등록 성공</p>");
		  mav.addObject("img", "<img src='../img/success.jpg'>");
		  mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"./List.do?mCode=" + sdto.getmCode() + "\"'>");      
		}//if end
	   return mav;
	 }//createProc() end
	 
	 /*@RequestMapping("/star/List.do")
	 public ModelAndView list(StarDTO dto) {
	     ModelAndView mav = new ModelAndView();
	     mav.setViewName("star/List");
	     ArrayList<StarDTO> list = dao.list();
	     mav.addObject("list", list);
	     return mav;
	 }//list() end
     */	 
	 
	 /*@RequestMapping("/star/List.do")
	 public ModelAndView starlist(StarDTO sdto) {
	     ModelAndView mav = new ModelAndView();
	     HashMap<MovieDTO, StarDTO>  starlist = dao.starlist(sdto);
	     mav.addObject("starlist", starlist);
	     return mav;
	 }//starlist() end
     */	 
	 
	 @RequestMapping("/star/List.do")
	 public ModelAndView starlist(MovieDTO dto, StarDTO sdto) {
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("/star/List");
		 ArrayList<HashMap<MovieDTO, StarDTO>> starlist=dao.starlist(sdto);
		 dto=dao.movieList(dto);
		 int avgstar = dao.avgstar(sdto);
		 mav.addObject("starlist", starlist);
		 mav.addObject("dto", dto);
		 mav.addObject("avgstar", avgstar);
		 return mav;
	 }//starlist() end
	 
     
	 @RequestMapping(value="/star/avgList.do", method=RequestMethod.GET)
	 public ModelAndView genrestar(HttpServletRequest req) {
		 ModelAndView mav = new ModelAndView();
		 HttpSession session = req.getSession();
		 
	     //로그인되어서 session에 올라간 값 가져오기
	     String uid = (String)session.getAttribute("s_id");

	     StarDTO sdto = new StarDTO();
	     sdto.setUid(uid);

	     ArrayList<StarDTO> list = dao.genrestar(sdto);
		 mav.setViewName("/star/avgList");
		 mav.addObject("list", list);
		 
		 return mav;
		 
	 }//avglist() end
	
}//class end
