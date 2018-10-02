package kr.co.moviemovit.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.moviemovit.coupon.CouponDTO;
import kr.co.moviemovit.movie.MovieDTO;
import kr.co.moviemovit.review.CinemaDTO;
import kr.co.moviemovit.user.UserDTO;
import kr.co.moviemovit.screen.ScreenDTO;
import net.utility.Utility;

@Controller
public class TicketCont {
  
  @Autowired  // ���� ���踦 �ڵ����� ���� �� ��ü �ڵ� ����
  TicketDAO dao;

  public TicketCont() {
    System.out.println("---------- TicketCont() ��ü ����");
  }//default constructor
  
  
/*********************************** ���� ��� *********************************************/
  // ���Ȯ�� http://localhost:9090/moviemovit/ticket/list.do
  @RequestMapping(value="/ticket/list.do")
  public ModelAndView list(TicketDTO dto) {
      ModelAndView mav = new ModelAndView();
      ArrayList<TicketDTO> list = dao.list();
      mav.setViewName("ticket/ticketList");
      mav.addObject("list", list);
      return mav; 
  }//list() end
  
  
/************************************ ��� *************************************************/
  @RequestMapping(value="/ticket/create.do", method = RequestMethod.GET)
  public ModelAndView ticketForm() {
    ModelAndView mav = new ModelAndView();
    
    // ��ȭ���
    ArrayList<MovieDTO> movieList = dao.movieList();
    mav.addObject("movieList", movieList);
    
    // ������
    ArrayList<CinemaDTO> cinemalist = dao.cinemaList();
    mav.addObject("cinemalist", cinemalist);
    
    // �ּ�1�� ���尳��
    HashMap<String,Integer> cinemacntmap = new HashMap<String, Integer>();
    cinemacntmap.put("all",dao.cinemacntFromAddr1("all"));  // ����
    cinemacntmap.put("SEO",dao.cinemacntFromAddr1("SEO"));  // ����
    cinemacntmap.put("GGD",dao.cinemacntFromAddr1("GGD"));  // ��⵵
    cinemacntmap.put("ICH",dao.cinemacntFromAddr1("ICH"));  // ��õ
    cinemacntmap.put("GWD",dao.cinemacntFromAddr1("GWD"));  // ������
    cinemacntmap.put("CCD",dao.cinemacntFromAddr1("CCD"));  // ��û��
    cinemacntmap.put("GSD",dao.cinemacntFromAddr1("GSD"));  // ���
    cinemacntmap.put("JLD",dao.cinemacntFromAddr1("JLD"));  // ����
    cinemacntmap.put("JJD",dao.cinemacntFromAddr1("JJD"));  // ���ֵ�
    mav.addObject("cinemacntmap", cinemacntmap);
    
    mav.setViewName("ticket/ticketForm");
    return mav;
  }//ticketForm() end

  /* -------------------- ��ȭ���� �κ� AJAX -------------------- */

  /* -------------------- ��ȭ���� �κ� AJAX END -------------------- */

  /* -------------------- ���弱�� �κ� AJAX END -------------------- */
  // �ּ�1 ��� ��������
  @RequestMapping(value = "/ticket/addr1List.do", method = RequestMethod.POST)
  public void addr1List(HttpServletRequest req, HttpServletResponse resp, String addr1) throws IOException {
    String msg = "";
    
    if(addr1.equals("all")) { msg += "����"; }
    else if(addr1.equals("SEO")) { msg += "����"; }
    else if(addr1.equals("GGD")) { msg += "��⵵"; }
    else if(addr1.equals("ICH")) { msg += "��õ"; }
    else if(addr1.equals("GWD")) { msg += "������"; }
    else if(addr1.equals("CCD")) { msg += "��û��"; }
    else if(addr1.equals("GSD")) { msg += "���"; }
    else if(addr1.equals("JLD")) { msg += "����"; }
    else if(addr1.equals("JJD")) { msg += "���ֵ�"; }
    msg += "(<strong>"+dao.cinemacntFromAddr1(addr1)+"</strong>)";
    
    msg += "|";
    
    msg += "<ul>";
    msg += "  <li value='all' style='border-bottom: 1px dotted gray;'>����(<strong>"+dao.cinemacntFromAddr1("all")+"</strong>)</li>";
      msg += "  <li value='SEO'>����(<strong>"+dao.cinemacntFromAddr1("SEO")+"</strong>)</li>";
    msg += "  <li value='GGD'>��⵵(<strong>"+dao.cinemacntFromAddr1("GGD")+"</strong>)</li>";
      msg += "  <li value='ICH'>��õ(<strong>"+dao.cinemacntFromAddr1("ICH")+"</strong>)</li>";
    msg += "  <li value='GWD'>������(<strong>"+dao.cinemacntFromAddr1("GWD")+"</strong>)</li>";
    msg += "  <li value='CCD'>��û��(<strong>"+dao.cinemacntFromAddr1("CCD")+"</strong>)</li>";
    msg += "  <li value='GSD'>���(<strong>"+dao.cinemacntFromAddr1("GSD")+"</strong>)</li>";
    msg += "  <li value='JLD'>����(<strong>"+dao.cinemacntFromAddr1("JLD")+"</strong>)</li>";
    msg += "  <li value='JJD'>���ֵ�(<strong>"+dao.cinemacntFromAddr1("JJD")+"</strong>)</li>";
    msg += "</ul>";
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//addr1List() end

  // ��ȭ���� -> �󿵱����� �ּ�1 ��� ��������
  @RequestMapping(value = "/ticket/addr1ListFromMovie.do", method = RequestMethod.POST)
  public void addr1ListFromMovie(HttpServletRequest req, HttpServletResponse resp, String addr1, int mCode) throws IOException {
    String msg = "";
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setmName(addr1);  // addr1�� mName�� ��Ƽ� ����
    
    if(addr1.equals("all")) { msg += "����"; }
    else if(addr1.equals("SEO")) { msg += "����"; }
    else if(addr1.equals("GGD")) { msg += "��⵵"; }
    else if(addr1.equals("ICH")) { msg += "��õ"; }
    else if(addr1.equals("GWD")) { msg += "������"; }
    else if(addr1.equals("CCD")) { msg += "��û��"; }
    else if(addr1.equals("GSD")) { msg += "���"; }
    else if(addr1.equals("JLD")) { msg += "����"; }
    else if(addr1.equals("JJD")) { msg += "���ֵ�"; }
    msg += "(<strong>"+dao.cinemacntFromAddr1Movie(dto)+"</strong>)";
    
    msg += "|";
    
    msg += "<ul>";
    dto.setmName("all");
    msg += "  <li value='all' style='border-bottom: 1px dotted gray;'>����(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("SEO");
    msg += "  <li value='SEO'>����(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("GGD");
    msg += "  <li value='GGD'>��⵵(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("ICH");
    msg += "  <li value='ICH'>��õ(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("GWD");
    msg += "  <li value='GWD'>������(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("CCD");
    msg += "  <li value='CCD'>��û��(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("GSD");
    msg += "  <li value='GSD'>���(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("JLD");
    msg += "  <li value='JLD'>����(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    dto.setmName("JJD");
    msg += "  <li value='JJD'>���ֵ�(<strong>" + dao.cinemacntFromAddr1Movie(dto) + "</strong>)</li>";
    msg += "</ul>";
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//addr1ListFromMovie() end

  // ü�μ��� -> �ּ�1 ��� ��������
  @RequestMapping(value = "/ticket/addr1ListFromChain.do", method = RequestMethod.POST)
  public void addr1ListFromChain(HttpServletRequest req, HttpServletResponse resp, String addr1, String CLMD) throws IOException {
    String msg = "";
    CinemaDTO dto = new CinemaDTO();
    dto.setCineCode(CLMD);
    dto.setAddr1(addr1);
    
    if(addr1.equals("all")) { msg += "����"; }
    else if(addr1.equals("SEO")) { msg += "����"; }
    else if(addr1.equals("GGD")) { msg += "��⵵"; }
    else if(addr1.equals("ICH")) { msg += "��õ"; }
    else if(addr1.equals("GWD")) { msg += "������"; }
    else if(addr1.equals("CCD")) { msg += "��û��"; }
    else if(addr1.equals("GSD")) { msg += "���"; }
    else if(addr1.equals("JLD")) { msg += "����"; }
    else if(addr1.equals("JJD")) { msg += "���ֵ�"; }
    msg += "(<strong>"+dao.cinemacntFromAddr1CLMD(dto)+"</strong>)";
    
    msg += "|";
    
    msg += "<ul>";
    dto.setAddr1("all");
    msg += "  <li value='all' style='border-bottom: 1px dotted gray;'>����(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("SEO");
    msg += "  <li value='SEO'>����(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("GGD");
    msg += "  <li value='GGD'>��⵵(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("ICH");
    msg += "  <li value='ICH'>��õ(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("GWD");
    msg += "  <li value='GWD'>������(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("CCD");
    msg += "  <li value='CCD'>��û��(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("GSD");
    msg += "  <li value='GSD'>���(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("JLD");
    msg += "  <li value='JLD'>����(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    dto.setAddr1("JJD");
    msg += "  <li value='JJD'>���ֵ�(<strong>" + dao.cinemacntFromAddr1CLMD(dto) + "</strong>)</li>";
    msg += "</ul>";

    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//addr1ListFromChain() end
  
  // �ּ�1 -> ���� ��� <ul> ��ü
  @RequestMapping(value = "/ticket/cinemaListFromAddr1.do", method = RequestMethod.POST)
  public void cinemaListFromAddr1(HttpServletRequest req, HttpServletResponse resp, String addr1) throws IOException {
    String msg = "";
    //System.out.println("TicketCont : addr1 : "+addr1);

    ArrayList<CinemaDTO> cinemalist = new ArrayList<CinemaDTO>();
    if (addr1.equals("all")) {
      cinemalist = dao.cinemaList();
    } else {
      cinemalist = dao.cinemaListFromAddr1(addr1);
    }//if end

    msg += "<ul>";
    for (int j = 0; j < cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<li value='" + cinema.getCineCode() + "'>";
      if (cinema.getBrandName().equals("CGV")) {
        msg += "CGV";
      } else if (cinema.getBrandName().equals("LOTTE")) {
        msg += "�Ե��ó׸�";
      } else if (cinema.getBrandName().equals("MEGABOX")) {
        msg += "�ް��ڽ�";
      } else if (cinema.getBrandName().equals("INDEP")) {
        msg += "������ȭ��";
      }//if end
      msg += " - " + cinema.getCineName();
      msg += "</li>";
    }//for end
    msg += "</ul>";
    
    if(cinemalist.size()==0) {  // �󿵱����� ������ �޼��� ���
      msg += "<div style='margin-top:5px; margin-left:15px; font-size:11pt;'>";
      msg += "  <strong>�󿵱����� �����ϴ�.";
      msg += "  <br>�ٸ� ������ ������ �ּ���.</strong>";
      msg += "</div>";
    }//if end

    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromAddr1() end

  // ��ȭ�ڵ�, �ּ�1 -> ���� ��� <ul> ��ü
  @RequestMapping(value="/ticket/cinemaListFromMovieAddr1.do", method = RequestMethod.POST)
  public void cinemaListFromMovieAddr1(HttpServletRequest req, HttpServletResponse resp, int mCode, String addr1) throws IOException {
    String msg = "";
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setmName(addr1);  // mName �� addr1 ��ƿ�
    ArrayList<CinemaDTO> cinemalist = dao.cinemaListFromMovieAddr1(dto);

    msg += "<ul>";
    for(int j=0; j<cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<li value='"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
    }//for end
    msg += "</ul>";
    
    if(cinemalist.size()==0) {  // �󿵱����� ������ �޼��� ���
      msg += "<div style='margin-top:5px; margin-left:15px; font-size:11pt;'>";
      msg += "  <strong>�󿵱����� �����ϴ�.";
      msg += "  <br>�ٸ� ������ ������ �ּ���.</strong>";
      msg += "</div>";
    }//if end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromMovieAddr1() end

  // ü�κ�, �ּ�1 -> ���� ��� <ul> ��ü
  @RequestMapping(value="/ticket/cinemaListFromChain.do", method = RequestMethod.POST)
  public void cinemaListFromChain(HttpServletRequest req, HttpServletResponse resp, String clmd, String addr1) throws IOException {
    String msg = "";
    CinemaDTO dto = new CinemaDTO();
    dto.setCineCode(clmd);
    dto.setAddr1(addr1);  // mName �� addr1 ��ƿ�
    ArrayList<CinemaDTO> cinemalist = dao.cinemaListFromCLMDAddr1(dto);
    
    msg += "<ul>";
    for(int j=0; j<cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<li value='"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
    }//for end
    msg += "</ul>";
    
    if(cinemalist.size()==0) {  // �󿵱����� ������ �޼��� ���
      msg += "<div style='margin-top:5px; margin-left:15px; font-size:11pt;'>";
      msg += "  <strong>������ �����ϴ�.";
      msg += "  <br>�ٸ� ü�� �Ǵ� ������ ������ �ּ���.</strong>";
      msg += "</div>";
    }//if end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromChain() end
  
  // ��ȭ�ڵ� -> ���� ��� cineCode�� | ���� ����
  @RequestMapping(value="/ticket/graycinemalist.do", method = RequestMethod.POST)
  public void grayCinemaList(HttpServletRequest req, HttpServletResponse resp, int mCode) throws IOException {
    String msg = "";
    
    ArrayList<CinemaDTO> grayCinemaList = dao.grayCinemaList(mCode);
    //System.out.println(cinemaSellist.get(0).getBrandName() + " - " + cinemaSellist.get(0).getCineName());
    for(int i=0; i<grayCinemaList.size(); i++) {
      CinemaDTO cinema = grayCinemaList.get(i);
      if(i==0) {
        msg += cinema.getCineCode();
      } else {
        msg += "|" + cinema.getCineCode();
      }//if end
    }//for end
    //System.out.println(msg);
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//grayCinemaList() end

  // ���� �˻�
  @RequestMapping(value="/ticket/cinemaSearch.do", method = RequestMethod.POST)
  public void cinemaSearch(HttpServletRequest req, HttpServletResponse resp, String key) throws IOException {
    String msg = "";
    key = key.toUpperCase();
    ArrayList<CinemaDTO> cinemalist = dao.cinemaSearch(key);
    
    msg += "<div style='height:40px; border-bottom:1px solid gray; color:black; padding: 6pt 0pt 0pt 12pt;'>";
    msg += "<strong style='color:#ff3f07;'> '"+key+"'</strong>";
    msg += "�� ���� �˻����";
    msg += "</div>";
    
    msg += "<ul style='padding-top:3px;'>";
    for(int j=0; j<cinemalist.size(); j++) {
      CinemaDTO cinema = cinemalist.get(j);
      msg += "<li value='"+cinema.getCineCode()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += " - "+cinema.getCineName();
      msg += "</li>";
    }//for end
    msg += "</ul>";
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//cinemaListFromMovieAddr1() end
  /* -------------------- ���弱�� �κ� AJAX END -------------------- */

  /* ------------------ ���� : ��¥���� �κ� ------------------ */
  // �󿵳�¥ ��� �����ͼ� | ���� ����
  @RequestMapping(value="/ticket/sdateAllList.do", method = RequestMethod.POST)
  public void sdateAllList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String msg = "";
    ArrayList<String> sdatelist = dao.sdateAllList();
    
    for(int j=0; j<sdatelist.size(); j++) {
      msg += sdatelist.get(j);
      if(j!=sdatelist.size()-1) {
        msg += "|";
      }//if end
    }//for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//sdateAllList() end
  
  // ��ȭ�ڵ� -> �󿵳�¥ �����ͼ� | ���� ����
  @RequestMapping(value = "/ticket/sdateListFromMovie.do", method = RequestMethod.POST)
  public void sdateListFromMovie(HttpServletRequest req, HttpServletResponse resp, int mCode) throws IOException {
    String msg = "";
    ArrayList<String> sdatelist = dao.sdateListFromMovie(mCode);
    
    for (int j = 0; j < sdatelist.size(); j++) {
      msg += sdatelist.get(j);
      if (j != sdatelist.size() - 1) {
        msg += "|";
      } // if end
    } // for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//sdateListFromMovie() end

  // �����ڵ� -> �󿵳�¥ �����ͼ� | ���� ����
  @RequestMapping(value = "/ticket/sdateListFromCinema.do", method = RequestMethod.POST)
  public void sdateListFromCinema(HttpServletRequest req, HttpServletResponse resp, String cineCode) throws IOException {
    String msg = "";
    ArrayList<String> sdatelist = dao.sdateListFromCinema(cineCode);
    
    for (int j = 0; j < sdatelist.size(); j++) {
      msg += sdatelist.get(j);
      if (j != sdatelist.size() - 1) {
        msg += "|";
      } // if end
    } // for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//sdateListFromCinema() end

  // ��ȭ�ڵ�,�����ڵ� -> �󿵳�¥ �����ͼ� | ���� ����
  @RequestMapping(value = "/ticket/sdateListFromMovieCinema.do", method = RequestMethod.POST)
  public void sdateListFromMovieCinema(HttpServletRequest req, HttpServletResponse resp, int mCode, String cineCode) throws IOException {
    String msg = "";
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setScreen(cineCode);
    ArrayList<String> sdatelist = dao.sdateListFromMovieCinema(dto);
    
    for (int j = 0; j < sdatelist.size(); j++) {
      msg += sdatelist.get(j);
      if (j != sdatelist.size() - 1) {
        msg += "|";
      } // if end
    } // for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//sdateListFromMovieCinema() end
  /* ------------------ ���� : ��¥���� �κ� END ------------------ */
  
  /* ------------------ ���� : �󿵽ð�ǥ �κ� ------------------ */
  // ��ȭ,����,��¥ -> ���� �󿵽��۽ð� <ul> ���
  @RequestMapping(value = "/ticket/screentimeRoom.do", method = RequestMethod.POST)
  public void screentimeRoom(HttpServletRequest req, HttpServletResponse resp, int mCode, String cineCode, String sdate) throws IOException {
    String msg = "";
    MovieDTO dto = new MovieDTO();
    dto.setmCode(mCode);
    dto.setScreen(cineCode); // ���� ����
    dto.setS_date(sdate);    // ���� ����
    ArrayList<ScreenDTO> stimelist = dao.screentimeRoom(dto);
    
    String tempPrevRoomCode = "";
    for (int i = 0; i < stimelist.size(); i++) {
      ScreenDTO screen =  stimelist.get(i);
      if(screen.getRoomCode().equals(tempPrevRoomCode)==false) {
        msg += "<dl>";
        msg += "  <dt>"+screen.getRoomCode()+" ��</dt>";
        msg += "  <dd>";
        msg += "    <ul>";
      }//if end
      msg += "      <li value='"+screen.getsCode()+"'>"+screen.getStime().substring(0, 2)+":"+screen.getStime().substring(2, 4)+"</li>";
      if(screen.getRoomCode().equals(tempPrevRoomCode)==false) {
        msg += "    </ul>";
        msg += "  </dd>";
        msg += "</dl>";
        tempPrevRoomCode = screen.getRoomCode();
      }//if end
    }//for end

    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//screentimeRoom() end
  /* ------------------ ���� : �󿵽ð�ǥ �κ� END ------------------ */

  /* -------------------- ���� : ��ȭ�������� �κ� -------------------- */
  // ��ȭ���� -> ��ȭ������|��ȭ�̸� ��������
  @RequestMapping(value="/ticket/movieposter.do", method = RequestMethod.POST)
  public void movieposter(HttpServletRequest req, HttpServletResponse resp, int mCode) throws IOException {
    String msg = "";
    String root = Utility.getRoot(); // /moviemovit
    
    MovieDTO dto = dao.MovieData(mCode);
    msg += root + "movie/img_poster/" + dto.getPoster();
    //msg += "/moviemovit/movie/storage/" + dto.getPoster();
    msg += "|";
    msg += dto.getmName();
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//movieposter() end
  /* -------------------- ���� : ��ȭ�������� �κ� END -------------------- */
  
  /* -------------------- �¼����� --------------------------------- */
  @RequestMapping(value="/ticket/create.do", method = RequestMethod.POST)
  public ModelAndView selectSeat(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    ModelAndView mav = new ModelAndView();
    String m_poster = req.getParameter("m_poster");
    String m_name = req.getParameter("m_name");
    String cine_name = req.getParameter("cine_name");
    String s_date = req.getParameter("s_date");
    int peocnt = Integer.parseInt(req.getParameter("peocnt"));
    int totalprice = Integer.parseInt(req.getParameter("totalprice"));
    String auditData = req.getParameter("auditData");
    mav.addObject("m_poster",m_poster);
    mav.addObject("m_name",m_name);
    mav.addObject("cine_name",cine_name);
    mav.addObject("s_date",s_date);
    mav.addObject("peocnt",peocnt);
    mav.addObject("totalprice",totalprice);
    mav.addObject("auditData",auditData);
    mav.setViewName("ticket/ticketSeat");
    return mav;
  }//selectSeat() end
  /* -------------------- �¼����� END -------------------- */  

  @RequestMapping(value="/ticket/payment.do", method = RequestMethod.POST)
  public ModelAndView payment(CouponDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
    ModelAndView mav = new ModelAndView();
    HttpSession session = req.getSession();

    int totalprice = Integer.parseInt(req.getParameter("totalprice"));
    String auditData = req.getParameter("auditData");
    // System.out.println("ticket Cont �¼����� : " + totalprice);

    // �α��εǾ session�� �ö� �� ��������
    String uid = (String) session.getAttribute("s_id");

    // uid,upw dto�� ���
    UserDTO udto = new UserDTO();
    udto.setUid(uid);

    // DB���� ȸ������ ��������
    udto = dao.getMemberInfo(udto);
    // System.out.println("ticketCont userid : " + udto.getUid());
    dto.setUid(udto.getUid());
    ArrayList<CouponDTO> couponList = dao.couponList(dto);

    // ������ �̵� �� �� �ø���
    mav.addObject("totalprice", totalprice);
    mav.addObject("couponList", couponList);
    mav.addObject("auditData", auditData);
    mav.setViewName("ticket/payment");
    return mav;
  }// payment() end
}//class end