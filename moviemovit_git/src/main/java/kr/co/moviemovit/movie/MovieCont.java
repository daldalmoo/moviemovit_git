package kr.co.moviemovit.movie;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import net.utility.UploadSaveManager;
import net.utility.Utility;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class MovieCont {
	
	@Autowired
	MovieDAO dao;

	public MovieCont() {
		System.out.println("-----MovieCont() 객체 생성");
	}
	//결과확인
	//http://localhost:9090/moviemovit/movie/create.do
	
	@RequestMapping(value="/movie/create.do", method=RequestMethod.GET)
	  public ModelAndView createForm(MovieDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("movie/movieForm");
	    mav.addObject("list", dao.list());
	    mav.addObject("root", Utility.getRoot());
	    mav.addObject("mCode", dto.getmCode());    
	    return mav;
	  }//createForm() end 
		
	@RequestMapping(value="/movie/create.do", method=RequestMethod.POST)
	  public ModelAndView createProc(MovieDTO dto, HttpServletRequest req) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("movie/msgView");
	    mav.addObject("root", Utility.getRoot());
	//------------------------------------------------------------    
	//  전송된 파일이 저장되는 실제 경로
	    String basePath = req.getRealPath("/movie/storage");
	    MultipartFile posterMF = dto.getPosterMF();
	    String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
	    dto.setPoster(poster);
	    dto.setFilesize(posterMF.getSize());
	//------------------------------------------------------------   
	    if(dto.getDirector()==null) {
	    	dto.setDirector("default");
	    }
	    if(dto.getActor()==null) {
	    	dto.setActor("default");
	    }
	    	    
	    if(dto.getGenre().equals("romance")) {
			 dto.setGenre("로맨스");
		 } else if (dto.getGenre().equals("crime")) {
			 dto.setGenre("범죄/느와르");
		 } else if (dto.getGenre().equals("comedy")) {
			 dto.setGenre("코미디");
		 } else if (dto.getGenre().equals("FanSF")) {
			 dto.setGenre("판타지/SF");
		 } else if (dto.getGenre().equals("action")) {
			 dto.setGenre("액션");
		 } else if (dto.getGenre().equals("thrillhorror")) {
			 dto.setGenre("스릴러/공포");
		 } else if (dto.getGenre().equals("drama")) {
			 dto.setGenre("드라마");
		 } else if (dto.getGenre().equals("docu")) {
			 dto.setGenre("다큐");
		 } else if (dto.getGenre().equals("ani")) {
			 dto.setGenre("애니메이션");
		 } else if (dto.getGenre().equals("etc")) {
			 dto.setGenre("기타");
		 }//if end
	    
	    if(dto.getScreen().equals("soon")) {
	    	dto.setScreen("상영예정");
	    } else if(dto.getScreen().equals("ing")) {
	    	dto.setScreen("상영중");
	    } else if(dto.getScreen().equals("end")) {
	    	dto.setScreen("상영종료");
	    }//if end

	    dto.setAge(Integer.parseInt("age"));
	    System.out.println(dto.getAge());
	    
	    
	    int cnt=dao.create(dto);
	    if(cnt==0) {
	      mav.addObject("msg1", "<p>영화 등록 실패</p>");
	      mav.addObject("img", "<img src='../img/fail.png'>");
	      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
	      mav.addObject("link2", "<input type='button' value='목록으로' onclick='location.href=\"./movieList.do?mCode=" + dto.getmCode() + "\"'>");
	    }else {
	      mav.addObject("msg1", "<p>영화 등록 성공</p>");
	      mav.addObject("img", "<img src='../img/success.jpg'>");
	      mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"./movieList.do?mCode=" + dto.getmCode() + "\"'>");      
	    }
	    return mav;
	       
	 }//createProc() end
	
	 @RequestMapping("/movie/movieList.do")
	 public ModelAndView list(MovieDTO dto) {
	     ModelAndView mav = new ModelAndView();
	     mav.setViewName("movie/movieList");
	     ArrayList<MovieDTO> list = dao.list();
	     mav.addObject("list", list);
	     return mav;
	 }//list() end
	 
	 @RequestMapping(value="/movie/movieRead.do", method=RequestMethod.GET)
	 public ModelAndView read(MovieDTO dto) {
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("movie/movieRead");
		 dto = dao.read(dto); 
		 mav.addObject("dto", dto);
		 return mav;    
	 }//read() end
	 
	 @RequestMapping(value="/movie/delete.do", method=RequestMethod.GET)
	 public ModelAndView deleteForm(MovieDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("movie/deleteForm");
	    dto = dao.read(dto); 
	    mav.addObject("dto", dto);
	    return mav;    
	 }//deleteForm() end
	 
	 @RequestMapping(value="/movie/delete.do", method=RequestMethod.POST)
	  public ModelAndView deleteProc(MovieDTO dto) {
	  ModelAndView mav = new ModelAndView();
	    mav.setViewName("movie/msgView");
	    int cnt = dao.delete(dto);
	    if(cnt==0) {
	      mav.addObject("msg1", "<p>영화 삭제 실패</p>");
	      mav.addObject("img", "<img src='../img/fail.png'>");
	      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
	      mav.addObject("link2", "<input type='button' value='목록' onclick='location.href=\"./movieList.do\"'>");
	    }else {
	      mav.addObject("msg1", "<p>영화 삭제 성공</p>");
	      mav.addObject("img", "<img src='../img/success.jpg'>");
	      mav.addObject("link2", "<input type='button' value='목록' onclick='location.href=\"./movieList.do\"'>");
	    }//if end
	    return mav;    
	 }//deleteProc() end

	 @RequestMapping(value="/movie/update.do", method=RequestMethod.GET)
	  public ModelAndView updateForm(MovieDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("movie/updateForm");
	    mav.addObject("root", Utility.getRoot());
	    mav.addObject("mCode", dto.getmCode());   
	    dto = dao.read(dto); 
	    mav.addObject("dto", dto);
	    return mav;    
	  }//deleteForm() end
	  
	  @RequestMapping(value="/movie/update.do", method=RequestMethod.POST)
	  public ModelAndView updateProc(MovieDTO dto, HttpServletRequest req) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("movie/msgView");
	    mav.addObject("root", Utility.getRoot());
	    //------------------------------------------------------------    
		//  전송된 파일이 저장되는 실제 경로
		    String basePath = req.getRealPath("/movie/storage");
		//  <input type='file' name='posterMF'>
		    MultipartFile posterMF = dto.getPosterMF();
		    String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		    dto.setPoster(poster);
		    dto.setFilesize(posterMF.getSize());
		//------------------------------------------------------------   
		if(dto.getDirector()==null) {
			dto.setDirector("default");
		}
		if(dto.getActor()==null) {
			dto.setActor("default");
		}
		if(dto.getCountry()==null) {
			dto.setCountry("default");
		}
		
		if(dto.getGenre().equals("romance")) {
			 dto.setGenre("로맨스");
		 } else if (dto.getGenre().equals("crime")) {
			 dto.setGenre("범죄/느와르");
		 } else if (dto.getGenre().equals("comedy")) {
			 dto.setGenre("코미디");
		 } else if (dto.getGenre().equals("FanSF")) {
			 dto.setGenre("판타지/SF");
		 } else if (dto.getGenre().equals("action")) {
			 dto.setGenre("액션");
		 } else if (dto.getGenre().equals("thrillhorror")) {
			 dto.setGenre("스릴러/공포");
		 } else if (dto.getGenre().equals("drama")) {
			 dto.setGenre("드라마");
		 } else if (dto.getGenre().equals("docu")) {
			 dto.setGenre("다큐");
		 } else if (dto.getGenre().equals("ani")) {
			 dto.setGenre("애니메이션");
		 } else if (dto.getGenre().equals("etc")) {
			 dto.setGenre("기타");
		 }//if end
	    
	    if(dto.getScreen().equals("soon")) {
	    	dto.setScreen("상영예정");
	    } else if(dto.getScreen().equals("ing")) {
	    	dto.setScreen("상영중");
	    } else if(dto.getScreen().equals("end")) {
	    	dto.setScreen("상영종료");
	    }//if end
	    
	    
	    
		int cnt = dao.update(dto);
	    
	    if(cnt==0) {
	      mav.addObject("msg1", "<p>영화 수정 실패</p>");
	      mav.addObject("img", "<img src='../img/fail.png'>");
	      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
	      mav.addObject("link2", "<input type='button' value='영화목록' onclick='location.href=\"./movieList.do\"'>");
	    }else {
	      mav.addObject("msg1", "<p>영화 수정 성공</p>");
	      mav.addObject("img", "<img src='../img/success.jpg'>");
	      mav.addObject("link2", "<input type='button' value='영화목록' onclick='location.href=\"./movieList.do\"'>");
	    }//if end
	    return mav;    
	  }//deleteProc() end
	
	 
	  
	
	

}//class end
