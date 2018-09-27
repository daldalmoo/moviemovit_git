package kr.co.moviemovit.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeCont {
  @Autowired
  NoticeDAO dao;

  public NoticeCont() {
    System.out.println("---NoticeCont()��ü����");
  }

  // ���Ȯ��
  // http://localhost:9090/moviemovit/notice/create.do
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/createForm");
    return mav;
  }// create() end

  // ����Ʈ�� createform���� ������������ ����Ʈ�� �ֱ�
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView createProc(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/notice/list.do");

    int count = dao.create(dto);
    mav.addObject("count", count);
    return mav;
  }// createProc() end

  // ����Ʈ��ϰ� �������� �Ѹ���
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

    mav.setViewName("notice/list");
    mav.addObject("list", list);
    mav.addObject("noticepage", noticepage);
    return mav;
  }// list() end

  // �󼼺���
  @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
  public ModelAndView read(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/read");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// read() end

  // ������ϰ�������
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.GET)
  public ModelAndView deleteForm(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/deleteForm");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// deleteForm() end

  // ����
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView deleteProc(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:list.do");

    int cnt = dao.delete(dto);
    String msg = "";
    if (cnt == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� �����߽��ϴ�');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");

    } // if end
    return mav;
  }// deleteProc() end

  // ������� ��������
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
  public ModelAndView updateForm(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/updateForm");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// deleteForm() end

  // ����
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
  public ModelAndView updateProc(NoticeDTO dto) {
    ModelAndView mav = new ModelAndView();

    int cnt = dao.update(dto);

    String msg = "";
    if (cnt == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� �����߽��ϴ�');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/notice/list.do");
    } // if end
    return mav;
  }// updateProc() end

}// class end
