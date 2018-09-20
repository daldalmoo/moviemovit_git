package kr.co.moviemovit.movie;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.people.PeopleDTO;
import kr.co.moviemovit.review.CinemaDTO;
import kr.co.moviemovit.star.StarDTO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

import java.io.IOException;
import java.io.PrintWriter;
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
	    String basePath = req.getRealPath("/movie/img_poster");
	    MultipartFile posterMF = dto.getPosterMF();
	    String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
	    dto.setPoster(poster);
	    dto.setFilesize(posterMF.getSize());
	//------------------------------------------------------------   
	       	    
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
	 public ModelAndView list(MovieDTO dto, StarDTO sdto) {
	     ModelAndView mav = new ModelAndView();
	     mav.setViewName("movie/movieList");
	     ArrayList<MovieDTO> list = dao.list();
	     sdto=dao.star(sdto);
	     mav.addObject("list", list);
	     mav.addObject("sdto", sdto);
	     
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
	  }//updateProc() end
	
	  @RequestMapping(value="/movie/peopleNameList.do", method = RequestMethod.POST)
		public void peopleNameList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			resp.setCharacterEncoding("UTF-8");
			
			String peoName = req.getParameter("keyWord").trim();
			System.out.println(peoName);
			
			String message = ""; //응답 메세지
			if(peoName.length()>0) { //검색어가 존재하는지?
				ArrayList<PeopleDTO> peopleList = dao.peopleNameList(peoName);
				//,를 기준으로 문자를 나눠서 갯수만큼 출력
				int size = peopleList.size();
				if(size>0) {
					message += size + "|";
					for(int idx=0; idx<size; idx++) {
						PeopleDTO dto = new PeopleDTO();
						dto = peopleList.get(idx);
						String key = dto.getPeoName();
						message += key;
						if(idx<size-1) {
							message += ",";
						}
					}//for end
				}//if end
			} else {
				System.out.println("인물목록 불러오기 실패");
			}//if end
			
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(message);
			out.flush();
			out.close();
		}//peopleNameList() end
	
	  @RequestMapping(value="/movie/peopleNameList2.do", method = RequestMethod.POST)
		public void peopleNameList2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			resp.setCharacterEncoding("UTF-8");
			
			String peoName = req.getParameter("keyWord2").trim();
			System.out.println(peoName);
			
			String message = ""; //응답 메세지
			if(peoName.length()>0) { //검색어가 존재하는지?
				ArrayList<PeopleDTO> peopleList2 = dao.peopleNameList(peoName);
				//,를 기준으로 문자를 나눠서 갯수만큼 출력
				int size = peopleList2.size();
				if(size>0) {
					message += size + "|";
					for(int idx=0; idx<size; idx++) {
						PeopleDTO dto = new PeopleDTO();
						dto = peopleList2.get(idx);
						String key = dto.getPeoName();
						message += key;
						if(idx<size-1) {
							message += ",";
						}
					}//for end
				}//if end
			} else {
				System.out.println("인물목록 불러오기 실패");
			}//if end
			
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println(message);
			out.flush();
			out.close();
		}//peopleNameList() end

}//class end
