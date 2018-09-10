package kr.co.moviemovit.book;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookCont {
  
  @Autowired  // 의존 관계를 자동으로 연결 및 객체 자동 생성
  BookDAO dao;

  public BookCont() {
    System.out.println("---------- BookCont() 객체 생성");
  }//default constructor
  
  
/*********************************** 예매 목록 *********************************************/
  // 결과확인 http://localhost:9090/moviemovit/book/list.do
  @RequestMapping(value="/book/list.do")
  public ModelAndView list(BookDTO dto) {
      ModelAndView mav = new ModelAndView();
      ArrayList<BookDTO> list = dao.list();
      mav.setViewName("book/bookList");
      mav.addObject("list", list);
      return mav; 
  }//list() end
  
  
/************************************ 등록 *************************************************/
  // 오늘 날짜를 2018-08-31 형식의 String으로 반환하는 함수
  /*private String today() {
    Calendar cal = new GregorianCalendar(Locale.KOREA);
    int y = cal.get(Calendar.YEAR);
    int m = cal.get(Calendar.MONTH)+1;
    int d = cal.get(Calendar.DATE);
    
    String startDate = "" + y;
    if(m<10) {
      startDate += "-0" + m;
    } else {
      startDate += "-" + m;
    }//if end
    if(d<10) {
      startDate += "-0" + d;
    } else {
      startDate += "-" + d;
    }//if end
    
    return startDate;
  }//today() end
  *//*
  // 오늘+1년 후의 날짜를 2019-08-31 형식의 String으로 반환하는 함수
  private String afterYear() {
    Calendar cal = new GregorianCalendar(Locale.KOREA);
    int y = cal.get(Calendar.YEAR);
    int m = cal.get(Calendar.MONTH)+1;
    int d = cal.get(Calendar.DATE);
    
    String expDate   = "" + (y+1);
    if(m<10) {
      expDate   += "-0" + m;
    } else {
      expDate   += "-" + m;
    }//if end
    if(d<10) {
      expDate   += "-0" + d;
    } else {
      expDate   += "-" + d;
    }//if end
    
    return expDate;
  }//afterYear() end
  *//*
  // 쿠폰 등록하는 폼
  @RequestMapping(value="/coupon/create.do", method=RequestMethod.GET)  // link 클릭해서 넘어오는건 다 GET 방식
  public ModelAndView createForm(HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    
    // startDate 기본값 오늘날짜로 세팅, expDate 기본값 오늘날짜 + 1년후로 세팅
    String startDate = today();
    String expDate   = afterYear();
    
    // 페이지 이동 및 값 올리기
    mav.addObject("startDate", startDate);
    mav.addObject("expDate", expDate);
    mav.setViewName("coupon/couponForm");
    return mav;  // /coupon/couponForm.jsp
  }//createForm() end
  *//*
  // 쿠폰 등록 DB INSERT
  @RequestMapping(value="/coupon/create.do", method=RequestMethod.POST)
  public ModelAndView createProc(CouponDTO dto) {
    ModelAndView mav = new ModelAndView();
    
    // 입력된 데이터가 없으면 오늘 날짜, 오늘날짜+1년후로 세팅
    if(dto.getStartDate().equals("")) {
      dto.setStartDate(today());
    }
    if(dto.getExpDate().equals("")) {
      dto.setExpDate(today());
    }
    
    int count = dao.create(dto);
    mav.addObject("count", count);
    
    String msg = "";
    if(count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('쿠폰등록에 실패하였습니다.');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    }else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('쿠폰이 등록되었습니다.');";
      msg += "  window.location='./list.do';";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    }//if end
    return mav;
  }//createProc() end
  *//*
  // 쿠폰 등록 또는 수정시 필요한 회원 아이디 목록 가져오기
  @RequestMapping(value="/coupon/uidSearch.do", method=RequestMethod.GET)
  public ModelAndView uidlist() {
    ModelAndView mav = new ModelAndView();
    ArrayList<String> list = dao.uidlist();
    
    // 페이지 이동 및 값 올리기
    mav.addObject("list", list);
    mav.setViewName("coupon/uidSearch");  // .do 명령어로 이동시 "redirect:" 사용
    return mav;
  }//uidSearch() end
  *//*
  // 쿠폰 등록 또는 수정시 필요한 회원 아이디 검색하기 (AJAX 구방식)
  @RequestMapping(value="/coupon/uidresult.do")
  public ModelAndView uidresult(HttpServletRequest req, HttpServletResponse resp) {
    // uid 목록을 resultList에 저장
    ArrayList<String> resultList = new ArrayList<String>();
    try {
      // 입출력하는 데이터의 문자코드셋을 UTF-8 로 지정
      req.setCharacterEncoding("UTF-8");
      
      // 검색어 가져오기
      String searchfield = req.getParameter("searchfield").trim();
      //System.out.println("CouponCont : searchfield : " + searchfield);
      
      // DB값 가져오기
      if(searchfield.length() <= 0) { // 검색어가 없으면 전체 uid 목록
        resultList = dao.uidlist();
        //System.out.println("CouponCont : resultList.get(0) : " + resultList.get(0));
      } else if(searchfield.length()>0) { // 검색어가 있으면 검색된 uid 목록
        resultList = dao.uidsearch(searchfield);
        //System.out.println("CouponCont : resultList.get(0) : " + resultList.get(0));
      }//if end
    }catch (Exception e) {
      System.out.println("실패:" + e);
    }//try end
    //System.out.println("CouponCont : resultList.toString() : "+resultList.toString());
    
    // 페이지 이동 및 값 올리기
    ModelAndView mav = new ModelAndView();
    mav.addObject("resultList", resultList);
    mav.setViewName("coupon/uidSearchTable");  // .do 명령어로 이동시 "redirect:" 사용
    return mav;
  }//uidresult() end
*/
  
/************************************ 수정 *************************************************/
  // 쿠폰 수정하는 폼
  /*@RequestMapping(value="/coupon/update.do", method=RequestMethod.GET)  // link 클릭해서 넘어오는건 다 GET 방식
  public ModelAndView updateForm(int cCode) {
    ModelAndView mav = new ModelAndView();
    CouponDTO dto = dao.read(cCode);
    mav.addObject("dto", dto);
    mav.setViewName("coupon/couponUpdate");
    return mav;  // /coupon/couponUpdate.jsp
  }//updateForm() end
  *//*
  // 쿠폰 수정 DB UPDATE
  @RequestMapping(value="/coupon/update.do", method=RequestMethod.POST)
  public ModelAndView updateProc(CouponDTO dto) {
    ModelAndView mav = new ModelAndView();
    System.out.println("dto.getStartDate() : "+dto.getStartDate());
    
    // 입력된 데이터가 없으면 오늘 날짜, 오늘날짜+1년후로 세팅
    if(dto.getStartDate().equals("")) {
      dto.setStartDate(today());
    }
    if(dto.getExpDate().equals("")) {
      dto.setExpDate(today());
    }
    
    int count = dao.update(dto);
    mav.addObject("count", count);
    
    String msg = "";
    if(count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('쿠폰수정에 실패하였습니다.');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    }else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('쿠폰수정이 완료되었습니다.');";
      msg += "  window.location='./list.do';";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    }//if end
    return mav;
  }//updateProc() end
  */
  
/************************************ 삭제 *************************************************/
  // 쿠폰 삭제 확인창 폼
  /*@RequestMapping(value="/coupon/delete.do", method=RequestMethod.GET)  // link 클릭해서 넘어오는건 다 GET 방식
  public ModelAndView deleteForm(int cCode) {
    ModelAndView mav = new ModelAndView();
    String msg = "";
    msg += "<!DOCTYPE html>";
    msg += "<html><body>";
    msg += "<script>";
    msg += "  var bResult = confirm('정말 삭제하시겠습니까? 삭제된 쿠폰은 복구되지 않습니다.');";
    msg += "  if (bResult == true) {";  // 예를 누른 경우
    msg += "    window.location='./deleteProc.do?cCode="+cCode+"';";
    msg += "  } else {";  // 아니오를 누른 경우
    msg += "    history.go(-1);";
    msg += "  }";
    msg += "</script>";
    msg += "</html></body>";
    mav.addObject("msg", msg);
    mav.setViewName("msgView");
    return mav;
  }//updateForm() end
  *//*
  // 쿠폰 삭제 DB DELETE
  @RequestMapping(value="/coupon/deleteProc.do", method=RequestMethod.GET)
  public ModelAndView deleteProc(int cCode) {
    ModelAndView mav = new ModelAndView();
    int count = dao.delete(cCode);
    mav.addObject("count", count);
    
    String msg = "";
    if(count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('쿠폰삭제가 실패하였습니다.');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
    }else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('쿠폰삭제가 완료되었습니다.');";
      msg += "  window.location='./list.do';";
      msg += "</script>";
      msg += "</html></body>";
    }//if end
    mav.addObject("msg", msg);
    mav.setViewName("msgView");
    return mav;
  }//deleteProc() end
  */
}//class end
