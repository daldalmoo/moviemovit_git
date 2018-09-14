package kr.co.moviemovit.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.qna.QnaDAO;
import kr.co.moviemovit.qna.QnaDTO;
import kr.co.moviemovit.qna.QnaPage;

@Controller
public class QnaCont {
  @Autowired
  QnaDAO dao;

  public QnaCont() {
    System.out.println("---QnaCont() ��ü����");
  }// QnaCont


  @RequestMapping(value = "/qna/create.do", method = RequestMethod.GET)
  public ModelAndView create(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("qna/createForm");
    return mav;
  }// create() end
  
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.POST)
  public ModelAndView createProc(QnaDTO dto, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/qna/list.do");
    
    // �θ���϶� groupNo, indent, groupNum ����
    if(dto.getIndent()==0) {
      dto.setGroupNo(dao.groupNoMax());
      dto.setIndent(0);
      dto.setGroupNum(0);
    }//if end
    
    // ip ��������
    String ip = ip = request.getRemoteAddr();
    
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("Proxy-Client-IP");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("WL-Proxy-Client-IP");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("HTTP_CLIENT_IP");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getRemoteAddr();
    }
    if("0:0:0:0:0:0:0:1".equals(ip)){
    ip="127.0.0.1";
    }
    dto.setIp(ip);
    
    int count = dao.create(dto);
    mav.addObject("count", count);
    return mav;
  }// createProc() end

  @RequestMapping(value = "/qna/list.do")
  public ModelAndView list(QnaDTO dto, @RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {
    /*  HttpSession session = request.getSession();*/
    
    ModelAndView mav = new ModelAndView();

    int listCnt = dao.listCnt();
    //System.out.println("listCnt = "+listCnt);
    //System.out.println("curPage = "+curPage);

    QnaPage qnapage = new QnaPage(listCnt, curPage);

    ArrayList<QnaDTO> list = dao.list(qnapage);
    // System.out.println("list.toString()" + list.toString());

    mav.setViewName("qna/list");
    mav.addObject("list", list);
    mav.addObject("qnapage", qnapage);
    return mav;
  }// list() end

  @RequestMapping(value = "/qna/read.do", method = RequestMethod.GET)
  public ModelAndView read(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("qna/read");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// read() end

  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.GET)
  public ModelAndView deleteForm(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("qna/deleteForm");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// deleteForm() end

  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.POST)
  public ModelAndView deleteProc(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:list.do");

    int cnt = dao.delete(dto);
    if (cnt == 0) {
      mav.addObject("msg1", "<p>���� �����߽��ϴ�</p>");
      mav.addObject("img", "<img src='../img/fail.png'>");
      mav.addObject("link1", "<input type='button' value='1' onclick='javascript:history.back()'>");
      mav.addObject("link2", "<input type='button' value='2' onclick='location.href=\"./list.do\"'>");
    } else {
      mav.addObject("msg1", "<p>���� �Ǿ����ϴ�</p>");
      mav.addObject("img", "<img src='../img/sound.png'>");
      mav.addObject("link1", "<input type='button' value='1' onclick='location.href=\"./create.do\"'>");
      mav.addObject("link2", "<input type='button' value='2' onclick='location.href=\"./list.do\"'>");
    } // if end
    return mav;
  }// deleteProc() end

  @RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
  public ModelAndView updateForm(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("qna/updateForm");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// deleteForm() end

  @RequestMapping(value = "/qna/update.do", method = RequestMethod.POST)
  public ModelAndView updateProc(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();

    int cnt = dao.update(dto);
    if (cnt == 0) {
      String msg = "���� �����߽��ϴ�";
      mav.addObject("msg", msg);
      mav.setViewName("./qna/updateForm");
    } else {
      String msg = "���� �����߽��ϴ�.";
      mav.addObject("msg", msg);
      mav.setViewName("redirect:list.do");
    }
    return mav;
  }// updateProc() end

  @RequestMapping(value = "/qna/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(QnaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("qna/reply");
    dto = dao.read(dto);
    mav.addObject("dto", dto);
    return mav;
  }// create() end

  @RequestMapping(value = "/qna/reply.do", method = RequestMethod.POST)
  public ModelAndView replyProc(QnaDTO dto,HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    System.out.println("---------QnaCont 1 : dto.toString() : " + dto.toString());
    
    // ������� groupNum �����ϱ� ���� ����� ��ġ �ٷ� ���� groupNum�� GNpoint ������ ����
    int GNpoint = dto.getGroupNum();   // �θ� ����� �ϳ��� ���� �� �θ�� �ۼ����� ����
    ArrayList<QnaDTO> groupnolist = dao.groupNoList(dto);  // �θ�۰� ���� groupNo �� �θ�� �ۼ��� �̻��� �͸� �������� 
    System.out.println("---------QnaCont 2 : groupnolist.size() : "+groupnolist.size());
    
    for(int i=0; i<groupnolist.size(); i++) {
      //System.out.println("---------QnaCont 2 : groupNolist.get("+i+").toString() : "+groupNolist.get(i).toString());
      QnaDTO q = groupnolist.get(i);
      if(q.getIndent() > dto.getIndent()) {
        GNpoint = q.getGroupNum();
      }//if end
    }//for end
    
    System.out.println("---------QnaCont 3 : GNpoint : " + GNpoint);
    
    // ���� ���� ����� ��ġ�� �������� �� �÷����� �ۼ��� �ٽ� ���� Update
    int groupnumupdate = dao.groupNumUpdate(GNpoint+1);
    if(groupnumupdate==0) {
      System.out.println("DB Update GroupNum+1 ����");
    }else {
      System.out.println("DB Update GroupNum+1 ����");
    }//if end
    
    // ������� groupNum ����
    dto.setGroupNum(GNpoint+1);
    
    // ������� indent ����
    dto.setIndent(dto.getIndent()+1);
    
    // ������� groupNo �� �θ�۰� �����Ƿ� ���� ���� X
    
    System.out.println("---------QnaCont 4 : dto.toString() : " + dto.toString());
    
    int cnt = dao.create(dto); // DB�� insert
    
    // �������θ޼��� ����� �� !!!
    
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:./list.do");
    return mav;
  }// updateProc() end

}// class end