package kr.co.moviemovit.people;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.movie.MovieDTO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class PeopleCont {
	
	@Autowired
	PeopleDAO dao;

	public PeopleCont() {
		System.out.println("---------PeopleCont() 객체 생성");
	}//기본생성자
	
	//결과확인
	//http://localhost:9090/moviemovit/people/create.do
	
	@RequestMapping(value="/people/create.do", method=RequestMethod.GET)
	  public ModelAndView createForm(PeopleDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("people/createForm");
	    mav.addObject("list", dao.list());
	    mav.addObject("root", Utility.getRoot());
	    mav.addObject("peoCode", dto.getPeoCode());    
	    return mav;
	  }//createForm() end 
		
	@RequestMapping(value="/people/create.do", method=RequestMethod.POST)
	  public ModelAndView createProc(PeopleDTO dto, HttpServletRequest req) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("people/msgView");
	    mav.addObject("root", Utility.getRoot());
	    
	   
	//------------------------------------------------------------    
	//  전송된 파일이 저장되는 실제 경로
	    String basePath = req.getRealPath("/people/storage");
	    MultipartFile posterMF = dto.getPosterMF();
	    String peoPic = UploadSaveManager.saveFileSpring30(posterMF, basePath);
	    dto.setPeoPic(peoPic);
	    dto.setFilesize(posterMF.getSize());
	//------------------------------------------------------------   
	    if(dto.getCountry()==null) {
	    	dto.setCountry("default");
	    }
	    
	    if(dto.getGender().equals("W")) {
	    	dto.setGender("여자");
	    } else if(dto.getGender().equals("M")) {
	    	dto.setGender("남자");
	    }
	    	    
	    int cnt=dao.create(dto);
	    if(cnt==0) {
	      mav.addObject("msg1", "<p>인물 등록 실패</p>");
	      mav.addObject("img", "<img src='../img/fail.png'>");
	      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
	      mav.addObject("link2", "<input type='button' value='목록으로' onclick='location.href=\"./peoList.do?peoCode=" + dto.getPeoCode() + "\"'>");
	    }else {
	      mav.addObject("msg1", "<p>인물 등록 성공</p>");
	      mav.addObject("img", "<img src='../img/success.jpg'>");
	      mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"./peoList.do\"'>");      
	    }
	    return mav;
	       
	 }//createProc() end
	
	@RequestMapping("/people/peoList.do")
	 public ModelAndView list(PeopleDTO dto) {
	     ModelAndView mav = new ModelAndView();
	     mav.setViewName("people/peoList");
	     ArrayList<PeopleDTO> list = dao.list();
	     mav.addObject("list", list);
	     return mav;
	 }//list() end
	
	
	@RequestMapping(value="/people/peoRead.do", method=RequestMethod.GET)
	 public ModelAndView read(PeopleDTO dto) {
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("people/peoRead");
		 dto = dao.read(dto); 
		 mav.addObject("dto", dto);
		 return mav;    
	 }//read() end
	
	@RequestMapping(value="/people/delete.do", method=RequestMethod.GET)
	 public ModelAndView deleteForm(PeopleDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("people/deleteForm");
	    dto = dao.read(dto); 
	    mav.addObject("dto", dto);
	    return mav;    
	 }//deleteForm() end
	
	@RequestMapping(value="/people/delete.do", method=RequestMethod.POST)
	  public ModelAndView deleteProc(PeopleDTO dto) {
	  ModelAndView mav = new ModelAndView();
	    mav.setViewName("people/msgView");
	    int cnt = dao.delete(dto);
	    if(cnt==0) {
	      mav.addObject("msg1", "<p>인물 삭제 실패</p>");
	      mav.addObject("img", "<img src='../img/fail.png'>");
	      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
	      mav.addObject("link2", "<input type='button' value='목록' onclick='location.href=\"./peoList.do\"'>");
	    }else {
	      mav.addObject("msg1", "<p>인물 삭제 성공</p>");
	      mav.addObject("img", "<img src='../img/success.jpg'>");
	      mav.addObject("link2", "<input type='button' value='목록' onclick='location.href=\"./peoList.do\"'>");
	    }//if end
	    return mav;    
	 }//deleteProc() end
	
	 @RequestMapping(value="/people/update.do", method=RequestMethod.GET)
	  public ModelAndView updateForm(PeopleDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("people/updateForm");
	    mav.addObject("root", Utility.getRoot());
	    mav.addObject("getPeoCode", dto.getPeoCode());   
	    dto = dao.read(dto); 
	    mav.addObject("dto", dto);
	    return mav;    
	  }//deleteForm() end
	  
	  @RequestMapping(value="/people/update.do", method=RequestMethod.POST)
	  public ModelAndView updateProc(PeopleDTO dto, HttpServletRequest req) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("people/msgView");
	    mav.addObject("root", Utility.getRoot());
	    //------------------------------------------------------------    
		//전송된 파일이 저장되는 실제 경로
		  String basePath = req.getRealPath("/people/storage");
		//<input type='file' name='posterMF'>
		  MultipartFile posterMF = dto.getPosterMF();
		  String peoPic = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		  dto.setPeoPic(peoPic);
		  dto.setFilesize(posterMF.getSize());
		//------------------------------------------------------------   
				
		int cnt = dao.update(dto);
	    
		if(cnt==0) {
	      mav.addObject("msg1", "<p>인물 수정 실패</p>");
	      mav.addObject("img", "<img src='../img/fail.png'>");
	      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
	      mav.addObject("link2", "<input type='button' value='인물목록' onclick='location.href=\"./peoList.do\"'>");
	    }else {
	      mav.addObject("msg1", "<p>인물 수정 성공</p>");
	      mav.addObject("img", "<img src='../img/success.jpg'>");
	      mav.addObject("link2", "<input type='button' value='인물목록' onclick='location.href=\"./peoList.do\"'>");
	    }//if end
	    return mav;    
	  }//updateProc() end
	
	  @RequestMapping(value="/people/peoSearch.do", method=RequestMethod.GET)
	  public ModelAndView peolist() {
	    ModelAndView mav = new ModelAndView();
	    ArrayList<PeopleDTO> list = dao.peolist();
	    
	    // 페이지 이동 및 값 올리기
	    mav.addObject("list", list);
	    mav.setViewName("people/peoSearch");  // .do 명령어로 이동시 "redirect:" 사용
	    return mav;
	  }//uidSearch() end
	  
	  // 쿠폰 등록 또는 수정시 필요한 회원 아이디 검색하기 (AJAX 구방식)
	  @RequestMapping(value="/people/peoresult.do")
	  public ModelAndView peoresult(HttpServletRequest req, HttpServletResponse resp, String searchfield) {
	    // uid 목록을 resultList에 저장
		ArrayList<PeopleDTO> resultList = new ArrayList<PeopleDTO>();
	    try {
	      // 입출력하는 데이터의 문자코드셋을 UTF-8 로 지정
	      req.setCharacterEncoding("UTF-8");
	      
	      // 검색어 가져오기
	      /*req.getParameter("searchfield").trim(); 매개변수로 가져옴 */
	      //System.out.println("CouponCont : searchfield : " + searchfield);
	      
	      // DB값 가져오기
	      if(searchfield.length() <= 0) { // 검색어가 없으면 전체 uid 목록
	    	  resultList = dao.peolist();
	          //System.out.println("PeopleCont 0 : resultList.get(0) : " + resultList.get(0).getPeoName());
	      } else if(searchfield.length()>0) { // 검색어가 있으면 검색된 uid 목록
	    	  resultList = dao.peosearch(searchfield);
	          //System.out.println("PeopleCont 1 : resultList.get(0) : " + resultList.get(0).getPeoName());
	      }//if end
	    }catch (Exception e) {
	      System.out.println("실패:" + e);
	    }//try end
	    //System.out.println("CouponCont : resultList.toString() : "+resultList.toString());
	    
	    // 페이지 이동 및 값 올리기
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("resultList", resultList);
	    mav.setViewName("people/peoSearchTable");  // .do 명령어로 이동시 "redirect:" 사용
	    return mav;
	  }//peoresult() end

}//class end
