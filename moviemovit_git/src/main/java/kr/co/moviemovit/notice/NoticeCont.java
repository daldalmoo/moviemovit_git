package kr.co.moviemovit.notice;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.user.UserDAO;
import kr.co.moviemovit.user.UserDTO;



@Controller
public class NoticeCont {
  @Autowired
  NoticeDAO dao;
UserDAO ddao;
  
  
  public NoticeCont() {
    System.out.println("---NoticeCont()객체생성");
  }

  // 결과확인
  // http://localhost:9090/moviemovit/notice/create.do
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/admincreateForm");
    return mav;
  }// create() end

  // 리스트에 createform에서 가져온정보를 리스트에 넣기
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView createProc(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/notice/adminlist.do");

    int count = dao.create(dto);
    mav.addObject("count", count);
    return mav;
  }// createProc() end

  // 리스트목록과 페이지수 뿌리기
  @RequestMapping(value = "/notice/list.do")
  public ModelAndView list(NoticeDTO dto, @RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {
    /* HttpSession session = request.getSession(); */
    ModelAndView mav = new ModelAndView();

    int listCnt = dao.listCnt();
    System.out.println("listCnt = " + listCnt);
    System.out.println("curPage = " + curPage);

    NoticePage noticepage = new NoticePage(listCnt, curPage);
    // dto.

    ArrayList<NoticeDTO> list = dao.list(noticepage);
    System.out.println("list.toString()" + list.toString());

  /*HttpSession session=request.getSession();
    user=ddao.loginProc(user);
    // 세션에서 s_grade == "ADMIN"
    String a = (String) session.getAttribute("s_grade");
    System.out.println(a);
    if(a.equals("ADMIN")) { */
   mav.setViewName("notice/list");
   mav.addObject("list",list);
   mav.addObject("noticepage",noticepage);
    
    
    mav.setViewName("notice/list");
    mav.addObject("list", list);
    mav.addObject("noticepage", noticepage);
    
    return mav;
  }// list() end

  
  @RequestMapping(value = "/notice/adminlist.do")
  public ModelAndView adminlist(NoticeDTO dto, @RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {
    /* HttpSession session = request.getSession(); */
    ModelAndView mav = new ModelAndView();

    int listCnt = dao.listCnt();
    System.out.println("listCnt = " + listCnt);
    System.out.println("curPage = " + curPage);

    NoticePage noticepage = new NoticePage(listCnt, curPage);
    // dto.

    ArrayList<NoticeDTO> list = dao.list(noticepage);
   
    System.out.println("list.toString()" + list.toString());
  

 
 /* HttpSession session=request.getSession();
    user=ddao.loginProc(user);
    // 세션에서 s_grade == "ADMIN"
    String a = (String) session.getAttribute("s_grade");
    System.out.println(a);
    if(a.equals("ADMIN")) { 
   mav.setViewName("admin/noticeList");
   mav.addObject("list",list);
   mav.addObject("noticepage",noticepage);
    }else {*/
    
    mav.setViewName("notice/adminlist");
    mav.addObject("list",list);
    mav.addObject("noticepage", noticepage);
   /* }*/
    return mav;
  }// list() end
  // 상세보기
  @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
  public ModelAndView read(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/read");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// read() end

  
  @RequestMapping(value = "/notice/adminread.do", method = RequestMethod.GET)
  public ModelAndView adminread(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/adminread");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// read() end
  // 삭제목록가져오기
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.GET)
  public ModelAndView deleteForm(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/admindeleteForm");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// deleteForm() end

  // 삭제
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView deleteProc(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:adminlist.do");

    int cnt = dao.delete(dto);
    String msg = "";
    if (cnt == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('삭제 실패했습니다');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");

    } // if end
    return mav;
  }// deleteProc() end

  // 수정목록 가져오기
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
  public ModelAndView updateForm(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/adminupdateForm");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// deleteForm() end

  // 수정
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
  public ModelAndView updateProc(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();

    int cnt = dao.update(dto);

    String msg = "";
    if (cnt == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('수정 실패했습니다');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/notice/adminlist.do");
    } // if end
    return mav;
  }// updateProc() end

}// class end
