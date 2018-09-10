package kr.co.moviemovit.screen;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.review.CinemaDTO;

@Controller
public class ScreenCont {
	@Autowired
	ScreenDAO dao;
	
	public ScreenCont() {
		System.out.println("---ScreenCont() 객체 생성");
	}//기본 생성자
	
	//상영시간은 3일마다 데이터 지우기
	//결과확인
	//http://localhost:9090/moviemovit/screen/screenform.do
	
	//1-1) 상영시간 등록 폼
	@RequestMapping(value="/screen/screenform.do", method = RequestMethod.GET)
	public ModelAndView screenForm() {
		ModelAndView mav = new ModelAndView();
		
		/*
			screenTable에서 상영관 등록 과정
			- 영화관 브랜드명은 screenForm.jsp에서 입력한 값
			- 영화관 지점명은 cinemaTable -> DB저장 시 영화관 지점 코드로 등록(하단 명령어 이용)
			- 상영관 이름은 screenForm.jsp에서 입력한 값
			  그래서 screenTable의 상영관 칼럼에 위의 두 결과값을 where절로 찾아서 저장하는 방식으로!
			- 영화이름은 별도의 창을 띄워서 movieTable에서 검색해서 등록하도록!
		*/		
		mav.setViewName("screen/screenForm");
		return mav;
	}//screenForm() end
	
	//1-2) 영화관 브랜드명을 클릭하면 해당 지점만 출력
	@RequestMapping(value="/screen/cineNameList.do", method = RequestMethod.POST)
	public void cineNameList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{		
		//screenForm.jsp에서 넘긴 brandName받음
		String brandName = req.getParameter("brandName");

		
		//CinemaDTO에 brandName set하기
		CinemaDTO dto = new CinemaDTO();
		
		//DB에서 영화관 브랜드에 해당하는 지점 가져오기
		ArrayList<CinemaDTO> cineList = dao.cineNameList(brandName);
		
		//screenForm.jsp에 보낼 값
		String cineMsg = "";
		if(cineList!=null) {
			cineMsg += "<select id='cineName' name='cineName'>";
			cineMsg += "		<option value='0'>선택하세요</option>";
			for(int idx = 0; idx<cineList.size(); idx++) {
				dto = cineList.get(idx);
				cineMsg += "<option value='" + dto.getCineCode() + "'>" + dto.getCineName() + "</option>";
			}
			cineMsg += "</select>";
		}else {
			cineMsg += "해당 브랜드의 지점을 가져오는데 실패했습니다";
		}//if end
        
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(cineMsg);
		out.flush();
		out.close();
		
	}//cineNameList() end
	
}//class end
