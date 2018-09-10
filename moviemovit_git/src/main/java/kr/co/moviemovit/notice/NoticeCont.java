package kr.co.moviemovit.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeCont {
	@Autowired
	NoticeDAO dao;

	public NoticeCont() {
		System.out.println("---NoticeCont() �뜝�럥占쎈뿰�삕占쎈뿰�삕占쏙옙");
	}// 占쎈쐻占쎈쑆癰귣ŀ�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲

	// 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼍�뜝�뜴�쐻占쎈짗占쎌굲
	// http://localhost:9090/notice5/notice/create.do

	/*
	 * //1) 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲
	 * 
	 * @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
	 * public String createForm() { return "notice/createForm"; }// create() end
	 */

	@RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/createForm");
		return mav;
	}// create() end

	// 2) 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 筌ｏ옙
	@RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/notice/list.do");

		int count = dao.create(dto);
		mav.addObject("count", count);
		return mav;
	}// createProc() end

	// 3) 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
	@RequestMapping(value = "/notice/list.do")
	public  ModelAndView list(NoticeDTO dto, @RequestParam(defaultValue="1") int curPage,
            HttpServletRequest request )throws Exception{
		
        HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		int listCnt = dao.listCnt();
		System.out.println("listCnt = "+listCnt);
		System.out.println("curPage = "+curPage);
		
		NoticePage noticepage = new NoticePage(listCnt, curPage);
	    //dto.
		
		
		ArrayList<NoticeDTO> list = dao.list(noticepage);
		System.out.println("list.toString()" + list.toString());
		
		mav.setViewName("notice/list");
		mav.addObject("list", list);
		mav.addObject("noticepage", noticepage);
		return mav;
	}// list() end


	// 4) 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈＋占쎄쉭�뇡�빘�굲占쎈쐻占쎈짗占쎌굲
	@RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
	public ModelAndView read(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/read");
		dto = dao.read(dto);
		mav.addObject("dto", dto);
		return mav;
	}// read() end

	@RequestMapping(value = "/notice/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/deleteForm");
		dto = dao.read(dto);
		mav.addObject("dto", dto);
		return mav;
	}// deleteForm() end

	@RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
	public ModelAndView deleteProc(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:list.do");

		int cnt = dao.delete(dto);
		if (cnt == 0) {
			mav.addObject("msg1", "<p>怨듭��궗�빆 �궘�젣 �떎�뙣</p>");
			mav.addObject("img", "<img src='../img/fail.png'>");
			mav.addObject("link1","<input type='button' value='�떎�떆�떆�룄' onclick='javascript:history.back()'>");
			mav.addObject("link2","<input type='button' value='怨듭�紐⑸줉' onclick='location.href=\"./list.do\"'>");
		} else {
			mav.addObject("msg1", "<p>怨듭��궗�빆 �궘�젣 �꽦怨�</p>");
			mav.addObject("img", "<img src='../img/sound.png'>");
			mav.addObject("link1","<input type='button' value='怨듭��벑濡�' onclick='location.href=\"./create.do\"'>");
			mav.addObject("link2","<input type='button' value='怨듭�紐⑸줉' onclick='location.href=\"./list.do\"'>");
		} // if end
		return mav;
	}// deleteProc() end

	@RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
	public ModelAndView updateForm(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/updateForm");
		dto = dao.read(dto);
		mav.addObject("dto", dto);
		return mav;
	}// deleteForm() end

	@RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
	public ModelAndView updateProc(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.update(dto);
		if(cnt == 0) {
		String msg = "�닔�젙�떎�뙣�뻽�뒿�땲�떎";
		mav.addObject("msg", msg);
		mav.setViewName("./notice/updateForm");
	} else {
		 
		String msg="�닔�젙�뻽�뒿�땲�떎";
		mav.addObject("msg", msg);
	mav.setViewName("redirect:list.do");
	}
		return mav;
	}// updateProc() end
	
	 /*@RequestMapping(value="/notice/list.do")
	    
	    public String noticelist(@ModelAttribute("noticeVO") NoticeVO noticeVO,
	            @RequestParam(defaultValue="1") int curPage,
	            HttpServletRequest request,Model model) throws Exception{
	        
	        HttpSession session = request.getSession();
	        LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
	 
	        // �쟾泥대━�뒪�듃 媛쒖닔
	        int listCnt = boardServiceImpl.selectBoardListCnt(boardVO);
	        
	        Pagination pagination = new Pagination(listCnt, curPage);
	        
	        boardVO.setStartIndex(pagination.getStartIndex());
	        boardVO.setCntPerPage(pagination.getPageSize());
	        // �쟾泥대━�뒪�듃 異쒕젰
	        List<BoardVO> list = boardServiceImpl.selectBoardList(boardVO);
	                
	        model.addAttribute("list", list);
	        model.addAttribute("listCnt", listCnt);
	        model.addAttribute("loginVO", loginVO);
	        
	        model.addAttribute("pagination", pagination);
	        
	        return "board/boardList";
	    }*/
	
}// class end
